import 'package:flutter/material.dart';
import 'package:to_do_app/features/task/domain/data/task_model.dart';
import 'package:to_do_app/features/task/view/provider/provider.dart';

class EditTodo extends StatefulWidget {
  const EditTodo({
    super.key,
    required this.taskprovider,
    required this.taskModel,
  });

  final TaskProvider taskprovider;
  final TaskModel taskModel;

  @override
  State<EditTodo> createState() => _EditTodoState();
}

class _EditTodoState extends State<EditTodo> {
  //controller
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    titleController.text = widget.taskModel.title;
    descriptionController.text = widget.taskModel.description;

    super.initState();
  }

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
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(
                  label: Text('Task Title'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
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
                      widget.taskprovider.updateTask(titleController.text,
                          descriptionController.text, widget.taskModel.id);
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Update Task',
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      titleController.clear();
                      descriptionController.clear();

                      Navigator.pop(context);
                    },
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
