import 'dart:convert';

import '../model/todo_model.dart';
import 'package:http/http.dart' as http;

String url = "https://jsonplaceholder.typicode.com/todos";

List<Todo> todos = [];

Future<void> fetchTodos() async {
  Uri uri = Uri.parse(url);
  final response = await http.get(uri);
  if (response.statusCode == 200) {
    print(response.body);
    final jsonData = jsonDecode(response.body) as List;
    todos = List<Todo>.from(
      jsonData.map(
        (json) => Todo.fromJson(json),
      ),
    );
    print(todos);
  } else{
    print("Error fetching todos");
  }
}
