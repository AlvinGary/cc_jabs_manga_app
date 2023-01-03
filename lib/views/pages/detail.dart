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
        body: Stack(
          children: [
            Container(
                height: double.infinity,
                width: double.infinity,
                child: Column(
                  children: [
                    Flexible(
                      child: CachedNetworkImage(
                        imageUrl: 'https://$image',
                        placeholder: (context, url) => UiLoading.loading(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                    Text(title ?? altTitle ?? "No Title"),
                    Text(author ?? "No Author"),
                    Text(artist ?? "No Artist"),
                    Text(rating ?? "No Rating"),
                    Wrap(
                      children: tag
                          .map((e) => UIChips.chip(e, Colors.grey))
                          .toList(),
                          spacing: 10,
                    )
                  ],
                )),
            isLoading ? UiLoading.loadingBlock() : Container(),
          ],
        ));
  }
}
