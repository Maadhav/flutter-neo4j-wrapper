import 'package:neo4j/src/clauses/match.dart';
import 'package:neo4j/src/query_builder.dart';

class CreateClause {
  late final QueryBuilder _query;

  CreateClause.createQuery(String node, this._query) {
    _query.addClause("CREATE ($node)");
  }

  CreateClause create(String node) => CreateClause.createQuery(node, _query);

  MatchClause match(String node) => MatchClause.createQuery(node, _query);
}
