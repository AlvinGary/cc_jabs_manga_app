part of 'widgets.dart';

class LatestCardHome extends StatefulWidget {
  final ListComic listComic;
  const LatestCardHome(this.listComic, {Key? key}) : super(key: key);

  @override
  State<LatestCardHome> createState() => _LatestCardHomeState();
}

class _LatestCardHomeState extends State<LatestCardHome> {
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
      child: InkWell(
        onTap: () {},
        child: ListTile(
          contentPadding: const EdgeInsets.fromLTRB(12, 4, 0, 2),
          leading: CachedNetworkImage(
            imageUrl: 'https://${coverUrl}/${listComic.id}/${filename}.256.jpg',
            imageBuilder: (context, imageProvider) => Container(
              width: 55,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                    alignment: Alignment.centerLeft),
              ),
            ),
            placeholder: (context, url) => UiLoading.loadingDD(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          title: Padding(
            padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
            child: Text(
              listComic.attributes!.title!.en ?? title ?? 'No Title',
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
            child: Text(
              "Latest Chapter: ${listComic.attributes!.lastChapter ?? 'No Chapter'}",
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ),
      ),
    );
  }
}
