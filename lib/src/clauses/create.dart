import 'package:neo4j/src/query_builder.dart';

class CreateClause {
  late final QueryBuilder _query;

  CreateClause.createQuery(String node, this._query) {
    _query.addClause("CREATE ($node)");
  }
}
