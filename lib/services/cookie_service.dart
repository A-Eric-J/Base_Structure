import 'dart:async';

/// [CookieService] is a service for handling headers and cookies if needed.
class CookieService {
  String? _cookie;
  Map<String, String> defaultHeader = {'Content-type': 'application/json'};

  /// you can use cookie or token. it depends what you need in your project structure
  Future<Map<String, String>> header({bool withContentType = false}) async {
    var header = <String, String>{};

    if (_cookie != null) {
      header.addAll({"cookie": _cookie!});
    } else {
      if (await successfullyFetchedCookie()) {
        header.addAll({"cookie": _cookie!});
      }
    }
    if (withContentType) {
      header['Content-Type'] = 'application/json';
    }
    return header;
  }

  Future<bool> successfullyFetchedCookie() async {
    return _cookie != null;
  }
}
