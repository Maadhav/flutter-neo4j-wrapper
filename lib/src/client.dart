import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:neo4j/src/query.dart';
import 'package:retry/retry.dart';

import 'neo4j_app.dart';

typedef RetryCallback = FutureOr<void> Function(Exception);

class Neo4jClient {
  late Neo4jApp app;
  RetryCallback? onRetry;
  Neo4jClient._();

  static final Neo4jClient _instance = Neo4jClient._();

  static Neo4jClient get instance => _instance;

  factory Neo4jClient.init({required Neo4jApp app, RetryCallback? onRetry}) {
    _instance.app = app;
    _instance.onRetry = onRetry;
    return _instance;
  }

  Query get query => Query();

}
