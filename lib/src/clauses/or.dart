import 'package:neo4j/src/clauses/and.dart';
import 'package:neo4j/src/clauses/create.dart';
import 'package:neo4j/src/clauses/match.dart';
import 'package:neo4j/src/clauses/return.dart';
import 'package:neo4j/src/clauses/where.dart';
import 'package:neo4j/src/enums/comparision.dart';
import 'package:neo4j/src/query_builder.dart';
import 'package:neo4j/src/utils/comparision_convertor.dart';

class OrClause {
  late final QueryBuilder _query;

  OrClause.createQuery(String node, Comparison operator, this._query,
      [String? value]) {
    _query.addClause("OR${convertCompare(node, operator, value)}");
  }

  ReturnClause retrn(String node) {
    return ReturnClause.createQuery(node, _query);
  }

  OrClause or(String node, Comparison operator, [String? value]) =>
      OrClause.createQuery(node, operator, _query, value);

  AndClause and(String node, Comparison operator, [String? value]) =>
      AndClause.createQuery(node, operator, _query, value);

  MatchClause match(String node) => MatchClause.createQuery(node, _query);
  CreateClause create(String node) => CreateClause.createQuery(node, _query);
}
