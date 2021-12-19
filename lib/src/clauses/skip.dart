import 'package:neo4j/src/clauses/limit.dart';
import 'package:neo4j/src/execute_query.dart';
import 'package:neo4j/src/query_builder.dart';

class SkipClause {
  late final QueryBuilder _query;

  SkipClause.createQuery(String node, this._query) {
    _query.addClause("SKIP $node");
  }

  LimitClause limit(int limit) {
    return LimitClause.createQuery(limit.toString(), _query);
  }

  Future<dynamic> execute() async {
    return await Execute.call(_query);
  }
}
