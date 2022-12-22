part of 'services.dart';

class MangadexService {
  static Future<List<ListComic>> getListComic(int offset) async {
    var query = {
      'includes[]': 'cover_art',
      'limit': '20',
      'offset': '${offset}',
      'order[followedCount]': 'desc',
      'availableTranslatedLanguage[]': 'en',
      'hasAvailableChapters': 'true',
      'contentRating[]': 'safe',
      'excludedTags[]': bl,
      'excludedTags[]': gl,
      'excludedTags[]': gore,
      'excludedTags[]': sv,
    };
    var url = Uri.http(baseUrl, '/manga', query);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      List<ListComic> listComic = [];
      var data = jsonDecode(response.body);
      listComic =
          (data['data'] as List).map((e) => ListComic.fromJson(e)).toList();
      return listComic;
    } else {
      throw Exception('Failed to load list comic');
    }
  }
}
