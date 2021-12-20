import 'dart:convert';

class Neo4jResponse {
  Neo4jResponse({
    required this.results,
    required this.errors,
  });

  final List<Result> results;
  final List<Neo4jError> errors;

  factory Neo4jResponse.fromJson(String str) =>
      Neo4jResponse._fromMap(json.decode(str));

  factory Neo4jResponse._fromMap(Map<String, dynamic> json) => Neo4jResponse(
        results:
            List<Result>.from(json["results"].map((x) => Result.fromMap(x))),
        errors: List<Neo4jError>.from(
            json["errors"].map((x) => Neo4jError.fromMap(x))),
      );

  List<Neo4jNode> get(String node) {
    int index = results.first.columns.indexOf(node);
    if (index == -1) return [];
    return results.first.data
        .map((x) => Neo4jNode(properties: x.row[index], id: x.ids[index]))
        .toList();
  }

  List<List<Neo4jNode?>> getAll(List<String> nodes) {
    final List<List<Neo4jNode?>> data = [];
    List<int> indexs =
        nodes.map((e) => results.first.columns.indexOf(e)).toList();
    for (var x in results.first.data) {
      data.add(indexs
          .map((i) => i.isNegative
              ? null
              : Neo4jNode(
                  properties: x.row[i],
                  id: x.ids[i],
                ))
          .toList());
    }

    return data;
  }
}

class Neo4jNode {
  final dynamic properties;
  final int? id;

  Neo4jNode({this.properties, this.id});
}

class Neo4jError {
  Neo4jError({
    required this.code,
    required this.message,
  }) {
    throw Exception(code + "\n" + message);
  }

  final String code;
  final String message;

  factory Neo4jError.fromMap(Map<String, dynamic> json) => Neo4jError(
        code: json["code"],
        message: json["message"],
      );
}

class Result {
  Result({
    required this.columns,
    required this.data,
  });

  final List<String> columns;
  final List<Data> data;

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        columns: List<String>.from(json["columns"].map((x) => x)),
        data: List<Data>.from(json["data"].map((x) => Data.fromMap(x))),
      );
}

class Data {
  Data({
    required this.row,
    required this.ids,
  });

  final List<dynamic> row;
  final List<int?> ids;

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        row: List<dynamic>.from(json["row"]),
        ids: List<int?>.from(
            json["meta"].map((x) => x == null ? null : x["id"])),
      );
}
