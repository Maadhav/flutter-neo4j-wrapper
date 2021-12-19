import 'package:neo4j/src/clauses/return.dart';
import 'package:neo4j/src/query_builder.dart';

class MATCH {
  late final QueryBuilder _query;

  MATCH.createQuery(String node, this._query) {
    _query.insert("MATCH ($node)");
  }

  RETURN retrn(String node) {
    return RETURN.createQuery(node, _query);
  }
}
