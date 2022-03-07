import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/layout/cubit/cubit.dart';
import 'package:movie_app/layout/cubit/states.dart';
import 'package:movie_app/shared/components.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen(this.index, {Key? key}) : super(key: key);
  int index;

  @override
  Widget build(BuildContext context) {
    Size? size = MediaQuery.of(context).size;
    return BlocConsumer<MovieCubit, MovieStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = MovieCubit.get(context);

          return buildDetailsScreen(context, index, cubit);
        });
  }
}
