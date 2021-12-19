class QueryBuilder extends StringBuffer {
  QueryBuilder([String query = '']);

  void insert([Object object = '']) {
    writeAll([object, ' ']);
  }
}
