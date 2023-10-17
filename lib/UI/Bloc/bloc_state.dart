

import '../data/Model/postDetail.dart';
import '../data/Model/postList_model.dart';
import '../data/Model/userList.dart';

abstract class UserListState {}

class UserListInitialState extends UserListState {}
class UserListLoadingState extends UserListState {}

class UserListDataState extends UserListState {
  final List<UserListModel> userList;
  UserListDataState(this.userList);
}

class PostListDataState extends UserListState {
  final List<PostListModel> postList;
  PostListDataState(this.postList);
}

class PostDetailDataState extends UserListState {
  final PostDetailModel postdetail;
  PostDetailDataState(this.postdetail);
}

class ErrorState extends UserListState {
  final String message;
  ErrorState(this.message);
}