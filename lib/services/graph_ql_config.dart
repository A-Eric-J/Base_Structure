import 'dart:developer';
import "package:flutter/material.dart";
import 'package:base_structure_project/const_values/config.dart';
import 'package:base_structure_project/services/shared_preference_service/shared_preference.dart';
import "package:graphql_flutter/graphql_flutter.dart";

/// Read this Doc carefully https://pub.dev/packages/graphql_flutter
class GraphQLConfig {
  static HttpLink httpLink = HttpLink(
    qraphQlEndPoint,
    defaultHeaders: {
      "Authorization": 'Bearer ${SharedPreference.getToken()}',
      "Content-Type": 'application/json',
      "Accept": 'application/json',
      "Access-Control-Allow-Origin": "*"
    },
  );

  static HttpLink httpLinkWithAuth = HttpLink(
    qraphQlEndPointNeedsAuth,
    defaultHeaders: {
      "Authorization": 'Bearer ${SharedPreference.getToken()}',
      "Content-Type": 'application/json',
      "Accept": 'application/json',
      "Access-Control-Allow-Origin": "*"
    },
  );

  ///if you want to pass token
  static ValueNotifier<GraphQLClient> graphInit() {
    log('token defaultHeaders: ${httpLinkWithAuth.defaultHeaders}');
    // We're using HiveStore for persistence,
    // so we need to initialize Hive.

    final AuthLink authLink = AuthLink(
      getToken: () async => 'Bearer ${SharedPreference.getToken()}',
    );

    final Link link = authLink.concat(httpLinkWithAuth);

    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        link: link,
        // The default store is the InMemoryStore, which does NOT persist to disk
        cache: GraphQLCache(
            //TODO this must be checked again(about store)
            ),
      ),
    );

    return client;
  }

  GraphQLClient clientToQuery() {
    AuthLink authLink = AuthLink(
      getToken: () async => SharedPreference.getToken(),
    );

    final Link link = authLink.concat(httpLink);
    return GraphQLClient(
      cache: GraphQLCache(),
      link: link,
    );
  }

  GraphQLClient clientToQueryWithAuth() {
    AuthLink authLink =
        AuthLink(getToken: () async => 'Bearer ${SharedPreference.getToken()}');

    log('token: ${SharedPreference.getToken()}');

    final Link link = authLink.concat(httpLinkWithAuth);
    return GraphQLClient(
      cache: GraphQLCache(),
      link: link,
    );
  }
}
