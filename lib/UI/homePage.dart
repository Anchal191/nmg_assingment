import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Bloc/bloc.dart';
import 'Bloc/bloc_event.dart';
import 'Bloc/bloc_state.dart';
import 'data/Model/postList_model.dart';
import 'data/Model/userList.dart';

class HomePageScreen extends StatelessWidget {
   HomePageScreen({Key? key}) : super(key: key);

  List<UserListModel> userList = [];
  List<PostListModel> postList = [];
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<UserListBloc>(context).add(UserListFetchEvent());
    BlocProvider.of<UserListBloc>(context).add(PostListFetchEvent());
    return Scaffold(
      appBar: AppBar(
        title: Text('Author Post'),
        centerTitle: true,
      ),
      body: BlocConsumer<UserListBloc, UserListState>(
        listener: (context, state) {
          if(state is UserListDataState) {
            userList = state.userList;
          }
          if(state is PostListDataState) {
            postList = state.postList;
          }
        },
        builder: (context, state) {
          if(state is UserListLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: userList.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext ctx, int i) {
                List<PostListModel> userPosts = postList
                    .where((post) => post.userId == userList[i].id)
                    .toList();

                return Container(
                  padding: const EdgeInsets.all(10.0),
                  margin: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: Colors.amberAccent,
                         // border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Text(
                            '${userList[i].name}',
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                          ),
                          Icon(Icons.my_library_books)
                        ],),
                      ),

                      SizedBox(height: 8.0),
                      ListView.builder(
                        itemCount: userPosts.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext ctx, int j) {
                          return InkWell(
                            onTap: (){
                              print(userPosts[j].id);
                              Navigator.pushNamed(context, '/postdetail',arguments: {'id' :userPosts[j].id.toString(),});
                            },
                            child: Card(
                              elevation: 2,
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(child:  Text(userPosts[j].title.toString()),),
                                    Icon(Icons.arrow_forward_ios_rounded,size: 15,)
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }


}
