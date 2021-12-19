import 'dart:convert';

import 'package:http/http.dart';
import 'package:neo4j/src/client.dart';
import 'package:neo4j/src/query_builder.dart';
import 'package:retry/retry.dart';

class Execute {
  static final _client = Client();
  static Future<dynamic> call(QueryBuilder query) async {
    final neo4j = Neo4jClient.instance;
    final headers = {
      'uid': neo4j.app.uid,
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
              }
            ]
          }),
          headers: headers),
      onRetry: neo4j.onRetry,
    );
    return jsonDecode(response.body);
  }
}
