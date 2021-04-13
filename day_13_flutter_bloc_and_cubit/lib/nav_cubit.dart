import 'package:day_12_flutter_bloc_and_cubit/post.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavCubit extends Cubit<Post>{
  NavCubit(): super(null);

  void showPostDetails(Post post) => emit(post);

  void popToPosts() => emit(null);
}