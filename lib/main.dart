import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_bloc/to_do_cubit/to_do_cubit.dart';
import 'package:to_do_list_bloc/todo_app.dart';




void main() => runApp(MaterialApp(
  home: BlocProvider(create: (BuildContext context) => ToDoCubit(),
  child: TodoAppWithoutStateManagement(),
  ),
  theme: ThemeData(primarySwatch: Colors.teal),
));
