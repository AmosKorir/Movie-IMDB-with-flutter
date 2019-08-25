import 'package:data/api/movie_api.dart';
import 'package:data/mappers/MovieMapper.dart';
import 'package:domain/models/Page.dart';
import 'package:domain/models/Videos.dart';
class MovieApiRepository {
  Stream<Page> getMovies(int page,String type) {
    return Stream.fromFuture(MovieApi.getMovies(page,type))
        .map((r) => MovieMapper.movietransform(r));
  }

  Stream<List<Results>>getVideo(String id) {
   return Stream.fromFuture(MovieApi.getVideo(id))
       .map((r)=>MovieMapper.videotranform(r));
  }
}
