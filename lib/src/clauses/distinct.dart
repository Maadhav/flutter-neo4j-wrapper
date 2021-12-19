import 'package:neo4j/src/execute_query.dart';
import 'package:neo4j/src/query_builder.dart';

class DistinctClause {
  late final QueryBuilder _query;

  DistinctClause.createQuery(String node, this._query) {
    _query.addClause("DISCTINT $node");
  }

  Future<dynamic> execute([Map<String, dynamic>? params]) async {
    return await Execute.call(_query, params);
  }
}
