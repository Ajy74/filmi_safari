import 'package:filmi_safari/data/models/recent_movie_model.dart';
import 'package:filmi_safari/data/models/upcoming_movie_model.dart';
import 'package:filmi_safari/data/repositories/movies/now_playing.dart';
import 'package:filmi_safari/data/repositories/movies/upcoming.dart';
import 'package:filmi_safari/logic/blocs/movie%20bloc/movie_event.dart';
import 'package:filmi_safari/logic/blocs/movie%20bloc/movie_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class MovieBloc extends Bloc<MovieEvent,MovieState>{
  MovieBloc() : super(MovieInitialState()) {

    on<MovieLoadEvent>((event, emit) async{
        emit( MovieLoadingState() );
        // await Future.delayed(Duration(seconds: 2),() {
        //   emit( MovieLoadedState() ); // finally all movie loded
        // },);
        try {
          RecentMovieModel hindiMovie = await NowPlayingMovies.getRecentIndia();
          // RecentMovieModel hindiMovie = await NowPlayingMovies.getRecentHindi();
          emit( MovieLoadedState(hindiMovie) );
        } catch (e) {
          emit( MovieErrorState("Something Went Wrong!") );
        }
    });

    on<MovieClickEvent>((event, emit) async{
        print("<<movie details>>");
        print(event.movie);
    });

  }
}

class RecentIndiaMovieBloc extends Bloc<MovieEvent,MovieState>{
  RecentIndiaMovieBloc() : super(MovieInitialState()) {

    on<RecentIndiaMovieLoadEvent>((event, emit) async{
        emit( RecentIndiaMovieLoadingState() );
        try {
          RecentMovieModel recentIndia = await NowPlayingMovies.getRecentIndia();
          emit( RecentIndiaMovieLoadedState(recentIndia) );
        } catch (e) {
          emit( RecentIndiaMovieErrorState("Something Went Wrong!") );
        }
    });

    on<MovieClickEvent>((event, emit) async{
        // print("<<movie details>>");
        print(event.movie.overview.toString());
        print(event.movie.releaseDate.toString());
    });

  }
}

class RecentWorldMovieBloc extends Bloc<MovieEvent,MovieState>{
  RecentWorldMovieBloc() : super(MovieInitialState()) {

    on<RecentWorldMovieLoadEvent>((event, emit) async{
        emit( RecentWorldMovieLoadingState() );
        try {
          RecentMovieModel recentWorld = await NowPlayingMovies.getRecentWorld();
          emit( RecentWorldMovieLoadedState(recentWorld) );
        } catch (e) {
          emit( RecentWorldMovieErrorState("Something Went Wrong!") );
        }
    });

     on<MovieClickEvent>((event, emit) async{
        // print("<<movie details>>");
        print(event.movie.overview.toString());
        print(event.movie.releaseDate.toString());
    });

  }
}


class UpcomingMovieBloc extends Bloc<MovieEvent,MovieState>{
  UpcomingMovieBloc() : super(MovieInitialState()) {

    on<UpcomingMovieLoadEvent>((event, emit) async{
        emit( RecentWorldMovieLoadingState() );
        try {
          UpcomingMovieModel upcoming = await Upcoming.getUpcoming();
          emit( UpcomingMovieLoadedState(upcoming) );
        } catch (e) {
          emit( RecentWorldMovieErrorState("Something Went Wrong!") );
        }
    });

     on<MovieClickEvent>((event, emit) async{
        // print("<<movie details>>");
        print(event.movie.overview.toString());
        print(event.movie.releaseDate.toString());
    });
  }
}