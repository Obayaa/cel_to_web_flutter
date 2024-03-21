import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/features/task/data/local_source.dart';
import 'package:to_do_app/features/task/view/provider/provider.dart';
import 'package:to_do_app/features/task/view/ui/screens/todo.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TaskProvider(LocalSourceRepoImplementation()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ToDo App",
      debugShowCheckedModeBanner: false,
      home: TodoApp(),
    );
  }
}
