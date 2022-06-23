import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:getallusersfromapi/api.dart';
import 'package:getallusersfromapi/user_model.dart';

class ShowData extends StatefulWidget {
  const ShowData({Key? key}) : super(key: key);

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
   UserModel? userModel;
  Dio _dio =Dio();
  Future<void> getProfile() async {
    try {
      var response = await _dio.get(API.getAllUser);
      if (response.statusCode == 200) {
        userModel = UserModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      if(e.runtimeType == SocketException) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Check Internet Connection')));
      }
      else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Something Wrong ! Please try again later')));
      }
    }
  }
  @override
  void initState() {
    super.initState();
    getProfile();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('the user model data is : ${userModel!.totalPages}');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Users'),
      ),
      body: ListView.builder(itemCount: userModel!.data.length,
          itemBuilder: (context,index){
        if(userModel?.data[index].firstName == null)
          {
            return const ListTile(
              leading: Text('null'),
              title: Text('null'),
              trailing: Text('null'),
            );
          }
        return ListTile(
          leading: Text('${userModel!.data[index].id}'),
          title: Text(userModel!.data[index].firstName),
          trailing: Text(userModel!.data[index].email),
        );
      }),
    );
  }
}
