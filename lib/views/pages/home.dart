part of 'pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ListComic> listComic = [];
  int offset = 0;

  Future<List<ListComic>> fetchListComic(offset) async {
    await MangadexService.getListPopularComic(offset).then((value) {
      if (value.isNotEmpty) {
        setState(() {
          listComic.addAll(value);
        });
      }
    });
    return listComic;
  }

  @override
  void initState() {
    fetchListComic(offset);
    super.initState();
  }

  @override
  void dispose() {
    listComic.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Divider(thickness: 2, color: Colors.black),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Popular",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PopularPage()));
                    },
                    child: Text(
                      "More...",
                      style: TextStyle(
                          color: Colors.deepPurple[600], fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 6),
            // show popular comic
            Container(
              width: double.infinity,
              height: 200,
              child: NotificationListener<ScrollEndNotification>(
                onNotification: (scrollEnd) {
                  final metrics = scrollEnd.metrics;
                  if (metrics.atEdge) {
                    bool isTop = metrics.pixels == 0;
                    if (isTop) {
                      print('At the top');
                      setState(() {
                        listComic.clear();
                        offset = 0;
                        fetchListComic(offset);
                      });
                    } else {
                      print('At the bottom');
                      setState(() {
                        offset += 20;
                        fetchListComic(offset);
                      });
                    }
                  }
                  return true;
                },
                child: GridView.builder(
                  itemCount: listComic.length,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.all(10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      crossAxisSpacing: 3,
                      mainAxisSpacing: 3,
                      childAspectRatio: 1.7),
                  itemBuilder: (context, index) {
                    (listComic.length == 0)
                        ? print("data kosong")
                        : print("data ada");
                    return LazyLoadingList(
                      loadMore: () {},
                      child: PopularCardView(listComic[index]),
                      index: index,
                      hasMore: true,
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 6),
            Divider(thickness: 2, color: Colors.black),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Latest Updates",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LatestPage()));
                    },
                    child: Text(
                      "More...",
                      style: TextStyle(
                          color: Colors.deepPurple[600], fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 4),
            // show latest update
            Container(
              width: double.infinity,
              height: 200,
              child: NotificationListener<ScrollEndNotification>(
                onNotification: (scrollEnd) {
                  final metrics = scrollEnd.metrics;
                  if (metrics.atEdge) {
                    bool isTop = metrics.pixels == 0;
                    if (isTop) {
                      print('At the top');
                      setState(() {
                        listComic.clear();
                        offset = 0;
                        fetchListComic(offset);
                      });
                    } else {
                      print('At the bottom');
                      setState(() {
                        offset += 20;
                        fetchListComic(offset);
                      });
                    }
                  }
                  return true;
                },
                child: GridView.builder(
                  itemCount: listComic.length,
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.all(6),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      crossAxisSpacing: 3,
                      mainAxisSpacing: 3,
                      childAspectRatio: 4.3),
                  itemBuilder: (context, index) {
                    (listComic.length == 0)
                        ? print("data kosong")
                        : print("data ada");
                    return LazyLoadingList(
                      loadMore: () {},
                      child: LatestCardHome(listComic[index]),
                      index: index,
                      hasMore: true,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
