import 'package:neo4j/src/query_builder.dart';

class CREATE {
  late final QueryBuilder _query;

  CREATE.createQuery(String node, this._query) {
    _query.insert("CREATE ($node)");
  }
}
