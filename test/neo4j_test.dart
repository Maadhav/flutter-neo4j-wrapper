import 'package:flutter_test/flutter_test.dart';

import 'package:neo4j/neo4j.dart';

void main() {
  var neo4j = Neo4jClient.init(
      app: Neo4jApp(
    uri: Uri.parse("https://neo4j.igros.app"),
  ));
  test('initialize instance', () {
    expect(neo4j.app.uri.toString(), "https://neo4j.igros.app");
  });
  test('query builder', () async {
    await neo4j.query
        .match("n:ETag")
        .where("ID(n)", Comparison.equality, "21204")
        .and("n.name", Comparison.contains, "Test")
        .retrn("n")
        .limit(1)
        .execute()
        .then((value) => print(value));
  });
}
