import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/layout/cubit/states.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/shared/constants.dart';

class MovieCubit extends Cubit<MovieStates> {
  MovieCubit() : super(MovieInitialState());
  static MovieCubit get(context) => BlocProvider.of(context);

  bool isFave = false;

  List<MovieModel> movies = [];
  MovieModel? movieModel;

  void getData() {
    emit(MovieLoadingState());
    for (int i = 0; i < jsonData.length; i++) {
      movieModel = MovieModel.fromJson(jsonData[i]);
      movies.add(movieModel!);
    }
    emit(MovieSuccessState());
  }

  void changeFavIcon() {
    isFave = !isFave;
    emit(MovieChangeFavIconState());
  }
}
