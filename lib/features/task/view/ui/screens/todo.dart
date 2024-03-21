import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/features/task/view/provider/provider.dart';

class TodoApp extends StatefulWidget {
  TodoApp({super.key});

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
                Text(
                  "Nothing here!",
                  style: TextStyle(
                    fontSize: 36,
                  ),
                ),
                // Expanded(
                //   child: ListView.builder(
                //     itemCount: taskprovider.taskModel.length,
                //     itemBuilder: (context, index) => ListTile(
                //       title: Text(taskprovider.taskModel[index].title),
                //       subtitle: Text(taskprovider.taskModel[index].description),
                //     ),
                //   ),
                // )
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
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 40,
                          horizontal: 20,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                          ),
                          child: SizedBox(
                            height: 300,
                            child: Column(
                              children: [
                                TextField(
                                  controller: titleController,
                                  decoration: const InputDecoration(
                                    label: Text('Task Title'),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                  controller: descriptionController,
                                  decoration: const InputDecoration(
                                    label: Text('Description'),
                                  ),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        print('hello world');
                                        taskprovider.addTask(
                                          titleController.text,
                                          descriptionController.text,
                                        );
                                      },
                                      child: const Text(
                                        'Add Task',
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: const Text(
                                        "Cancel Update",
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
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
