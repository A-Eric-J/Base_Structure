import 'dart:convert';
import 'dart:developer';
import 'package:base_structure_project/enums/response_status.dart';
import 'package:dio/dio.dart';

/// This class is the response models of  all requests to server
class ServerResponse {
  /// responseStatus to handle the request response
  ResponseStatus responseStatus = ResponseStatus.none;

  /// a boolean to show that the request was successful
  var success = false;

  /// response body
  Map<String, dynamic>? body;

  /// response status code
  var statusCode = 0;

  /// response message
  String? message;
  final bool debugMode;

  ServerResponse.fake(
      {this.body,
      this.success = true,
      this.statusCode = 200,
      this.message,
      this.debugMode = true});

  ServerResponse(Response? response, {required this.debugMode}) {
    if (response != null) {
      if (response.statusCode! >= 200 && response.statusCode! <= 500) {
        body = json.decode(response.data);
        // body = response.data;
        statusCode = response.statusCode!;
        if (body!['message'] != null) {
          message = body!['message'];
        }
        switch (statusCode) {
          case 200:
            responseStatus = ResponseStatus.success;
            success = true;
            break;
          case 201:
            responseStatus = ResponseStatus.created;
            success = true;
            break;
          case 401:
            responseStatus = ResponseStatus.unauthorized;
            success = false;
            break;
          case 403:
            responseStatus = ResponseStatus.forbidden;
            success = false;
            break;
          case 409:
            responseStatus = ResponseStatus.conflict;
            success = false;
            break;
          case 500:
            responseStatus = ResponseStatus.internalServerError;
            success = false;
            break;
          default:
            responseStatus = ResponseStatus.failed;
            success = false;
        }
      } else {
        /// Server did not understand our request
        responseStatus = ResponseStatus.failed;
        statusCode = response.statusCode!;
        if (response.data != null) {
          body = json.decode(response.data);
        }
      }

      if (debugMode) {
        log('Status code: $statusCode for request: ${response.requestOptions.uri}');
      }
    }
  }
}
