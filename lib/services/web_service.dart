import 'dart:convert';
import 'dart:developer';
import 'package:base_structure_project/const_values/assets.dart';
import 'package:base_structure_project/models/server_response.dart';
import 'package:base_structure_project/services/cookie_service.dart';
import 'package:dio/dio.dart';

/// [WebService] is a service for every REST API request to the server
/// and we use Dio for interacting with network.
class WebService {
  CookieService? cookieService;

  WebService({this.cookieService});

  WebService setDependencies(
    CookieService cookieService,
  ) {
    this.cookieService = cookieService;
    log('Web service updated');
    return this;
  }

  final dio = Dio();

  /// these commented codes are designed for Cookie using in your APIs
  // var cookieJar;
  //
  // Future<bool> setCookieJar() async {
  //   if (this.cookieJar == null) {
  //     try {
  //       Directory appDocDir = await getApplicationDocumentsDirectory();
  //       String appDocPath = appDocDir.path;
  //       var cookieJar = PersistCookieJar(
  //           ignoreExpires: true,
  //           storage: FileStorage(appDocPath + "/.cookies/"));
  //
  //       print('it is cookie    setCookieJar  ' + cookieJar.toString());
  //       dio.interceptors.add(CookieManager(cookieJar));
  //
  //       return true;
  //     } catch (e) {
  //       Exception("exception on cookie");
  //     }
  //   }
  //   return true;
  // }

  /// GET
  Future<ServerResponse> getFunction(
    String url, {
    var body,
  }) async {
    log('requesting data from $url');
    Response? response;
    try {
      var headers = await cookieService?.header(
        withContentType: true,
      );
      dio.options.sendTimeout = 50000;
      dio.options.connectTimeout = 50000;
      dio.options.receiveTimeout = 50000;
      log('it is headers    getFunction  $headers');

      response = await dio.get(url,
          options: Options(headers: headers, followRedirects: false));
    } on DioError catch (errorMessage) {
      response = errorMessage.response;
      log('request failed in get method');
    }
    return ServerResponse(response, debugMode: debugMode);
  }

  /// POST
  Future<ServerResponse> postFunction(
    String url, {
    bool withContentType = false,
    var body,
  }) async {
    log('requesting data from $url');
    Response? response;
    try {
      var headers =
          await cookieService!.header(withContentType: withContentType);
      dio.options.sendTimeout = 50000;
      dio.options.connectTimeout = 50000;
      dio.options.receiveTimeout = 50000;
      response = await dio.post(
        url,
        options: Options(headers: headers, followRedirects: false),
        data: json.encode(body),
      );
    } on DioError catch (errorMessage) {
      response = errorMessage.response;
      log('request failed in post method');
    }

    return ServerResponse(response, debugMode: debugMode);
  }

  /// PUT
  Future<ServerResponse> putFunction(
    String url, {
    bool withContentType = false,
    var body,
  }) async {
    Response? response;
    try {
      var headers =
          await cookieService!.header(withContentType: withContentType);
      dio.options.sendTimeout = 50000;
      dio.options.connectTimeout = 50000;
      dio.options.receiveTimeout = 50000;
      response = await dio.put(
        url,
        options: Options(headers: headers, followRedirects: false),
        data: json.encode(body),
      );
      log("response headers are : ${response.headers.toString()}");
    } on DioError catch (errorMessage) {
      response = errorMessage.response;
      log('request failed in put method');
    }
    return ServerResponse(response, debugMode: debugMode);
  }

  /// DELETE
  Future<ServerResponse> deleteFunction(
    String url, {
    bool withContentType = false,
    var body,
  }) async {
    Response? response;
    try {
      var headers =
          await cookieService!.header(withContentType: withContentType);
      dio.options.sendTimeout = 50000;
      dio.options.connectTimeout = 50000;
      dio.options.receiveTimeout = 50000;
      response = await dio.delete(
        url,
        options: Options(headers: headers, followRedirects: false),
        data: json.encode(body),
      );
      log("response headers are : ${response.headers.toString()}");
    } on DioError catch (errorMessage) {
      response = errorMessage.response;
      log('request failed in delete methode');
    }
    return ServerResponse(response, debugMode: debugMode);
  }
}
