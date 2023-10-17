import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/Model/postDetail.dart';
import '../data/Model/postList_model.dart';
import '../data/Model/userList.dart';
import '../data/repo.dart';
import 'bloc_event.dart';
import 'bloc_state.dart';

class UserListBloc extends Bloc<UserListEvent, UserListState> {
  UserListBloc() : super(UserListInitialState()) {

    on<UserListFetchEvent>((event, emit) async {
      emit(UserListLoadingState());
      List<UserListModel> userList = await UserListRepo().fetchuserList();
      emit(UserListDataState(userList));
    });

    on<PostListFetchEvent>((event, emit) async {
      emit(UserListLoadingState());
      List<PostListModel> postList = await UserListRepo().fetchpostList();
      emit(PostListDataState(postList));
    });

    on<PostDetailFetchEvent>((event, emit) async {
      emit(UserListLoadingState());
      await UserListRepo().fetchpostDetail(event.id).then((response){
        emit(PostDetailDataState(response));
      }).catchError((onError){
        if(onError.response!.statusCode == 404) {
          emit(ErrorState(onError.response!.data['error'].toString()));
        } else {
          emit(ErrorState('Something went wrong! Try again'));
        }
      });
    });

  }
}