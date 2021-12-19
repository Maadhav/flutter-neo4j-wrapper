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

  WhereClause where(String node, Comparison operator, [String? value]) =>
      WhereClause.createQuery(node, operator, _query, value);
}
