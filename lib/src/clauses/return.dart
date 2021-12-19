import 'package:neo4j/src/clauses/orderby.dart';
import 'package:neo4j/src/clauses/skip.dart';
import 'package:neo4j/src/execute_query.dart';
import 'package:neo4j/src/query_builder.dart';

import 'limit.dart';

class ReturnClause {
  late final QueryBuilder _query;

  ReturnClause.createQuery(String node, this._query) {
    _query.addClause("RETURN $node");
  }

  Future<dynamic> execute([Map<String, dynamic>? params]) async {
    return await Execute.call(_query, params);
  }

  OrderByClause orderBy(String node, [bool descending = false]) {
    return OrderByClause.createQuery(node, _query, descending);
  }

  SkipClause skip(int skip) {
    return SkipClause.createQuery(skip.toString(), _query);
  }

  LimitClause limit(int limit) {
    return LimitClause.createQuery(limit.toString(), _query);
  }
}
