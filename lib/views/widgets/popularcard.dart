part of 'widgets.dart';

class PopularCardView extends StatefulWidget {
  final ListComic listComic;
  const PopularCardView(this.listComic, {Key? key}) : super(key: key);

  @override
  State<PopularCardView> createState() => _PopularCardViewState();
}

class _PopularCardViewState extends State<PopularCardView> {
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
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.fromLTRB(8, 10, 8, 0),
          color: Colors.orange,
          child: Column(
            children: [
              Flexible(
                flex: 4,
                child: CachedNetworkImage(
                  imageUrl:
                      'https://${coverUrl}/${listComic.id}/${filename}.256.jpg',
                  imageBuilder: (context, imageProvider) => Container(
                    width: 130,
                    height: 180,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => UiLoading.loadingDD(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              Flexible(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                  child: Text(
                    listComic.attributes!.title!.en ?? title ?? 'No Title',
                    overflow: TextOverflow.fade,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      height: 1,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
