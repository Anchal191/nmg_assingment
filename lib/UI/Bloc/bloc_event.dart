abstract class UserListEvent {}

class UserListFetchEvent extends UserListEvent {
  UserListFetchEvent();
}
class PostListFetchEvent extends UserListEvent {
  PostListFetchEvent();
}

class PostDetailFetchEvent extends UserListEvent {
  String id;
  PostDetailFetchEvent(this.id);
}