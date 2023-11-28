part of 'posts_bloc.dart';

@immutable
abstract class PostsState {}

abstract class PostsActionState extends PostsState {}

class PostsInitial extends PostsState {}

class PostFeatchingLoadingState extends PostsState {}

class PostFeatchingErrorState extends PostsState {}

class PostFetchingSuccessfullState extends PostsState {
  List<PostDataUIModel> posts;
  PostFetchingSuccessfullState({
    required this.posts,
  });
}

class PostsAdditionSuccessState extends PostsActionState {}

class PostsAdditionErrorState extends PostsActionState {}
