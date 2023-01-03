part of 'pages.dart';

class SliceOfLifeGenrePage extends StatefulWidget {
  const SliceOfLifeGenrePage({Key? key}) : super(key: key);

  @override
  _SliceOfLifeGenrePageState createState() => _SliceOfLifeGenrePageState();
}

class _SliceOfLifeGenrePageState extends State<SliceOfLifeGenrePage> {
  List<ListComic> listComic = [];
  int offset = 0;

  Future<List<ListComic>> fetchListComic(offset) async {
    await MangadexService.getSliceoflifeComic(offset).then((value) {
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
  dispose() {
    listComic.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slice of Life"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
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
            padding: EdgeInsets.all(10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 3,
                mainAxisSpacing: 3,
                childAspectRatio: 9 / 16),
            itemBuilder: (context, index) {
              return LazyLoadingList(
                loadMore: () {},
                child: GenreCard(listComic[index]),
                index: index,
                hasMore: true,
              );
            },
          ),
        ),
      ),
    );
  }
}
