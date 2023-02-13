import 'dart:convert';

import 'package:http/http.dart';
import 'package:neo4j/src/client.dart';
import 'package:neo4j/src/neo4j_response.dart';
import 'package:neo4j/src/query_builder.dart';
import 'package:retry/retry.dart';

class Execute {
  static final _client = Client();
  static Future<Neo4jResponse> call(QueryBuilder query,
      [Map<String, dynamic>? params]) async {
    final neo4j = Neo4jClient.instance;
    final headers = {
      'uid': neo4j.app.uid,
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
      'Access-Control-Allow-Headers': 'Origin, X-Requested-With, Content-Type, Accept',
      'Accept': 'application/json;charset=UTF-8',
      'Content-Type': 'application/json',
    };
    print(query);
    var response = await retry<Response>(
      () => _client.post(neo4j.app.uri,
          body: jsonEncode({
            'statements': [
              {
                'statement': query.toString(),
                if (params != null) 'parameters': params,
              }
            ]
          }),
          headers: headers),
      onRetry: neo4j.onRetry,
    );
    return Neo4jResponse.fromJson(response.body);
  }
}
