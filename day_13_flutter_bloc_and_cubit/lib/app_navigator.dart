import 'package:day_12_flutter_bloc_and_cubit/post.dart';
import 'package:day_12_flutter_bloc_and_cubit/post_details.dart';
import 'package:day_12_flutter_bloc_and_cubit/post_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'nav_cubit.dart';

class AppNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavCubit, Post>(
      builder: ((context, post){
        return Navigator(
          pages:[
            MaterialPage(child: PostsView()),
            if(post != null) MaterialPage(
                  child: PostDetailsView(post: post,),
              )
          ],
          onPopPage: (route, result){
            BlocProvider.of<NavCubit>(context).popToPosts();
            return route.didPop(result);
          },
        );
      }),
    );
  }
}
