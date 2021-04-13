import 'package:day_12_flutter_bloc_and_cubit/data_service.dart';
import 'package:day_12_flutter_bloc_and_cubit/post.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsCubit extends Cubit<List<Post>>{
  DataService _dataService = DataService();
  PostsCubit() : super([]);

  void getPosts() async => emit(await _dataService.getPost());

}

abstract class PostsEvent{}
class LoadPostsEvent extends PostsEvent{}
class PullToRefresh  extends PostsEvent{}

abstract class PostsState{}
class LoadingPostsState extends PostsState{}

class LoadedPostsState extends PostsState{
  List<Post> posts;
  LoadedPostsState({this.posts});
}

class FailedToLoadPostsState extends PostsState{
  Error error;
  FailedToLoadPostsState({this.error});
}


class PostsBloc extends Bloc<PostsEvent, PostsState>{
  DataService _dataService = DataService();
  PostsBloc() : super(LoadingPostsState());

  @override
  Stream<PostsState> mapEventToState(PostsEvent event) async*{
    if(event is LoadPostsEvent || event is PullToRefresh){
      yield LoadingPostsState();
      try{
        final posts = await _dataService.getPost();
        yield LoadedPostsState(posts: posts);
      } catch(e){
        yield FailedToLoadPostsState(error: e);

      }
    }

  }
}
