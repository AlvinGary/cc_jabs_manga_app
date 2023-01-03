part of 'pages.dart';

class DetailsPage extends StatefulWidget {
  final ListComic listcomic;
  const DetailsPage(this.listcomic);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  List<ComicDetail> comdet = [];
  int offset = 0;

  Future<List<ComicDetail>> fetchListComic(offset) async {
    await MangadexService.getListPopularComic(offset).then((value) {
      if (value.isNotEmpty) {
        setState(() {
          comdet.addAll(value);
        });
      }
    });
    return comdet;
  }
  @override
  Widget build(BuildContext context) {
    ListComic lc = widget.listcomic;
    
    String desc = '';
    for (var i = 0; i < lc.!.length; i++) {
      if (lc.relationships![i].type == 'cover_art') {
        desc = lc.relationships![i].attributes!.fileName.toString();
        break;
      }
    }
    return Scaffold(
      body: Column(children: [Text(lc.id.toString())]),
    );
  }
}
