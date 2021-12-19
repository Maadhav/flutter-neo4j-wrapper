import 'package:neo4j/src/execute_query.dart';
import 'package:neo4j/src/query_builder.dart';

class LIMIT {
  late final QueryBuilder _query;

  LIMIT.createQuery(String node, this._query) {
    _query.insert("LIMIT $node");
  }

  Future<dynamic> execute() async {
    return await Execute.call(_query);
  }
}
