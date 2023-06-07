import 'dart:developer';
import 'package:base_structure_project/models/graph_ql_server_response.dart';
import 'package:base_structure_project/services/graph_ql_config.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

/// [WebServiceGraphQl] is a service for every GraphQl API request to the server
/// and we use graphql_flutter for interacting with network.

class WebServiceGraphQl {
  final graphQLConfiguration = GraphQLConfig();

  Future<GraphQlServerResponse> query(
      String query, Map<String, dynamic> variables,
      {bool? withAuth = true}) async {
    QueryResult? response;

    try {
      ///initializing GraphQLConfig
      var client = withAuth!
          ? graphQLConfiguration.clientToQueryWithAuth()
          : graphQLConfiguration.clientToQuery();
      response = await client.query(
        QueryOptions(document: gql(query), variables: variables),
      );
    } on GraphQLError catch (errorMessage) {
      return GraphQlServerResponse(response, graphqlError: errorMessage);
    }
    return GraphQlServerResponse(response);
  }

  Future<GraphQlServerResponse> mutate(
      String query, Map<String, dynamic> variables,
      {bool? withAuth = true}) async {
    log('requesting data mutation');

    QueryResult? response;

    try {
      ///initializing GraphQLConfig
      var client = withAuth!
          ? graphQLConfiguration.clientToQueryWithAuth()
          : graphQLConfiguration.clientToQuery();
      response = await client.mutate(
        MutationOptions(document: gql(query), variables: variables),
      );
    } on GraphQLError catch (errorMessage) {
      log('errorMessage ${errorMessage.message}');

      return GraphQlServerResponse(response, graphqlError: errorMessage);
    }

    return GraphQlServerResponse(response);
  }
}
