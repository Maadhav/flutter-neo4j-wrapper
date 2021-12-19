import 'package:neo4j/src/clauses/create.dart';
import 'package:neo4j/src/clauses/return.dart';
import 'package:neo4j/src/clauses/where.dart';
import 'package:neo4j/src/enums/comparision.dart';
import 'package:neo4j/src/query_builder.dart';

class MatchClause {
  late final QueryBuilder _query;

  MatchClause.createQuery(String node, this._query) {
    _query.addClause("MATCH ($node)");
  }

  ReturnClause retrn(String node) {
    return ReturnClause.createQuery(node, _query);
  }

  WhereClause where(String node, Comparison operator, [Object? value]) =>
      WhereClause.createQuery(node, operator, _query, value);

  MatchClause match(String node) => MatchClause.createQuery(node, _query);

  CreateClause create(String node) => CreateClause.createQuery(node, _query);
}
