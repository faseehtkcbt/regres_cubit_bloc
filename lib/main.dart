import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:regres_cubit_bloc/Cubit/search_user_cubit.dart';
import 'package:regres_cubit_bloc/bloc/user_new_bloc.dart';
import 'package:regres_cubit_bloc/screens/homeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<UserNewBloc>(create: (context) => UserNewBloc()),
          BlocProvider<SearchUserCubit>(create: (context) => SearchUserCubit()),
        ],
        child: const HomeScreen(),
      ),
    );
  }
}
