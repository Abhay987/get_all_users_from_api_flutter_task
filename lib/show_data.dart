import 'package:flutter/material.dart';
import 'package:getallusersfromapi/api.dart';
import 'package:getallusersfromapi/api_manager.dart';
import 'package:getallusersfromapi/user_model.dart';

class ShowData extends StatefulWidget {
  const ShowData({Key? key}) : super(key: key);

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  late Future<UserModel> userModel;
  ApiManeger apiManeger = ApiManeger();
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    userModel = apiManeger.submit(context);
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('the user model data is : $userModel');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Users'),
      ),
      body: FutureBuilder<UserModel>(
        future: userModel,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text('${snapshot.data!.page}');
            /*   return ListView.builder(itemCount: snapshot.data!["data"].length,itemBuilder: (context,index){
      return ListTile(title: Text('${snapshot.data!['data']}'),);
    },);*/
          } else if (snapshot.hasError) {
            return Text('${snapshot.hasError}');
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
