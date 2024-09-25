import 'package:to_do_list_bloc/models/todo_item.dart';
abstract class ToDoState {}

class InitialToDoState extends ToDoState {}

class AddTaskState extends ToDoState
{

List<Todo> todo = [];

AddTaskState(this.todo);

}

