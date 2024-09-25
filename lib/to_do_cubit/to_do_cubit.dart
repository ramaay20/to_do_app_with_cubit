import 'package:bloc/bloc.dart';
import 'package:to_do_list_bloc/models/todo_item.dart';
import 'package:to_do_list_bloc/to_do_cubit/to_do_state.dart';

class ToDoCubit extends Cubit<ToDoState>
{
  ToDoCubit():super(InitialToDoState());

  void addTask(String title)
  {
   final task = Todo(title: title);
   if(state is AddTaskState)
     {

       final current = state as AddTaskState;
       final List<Todo> updated = List.from(current.todo)..add(task);
       emit(AddTaskState(updated));
     }
   else
   {
     emit(AddTaskState([task]));
   }
  }
  void deleteTask(int index)
  {
   if(state is AddTaskState)
     {
       final current = state as AddTaskState;
       final List<Todo> updated = List.from(current.todo)..removeAt(index);
       emit(AddTaskState(updated));
     }
   else{
     print("errorrrr");
   }
  }
  void checkTask(int index, bool? isDone) {
    if (state is AddTaskState)
    {
      final current = state as AddTaskState;
      final List<Todo> updated = List.from(current.todo);
      updated[index] = Todo(
        title: updated[index].title,
        isDone: isDone ?? false,
      );
      emit(AddTaskState(updated));
    }
  }

}