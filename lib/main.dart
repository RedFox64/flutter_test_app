import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/cubit/character_list/character_list_cubit.dart';
import 'package:test_app/screens/list.dart';

void main() {
  runApp(
    BlocProvider<CharacterListCubit>(
      create: (BuildContext context) => CharacterListCubit(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CharacterListScreen(),
    );
  }
}
