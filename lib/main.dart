import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/layout/cubit/cubit.dart';
import 'package:movie_app/layout/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieCubit()..getData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'M Movies',
        theme: ThemeData(
          fontFamily: 'Roboto',
        ),
        home: HomePage(),
      ),
    );
  }
}
