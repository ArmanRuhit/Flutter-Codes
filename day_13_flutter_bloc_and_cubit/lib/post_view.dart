import 'package:day_12_flutter_bloc_and_cubit/nav_cubit.dart';
import 'package:day_12_flutter_bloc_and_cubit/post_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state){
          if(state is LoadingPostsState){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          else if(state is LoadedPostsState){
            return RefreshIndicator(
              onRefresh: () async{
                BlocProvider.of<PostsBloc>(context).add(PullToRefresh());
              },
              child: ListView.builder(
                itemCount: state.posts.length,
                  itemBuilder: (context, index){
                    return Card(
                      child: ListTile(
                        title: Text(
                            state.posts[index].title
                        ),
                        onTap: () => BlocProvider.of<NavCubit>(context).showPostDetails(state.posts[index]),
                      ),
                    );
                  }),
            );
          }
          else if(state is FailedToLoadPostsState){
            return Center(
              child: Text('Error occured: ${state.error}'),
            );
          }
          else{
            return Container();
          }
        },
      ),
    );
  }
}
