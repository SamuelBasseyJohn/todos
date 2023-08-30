import 'package:flutter/material.dart';
import 'package:todo_app/services/todo_api.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Todos App"),
        ),
        body: ListView.separated(
    itemBuilder: (context, index){
      return ListTile(
      leading: Text("${todos[index].id}"),
    title: Text("${todos[index].title}"),
    trailing: Checkbox(
    value: todos[index].completed,
    onChanged: (value){
      setState(() {
        todos[index].completed = value!;
      });

    },
    ),
      );
    },
    separatorBuilder: (context, index){
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: const Divider(
        height: 2,
        ),
      );
    },
    itemCount: todos.length),);
  }
}
