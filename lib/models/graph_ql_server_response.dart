import 'dart:developer';

import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQlServerResponse {
  var isSuccess = false;
  GraphQLError? graphqlError;
  Map<String, dynamic>? body;
  var hasException = false;

  GraphQlServerResponse(QueryResult? response, {GraphQLError? graphqlError}) {
    if (response != null) {
      hasException = response.hasException;
      isSuccess = !response.hasException;

      if (!hasException) {
        if (response.data != null) {
          body = response.data;
        }
      } else {
        log('Error from GraphQlServerResponse ==> ${response.exception!}');
        if (response.exception!.graphqlErrors.isNotEmpty) {
          this.graphqlError = response.exception!.graphqlErrors.first;
        }
      }
    } else {
      isSuccess = false;
      this.graphqlError = graphqlError;
    }
  }
}
