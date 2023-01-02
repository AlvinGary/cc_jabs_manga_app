part of 'services.dart';

class MangadexService {
  static Future<List<ListComic>> getListPopularComic(int offset) async {
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

  static Future<List<ListComic>> getListLatestComic(int offset) async {
    var query = {
      'includes[]': 'cover_art',
      'limit': '20',
      'offset': '${offset}',
      'order[latestUploadedChapter]': 'desc',
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

  static Future<List<ListComic>> getComedyComic(int offset) async {
    Map<String, dynamic> query = {
      'includes[]': 'cover_art',
      'limit': '20',
      'offset': '${offset}',
      'order[latestUploadedChapter]': 'desc',
      'availableTranslatedLanguage[]': 'en',
      'hasAvailableChapters': 'true',
      'contentRating[]': 'safe',
      'includedTags[]': comedy,
      'excludedTags[]': [bl, gl, gore, sv]
    };

    var url = Uri.http(baseUrl, '/manga', query);
    print(url);
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

  static Future<List<ListComic>> getActionComic(int offset) async {
    Map<String, dynamic> query = {
      'includes[]': 'cover_art',
      'limit': '20',
      'offset': '${offset}',
      'order[latestUploadedChapter]': 'desc',
      'availableTranslatedLanguage[]': 'en',
      'hasAvailableChapters': 'true',
      'contentRating[]': 'safe',
      'includedTags[]': action,
      'excludedTags[]': [bl, gl, gore, sv]
    };

    var url = Uri.http(baseUrl, '/manga', query);
    print(url);
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

  static Future<List<ListComic>> getAdventureComic(int offset) async {
    Map<String, dynamic> query = {
      'includes[]': 'cover_art',
      'limit': '20',
      'offset': '${offset}',
      'order[latestUploadedChapter]': 'desc',
      'availableTranslatedLanguage[]': 'en',
      'hasAvailableChapters': 'true',
      'contentRating[]': 'safe',
      'includedTags[]': adventure,
      'excludedTags[]': [bl, gl, gore, sv]
    };

    var url = Uri.http(baseUrl, '/manga', query);
    print(url);
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

  static Future<List<ListComic>> getDramaComic(int offset) async {
    Map<String, dynamic> query = {
      'includes[]': 'cover_art',
      'limit': '20',
      'offset': '${offset}',
      'order[latestUploadedChapter]': 'desc',
      'availableTranslatedLanguage[]': 'en',
      'hasAvailableChapters': 'true',
      'contentRating[]': 'safe',
      'includedTags[]': drama,
      'excludedTags[]': [bl, gl, gore, sv]
    };

    var url = Uri.http(baseUrl, '/manga', query);
    print(url);
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

  static Future<List<ListComic>> getIsekaiComic(int offset) async {
    Map<String, dynamic> query = {
      'includes[]': 'cover_art',
      'limit': '20',
      'offset': '${offset}',
      'order[latestUploadedChapter]': 'desc',
      'availableTranslatedLanguage[]': 'en',
      'hasAvailableChapters': 'true',
      'contentRating[]': 'safe',
      'includedTags[]': isekai,
      'excludedTags[]': [bl, gl, gore, sv]
    };

    var url = Uri.http(baseUrl, '/manga', query);
    print(url);
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

  static Future<List<ListComic>> getFantasyComic(int offset) async {
    Map<String, dynamic> query = {
      'includes[]': 'cover_art',
      'limit': '20',
      'offset': '${offset}',
      'order[latestUploadedChapter]': 'desc',
      'availableTranslatedLanguage[]': 'en',
      'hasAvailableChapters': 'true',
      'contentRating[]': 'safe',
      'includedTags[]': fantasy,
      'excludedTags[]': [bl, gl, gore, sv]
    };

    var url = Uri.http(baseUrl, '/manga', query);
    print(url);
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

  static Future<List<ListComic>> getSliceoflifeComic(int offset) async {
    Map<String, dynamic> query = {
      'includes[]': 'cover_art',
      'limit': '20',
      'offset': '${offset}',
      'order[latestUploadedChapter]': 'desc',
      'availableTranslatedLanguage[]': 'en',
      'hasAvailableChapters': 'true',
      'contentRating[]': 'safe',
      'includedTags[]': sliceoflife,
      'excludedTags[]': [bl, gl, gore, sv]
    };

    var url = Uri.http(baseUrl, '/manga', query);
    print(url);
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

  static Future<List<ListComic>> getHaremComic(int offset) async {
    Map<String, dynamic> query = {
      'includes[]': 'cover_art',
      'limit': '20',
      'offset': '${offset}',
      'order[latestUploadedChapter]': 'desc',
      'availableTranslatedLanguage[]': 'en',
      'hasAvailableChapters': 'true',
      'contentRating[]': 'safe',
      'includedTags[]': harem,
      'excludedTags[]': [bl, gl, gore, sv]
    };

    var url = Uri.http(baseUrl, '/manga', query);
    print(url);
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
