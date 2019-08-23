import 'package:data/api/movie_api.dart';
import 'package:data/mappers/MovieMapper.dart';
import 'package:domain/models/movie.dart';

class MovieApiRepository {
  Stream<List<Movie>> getMovies() {
    return Stream.fromFuture(MovieApi.getMovies())
        .map((r) => MovieMapper.movietransform(r));
  }
}
