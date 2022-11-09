

import 'dart:convert';import 'package:flutter_riverpod/flutter_riverpod.dart';


import 'package:flutter_riverpod_sample/model/user_model.dart';
import 'package:http/http.dart';

class ApiService {
  final String endPoint = "https://reqres.in/api/users?page=2";

  Future<List<UserModel>>  getUser() async{
    Response response = await get(Uri.parse(endPoint));
    if(response.statusCode ==200){
      final List<UserModel>  list = jsonDecode(response.body)['data'] as List<UserModel>;
      return Future.value(list);
    }else{
      throw Exception(response.reasonPhrase);
    }
  }


}

final apiProvider = Provider<ApiService>((ref)=> ApiService());
