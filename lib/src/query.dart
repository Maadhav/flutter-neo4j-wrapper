import 'package:neo4j/src/clauses/match.dart';
import 'package:neo4j/src/query_builder.dart';

class Query {
  MATCH match(String node) => MATCH.createQuery(node, QueryBuilder());
}
