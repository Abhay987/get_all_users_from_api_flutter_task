import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:getallusersfromapi/user_model.dart';
import 'package:http/http.dart' as http;
import 'api.dart';
import 'package:flutter/material.dart';
class ApiManeger {
  Dio dio = Dio();
    var  userModelData;
  Future<UserModel> submit(BuildContext context)async{
    try {
      var response = await http.get(Uri.parse(API.getAllUser));
      if (response.statusCode == 200) {
        var message = jsonDecode(response.body);
        debugPrint(message);
        userModelData = UserModel.fromJson(message);
        debugPrint('Has Data');
      }
    } catch (e) {
      if(e.runtimeType == SocketException) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Check Internet Connection')));
      }
      else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Something Wrong ! Please try again later')));
      }
    }
    return userModelData;
  }
}