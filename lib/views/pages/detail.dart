part of 'pages.dart';

class DetailPage extends StatefulWidget {
  final String manga_id;
  const DetailPage(this.manga_id, {Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  String image = "";
  String id = "";
  String author = "";
  String artist = "";
  String title = "";
  String altTitle = "";
  String desc = "";
  String status = "";
  String year = "";
  String rating = "";
  List tag = [];
  bool isLoading = false;

  Future<ComicDetail> getDetail() async {
    ComicDetail data = new ComicDetail();
    await MangadexService.getComicDetail(widget.manga_id).then((value) {
      setState(() {
        data = value;
      });
    });
    return data;
  }

  Future<Rating> getRating() async {
    Rating data = new Rating();
    await MangadexService.getComicRating(widget.manga_id).then((value) {
      setState(() {
        data = value;
      });
    });
    return data;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    isLoading = true;
    super.initState();
    getDetail().then((value) {
      setState(() {
        id = value.id.toString();
        for (var i = 0; i < value.relationships!.length; i++) {
          if (value.relationships![i].type == "author") {
            author = value.relationships![i].attributes!.name.toString();
          }
          if (value.relationships![i].type == "artist") {
            artist = value.relationships![i].attributes!.name.toString();
          }
          if (value.relationships![i].type == "cover_art") {
            image =
                "$coverUrl/${value.id}/${value.relationships![i].attributes!.fileName.toString()}.256.jpg";
          }
        }
        for (var i = 0; i < value.attributes!.tags!.length; i++) {
          tag.add(value.attributes!.tags![i].attributes!.tagname.toString());
        }
        for (var i = 0; i < value.attributes!.altTitles!.length; i++) {
          if (value.attributes!.altTitles![i].en != null) {
            altTitle = value.attributes!.altTitles![i].en.toString();
          }
          if (value.attributes!.altTitles![i].ja != null) {
            altTitle = value.attributes!.altTitles![i].ja.toString();
          }
          if (value.attributes!.altTitles![i].jaRo != null) {
            altTitle = value.attributes!.altTitles![i].jaRo.toString();
          }
        }
        title = value.attributes!.title!.en.toString() ??
            value.attributes!.title!.ja.toString() ??
            value.attributes!.title!.jaRo.toString();
        desc = value.attributes!.description!.en.toString();
        status = value.attributes!.status.toString();
        year = value.attributes!.year.toString();
      });
    });
    getRating().then((value) {
      setState(() {
        rating = value.bayesian!.toStringAsFixed(2);
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              width: double.infinity,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CachedNetworkImage(
                    width: 100,
                    height: 200,
                    imageUrl: 'https://$image',
                    placeholder: (context, url) => UiLoading.loading(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 200,
                          child: Text(
                            title ?? altTitle ?? "No Title",
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(author ?? "No Author"),
                        Text(artist ?? "No Artist"),
                        Text(""),
                        Text(
                          rating ?? "No Rating",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Wrap(
              direction: Axis.horizontal,
              children: tag.map((e) => UIChips.chip(e, Colors.orange)).toList(),
              spacing: 3,
              runSpacing: 5,
            ),
            Text(
              "Summary",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            Text(
              desc ?? "No Desc",
              maxLines: 20,
            ),
            Text(""),
            Text(
              "Chapter",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            Text(
              "Coming Soon",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            )
          ]),
        ),
      ),
    );
  }
}
