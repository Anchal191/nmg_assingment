import 'package:dio/dio.dart';
import 'package:nmg_assingment/UI/data/service.dart';

import 'Model/postDetail.dart';
import 'Model/postList_model.dart';
import 'Model/userList.dart';

class UserListRepo {

  DioClient dio = DioClient();

  Future<List<UserListModel>> fetchuserList() async{
    try{
      Response response = await dio.get('https://jsonplaceholder.typicode.com/users');
      List<dynamic> resMap = response.data;
      return resMap.map((userMap) => UserListModel.fromJson(userMap)).toList();
    } catch(ex) {
      throw ex;
    }
  }

  Future<List<PostListModel>> fetchpostList() async{
    try{
      Response response = await dio.get('https://jsonplaceholder.typicode.com/posts');
      List<dynamic> resMap = response.data;
      return resMap.map((userMap) => PostListModel.fromJson(userMap)).toList();
    } catch(ex) {
      throw ex;
    }
  }

  Future<PostDetailModel> fetchpostDetail(String id) async{
    try{
      Response response = await dio.get('https://jsonplaceholder.typicode.com/posts/'+ id);
      Map<String, dynamic> resMap = response.data;
      PostDetailModel postDetailModel = PostDetailModel.fromJson(resMap);
      return postDetailModel;
    } catch(ex) {
      throw ex;
    }
  }
}