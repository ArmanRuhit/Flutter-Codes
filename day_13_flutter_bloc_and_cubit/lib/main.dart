import 'package:day_12_flutter_bloc_and_cubit/app_navigator.dart';
import 'package:day_12_flutter_bloc_and_cubit/nav_cubit.dart';
import 'package:day_12_flutter_bloc_and_cubit/post_cubit.dart';
import 'package:day_12_flutter_bloc_and_cubit/post_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => NavCubit()),
      BlocProvider<PostsBloc>(
      create: (context) => PostsBloc()..add(LoadPostsEvent()),)
        ],
        child: AppNavigator(),
      ),
    );
  }
}
