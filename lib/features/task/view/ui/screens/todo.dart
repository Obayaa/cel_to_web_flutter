import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/features/task/view/provider/provider.dart';
import 'package:to_do_app/features/task/view/ui/widgets/editTodo.dart';

import '../widgets/addTodoWidget.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  final TextEditingController titleController = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    context.read<TaskProvider>().getTasks();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (context, taskprovider, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("TODO APP"),
            centerTitle: true,
          ),
          body: Center(
            child: Column(
              children: [
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      taskprovider.getTasks();
                    },
                    child: StreamBuilder(
                        stream: taskprovider.getTasks(),
                        builder: (context, snapshot) {
                          return ListView.builder(
                            itemCount: taskprovider.taskModel.length,
                            itemBuilder: (context, index) => ListTile(
                              title: Text(taskprovider.taskModel[index].title),
                              subtitle: Text(
                                  taskprovider.taskModel[index].description),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      showModalBottomSheet(
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(50),
                                              topRight: Radius.circular(50),
                                            ),
                                          ),
                                          context: context,
                                          builder: (context) {
                                            return SingleChildScrollView(
                                              child: EditTodo(
                                                taskprovider: taskprovider,
                                                taskModel: taskprovider
                                                    .taskModel[index],
                                              ),
                                            );
                                          });
                                    },
                                    icon: Icon(Icons.edit),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      taskprovider.deleteTask(taskprovider
                                          .taskModel
                                          .elementAt(index)
                                          .id);
                                    },
                                    icon: Icon(Icons.delete),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                )
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  context: context,
                  builder: (BuildContext context) {
                    return SingleChildScrollView(
                      child: AddTodoWidget(
                        titleController: titleController,
                        descriptionController: descriptionController,
                        taskprovider: taskprovider,
                      ),
                    );
                  });
            },
            child: const Icon(
              Icons.add,
              size: 30,
            ),
          ),
        );
      },
    );
  }
}
