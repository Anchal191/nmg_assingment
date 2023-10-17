import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Bloc/bloc.dart';
import 'Bloc/bloc_event.dart';
import 'Bloc/bloc_state.dart';
import 'data/Model/postDetail.dart';
import 'data/Model/postList_model.dart';
import 'data/Model/userList.dart';

class PostDetailScreen extends StatelessWidget {
  String id;
  PostDetailScreen(this.id,{Key? key}) : super(key: key);

  PostDetailModel postDetailModel = PostDetailModel();
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<UserListBloc>(context).add(PostDetailFetchEvent(id));
    return Scaffold(
      appBar: AppBar(
        title: Text('Author Post Detail'),
        centerTitle: true,
      ),
      body: BlocConsumer<UserListBloc, UserListState>(
        listener: (context, state) {
          if(state is PostDetailDataState) {
            postDetailModel = state.postdetail;
          }
        },
        builder: (context, state) {
          if(state is UserListLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              margin: const EdgeInsets.all(8.0),
              child: Column(
              mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(postDetailModel.title.toString(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text(postDetailModel.body.toString()),
              ],),
            );
          }
        },
      ),
    );
  }


}
