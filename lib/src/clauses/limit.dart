import 'package:neo4j/src/execute_query.dart';
import 'package:neo4j/src/query_builder.dart';

class LimitClause {
  late final QueryBuilder _query;

  LimitClause.createQuery(String node, this._query) {
    _query.addClause("LIMIT $node");
  }

  Future<dynamic> execute([Map<String, dynamic>? params]) async {
    return await Execute.call(_query, params);
  }
}
