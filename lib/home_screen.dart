import 'dart:convert';

import 'package:apitutorial/Models/PostsModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PostsModel> postList = [];
  Future<List<PostsModel>> getPostApi () async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200) {
      for(Map i in data){
        postList.add(PostsModel.fromJson(i));
      }
      return postList;
    }
    return postList;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Course'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          FutureBuilder(
            future: getPostApi(),
            builder: (context, snapshot){
              if (!snapshot.hasData) {
                return const Text('Loading');

              }else {
                return ListView.builder(
                    itemCount: postList.length,
                    itemBuilder: (context, index) {
                  return Text(index.toString());
                });

              }
            },
          )
        ],
      ),
    );
  }
}
