import 'package:neo4j/src/execute_query.dart';
import 'package:neo4j/src/query_builder.dart';

import 'limit.dart';

class RETURN {
  late final QueryBuilder _query;

  RETURN.createQuery(String node, this._query) {
    _query.insert("RETURN $node");
  }

  Future<dynamic> execute() async {
    return await Execute.call(_query);
  }

  LIMIT limit(int limit) {
    return LIMIT.createQuery(limit.toString(), _query);
  }
}
