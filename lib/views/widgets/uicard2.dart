part of 'widgets.dart';

class CardViewLatest extends StatefulWidget {
  final ListComic listComic;
  const CardViewLatest(this.listComic, {Key? key}) : super(key: key);

  @override
  State<CardViewLatest> createState() => _CardViewLatestState();
}

class _CardViewLatestState extends State<CardViewLatest> {
  @override
  Widget build(BuildContext context) {
    ListComic listComic = widget.listComic;
    String filename = '';
    String title = '';
    for (var i = 0; i < listComic.relationships!.length; i++) {
      if (listComic.relationships![i].type == 'cover_art') {
        filename = listComic.relationships![i].attributes!.fileName.toString();
        break;
      }
    }
    for (var i = 0; i < listComic.attributes!.altTitles!.length; i++) {
      if (listComic.attributes!.altTitles![i].en != null) {
        title = listComic.attributes!.altTitles![i].en.toString();
        break;
      } else if (listComic.attributes!.altTitles![i].ja != null) {
        title = listComic.attributes!.altTitles![i].ja.toString();
        break;
      } else if (listComic.attributes!.altTitles![i].jaRo != null) {
        title = listComic.attributes!.altTitles![i].jaRo.toString();
        break;
      }
    }
    return Card(
        elevation: 5,
        color: Colors.orange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: () {},
          child: Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              color: Colors.orange,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 10,
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://${coverUrl}/${listComic.id}/${filename}.256.jpg',
                      imageBuilder: (context, imageProvider) => Container(
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) => UiLoading.loadingDD(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  Flexible(
                    flex: 4,
                    child: Text(
                      listComic.attributes!.title!.en ?? title ?? 'No Title',
                      // overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                      ),
                    ),
                  ),
                  Spacer(),
                  Flexible(
                    flex: 1,
                    child: Text(
                      "Latest Chapter: ${listComic.attributes!.lastChapter ?? 'No Chapter'}",
                      // overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ],
              )),
        ));
  }
}
