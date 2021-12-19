import 'package:neo4j/src/clauses/limit.dart';
import 'package:neo4j/src/clauses/skip.dart';
import 'package:neo4j/src/execute_query.dart';
import 'package:neo4j/src/query_builder.dart';

class OrderByClause {
  late final QueryBuilder _query;

  OrderByClause.createQuery(String node, this._query,
      [bool descending = false, bool isNew = false]) {
    if (isNew) {
      _query.addClause(', $node ${descending ? 'DESC' : ''}');
    } else {
      _query.addClause("ORDER BY $node ${descending ? 'DESC' : ''}");
    }
  }

  OrderByClause orderBy(String node, [bool descending = false]) =>
      OrderByClause.createQuery(node, _query, descending, true);

  LimitClause limit(int limit) {
    return LimitClause.createQuery(limit.toString(), _query);
  }

  SkipClause skip(int skip) {
    return SkipClause.createQuery(skip.toString(), _query);
  }

  Future<dynamic> execute() async {
    return await Execute.call(_query);
  }
}
