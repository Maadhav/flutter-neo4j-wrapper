import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';

import 'package:neo4j/neo4j.dart';

void main() {
  var neo4j = Neo4jClient.init(
    app: Neo4jApp(
      uri: Uri.parse("https://neo4j.igros.app"),
      uid: "OkEZAJufEnRHIhYYZ3GuqPCyqUJ3",
    ),
  );
  test('initialize instance', () {
    expect(neo4j.app.uri.toString(), "https://neo4j.igros.app");
  });
  test('query builder', () async {
    final response = await neo4j.query
        .fullTextSearch("topicsSearch", "Test")
        .yield_("node, score")
        .return_("node, labels(node)")
        .orderBy("score", ascending: false)
        .limit(10)
        .execute();
    print(response.getAll(["node", "labels(node)"]).map(
        (e) => e.map((e) => e?.properties)));
  });
}
