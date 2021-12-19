import 'package:neo4j/src/clauses/create.dart';
import 'package:neo4j/src/clauses/match.dart';
import 'package:neo4j/src/clauses/raw.dart';
import 'package:neo4j/src/query_builder.dart';

class Query {
  MatchClause match(String node) =>
      MatchClause.createQuery(node, QueryBuilder());
  CreateClause create(String node) =>
      CreateClause.createQuery(node, QueryBuilder());
  RawQuery rawQuery(String node) => RawQuery.createQuery(node, QueryBuilder());
}
