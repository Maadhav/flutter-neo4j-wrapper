import 'package:neo4j/src/execute_query.dart';
import 'package:neo4j/src/query_builder.dart';

import 'limit.dart';

class ReturnClause {
  late final QueryBuilder _query;

  ReturnClause.createQuery(String node, this._query) {
    _query.addClause("RETURN $node");
  }

  Future<dynamic> execute() async {
    return await Execute.call(_query);
  }

  LimitClause limit(int limit) {
    return LimitClause.createQuery(limit.toString(), _query);
  }
}
