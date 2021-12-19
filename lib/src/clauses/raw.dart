import 'package:neo4j/src/execute_query.dart';
import 'package:neo4j/src/query_builder.dart';

class RawQuery {
  late final QueryBuilder _query;

  RawQuery.createQuery(String data, this._query) {
    _query.addClause(data);
  }

  Future<dynamic> execute([Map<String, dynamic>? params]) async =>
      await Execute.call(_query, params);
}
