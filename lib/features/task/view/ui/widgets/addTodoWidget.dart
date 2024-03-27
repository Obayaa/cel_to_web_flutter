import 'package:flutter/material.dart';
import 'package:to_do_app/features/task/view/provider/provider.dart';

class AddTodoWidget extends StatelessWidget {
  const AddTodoWidget({
    super.key,
    required this.titleController,
    required this.descriptionController,
    required this.taskprovider,
  });

  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final TaskProvider taskprovider;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                      titleController.clear();
                      descriptionController.clear();
                      Navigator.pop(context);
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
    );
  }
}
