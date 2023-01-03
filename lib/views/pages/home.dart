part of 'pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ListComic> popularlist = [];
  List<ListComic> latestlist = [];
  int offset = 0;

  Future<List<ListComic>> fetchPopularList(offset) async {
    await MangadexService.getListPopularComic(offset).then((value) {
      if (value.isNotEmpty) {
        setState(() {
          popularlist.addAll(value);
        });
      }
    });
    return popularlist;
  }

  Future<List<ListComic>> fetchLatestList(offset) async {
    await MangadexService.getListLatestComic(offset).then((value) {
      if (value.isNotEmpty) {
        setState(() {
          latestlist.addAll(value);
        });
      }
    });
    return latestlist;
  }

  @override
  void initState() {
    fetchPopularList(offset);
    fetchLatestList(offset);
    super.initState();
  }

  @override
  void dispose() {
    popularlist.clear();
    latestlist.clear();
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
                height: 300,
                child: GridView.builder(
                  itemCount: popularlist.length,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.all(10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 2 / 1),
                  itemBuilder: (context, index) {
                    (popularlist.length == 0)
                        ? print("data kosong")
                        : print("data ada");
                    return LazyLoadingList(
                      loadMore: () {},
                      child: PopularCardView(popularlist[index]),
                      index: index,
                      hasMore: true,
                    );
                  },
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
            Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: NotificationListener<ScrollEndNotification>(
                  onNotification: (scrollEnd) {
                    final metrics = scrollEnd.metrics;
                    if (metrics.atEdge) {
                      bool isTop = metrics.pixels == 0;
                      if (isTop) {
                        print('At the top');
                        setState(() {
                          latestlist.clear();
                          offset = 0;
                          fetchLatestList(offset);
                        });
                      }
                    }
                    return true;
                  },
                  child: GridView.builder(
                    itemCount: latestlist.length,
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.all(6),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        childAspectRatio: 17 / 4),
                    itemBuilder: (context, index) {
                      (latestlist.length == 0)
                          ? print("data kosong")
                          : print("data ada");
                      return LazyLoadingList(
                        loadMore: () {},
                        child: LatestCardHome(latestlist[index]),
                        index: index,
                        hasMore: false,
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
