import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_bloc/to_do_cubit/to_do_cubit.dart';
import 'package:to_do_list_bloc/to_do_cubit/to_do_state.dart';
import 'package:to_do_list_bloc/widgets/todo_item.dart';


class TodoAppWithoutStateManagement extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    addTask(String title)
    {
      context.read<ToDoCubit>().addTask(title);
    }
    void _showAddTodoDialog() {
      final _titleController = TextEditingController();
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Add New Task"),
          content: TextField(
            controller: _titleController,
            decoration: const InputDecoration(labelText: "Task Title"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                addTask(_titleController.text);
                Navigator.pop(context);
              },
              child: const Text("Save"),
            ),
          ],
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Tasks'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: BlocBuilder<ToDoCubit,ToDoState>(
          builder: (context,state)
              {
                if (state is InitialToDoState) {

                return const Center(child: Text('No Tasks Available'));
              } else if (state is AddTaskState) {
                if (state.todo.isEmpty) {

                  return const Center(child: Text('No Task Available'));
                }
                  return ListView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: state.todo.length,
                    itemBuilder: (context, index) {
                      final todo = state.todo[index];
                      return TodoItem(
                          title: todo.title,
                          isDone: todo.isDone,
                          onDelete: () =>
                              context.read<ToDoCubit>().deleteTask(index),
                          onToggled: (value)
                          {
                            context.read<ToDoCubit>().checkTask(index, value);
                          } );
                    },
                  );
                }
                else
                {
                  return const Center(child: Text('Something went wrong'));
                }
              }


      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTodoDialog,
        child: const Icon(Icons.add),
        backgroundColor: Colors.teal,
      ),
    );
  }
}
