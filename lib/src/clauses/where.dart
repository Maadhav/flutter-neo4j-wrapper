import 'package:neo4j/src/clauses/and.dart';
import 'package:neo4j/src/clauses/or.dart';
import 'package:neo4j/src/clauses/return.dart';
import 'package:neo4j/src/enums/comparision.dart';
import 'package:neo4j/src/query_builder.dart';
import 'package:neo4j/src/utils/comparision_convertor.dart';

class WhereClause {
  late final QueryBuilder _query;

  WhereClause.createQuery(
    String node,
    Comparison operator,
    this._query,
    Object? value,
  ) {
    _query.addClause("WHERE${convertCompare(node, operator, value)}");
  }

  ReturnClause retrn(String node) {
    return ReturnClause.createQuery(node, _query);
  }

  AndClause and(String node, Comparison operator, [String? value]) =>
      AndClause.createQuery(node, operator, _query, value);

  OrClause or(String node, Comparison operator, [String? value]) =>
      OrClause.createQuery(node, operator, _query, value);
}
