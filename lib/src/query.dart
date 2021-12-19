import 'package:neo4j/src/clauses/match.dart';
import 'package:neo4j/src/query_builder.dart';

class Query {
  MatchClause match(String node) => MatchClause.createQuery(node, QueryBuilder());
}
