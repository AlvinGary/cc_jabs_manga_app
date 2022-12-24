part of 'widgets.dart';

class LatestCardView extends StatefulWidget {
  final ListComic listComic;
  const LatestCardView(this.listComic, {Key? key}) : super(key: key);

  @override
  State<LatestCardView> createState() => _LatestCardViewState();
}

class _LatestCardViewState extends State<LatestCardView> {
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
              padding: EdgeInsets.fromLTRB(8, 10, 8, 0),
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
                        width: 130,
                        height: 150,
                        decoration: BoxDecoration(
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
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(2, 4, 2, 0),
                      child: Text(
                        listComic.attributes!.title!.en ?? title ?? 'No Title',
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Spacer(),
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
                      child: Text(
                        "Latest Chapter: ${listComic.attributes!.lastChapter ?? 'No Chapter'}",
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              )),
        ));
  }
}
