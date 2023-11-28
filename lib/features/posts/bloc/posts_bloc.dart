import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:democallapi/features/posts/models/post_data_ui_model.dart';
import 'package:democallapi/features/posts/response/posts_response.dart';
import 'package:meta/meta.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    on<PostsInitialFetchEvent>(postsInitialFetchEvent);
    on<PostAddEvent>(postAddEvent);
  }

  FutureOr<void> postsInitialFetchEvent(
      PostsInitialFetchEvent event, Emitter<PostsState> emit) async {
    emit(PostFeatchingLoadingState());

    List<PostDataUIModel> posts = await PostsResponse.fetchPosts();

    emit(PostFetchingSuccessfullState(posts: posts));
  }

  FutureOr<void> postAddEvent(
      PostAddEvent event, Emitter<PostsState> emit) async {
    bool success = await PostsResponse.addPost();
    print(success);
    if (success) {
      emit(PostsAdditionSuccessState());
    } else {
      emit(PostsAdditionErrorState());
    }
  }
}
