import 'dart:convert';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class ExampleTwo extends StatefulWidget {
  const ExampleTwo({Key? key}) : super(key: key);

  @override
  _ExampleTwoState createState() => _ExampleTwoState();
}

class _ExampleTwoState extends State<ExampleTwo> {
  var data;
  Future<void> getUserApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Course, example four'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
                  future: getUserApi(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text('Loading');
                    } else {
                      return ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: Column(
                                children: [
                                  reUsableRow(
                                    title: 'Name',
                                    value: data[index]['name'].toString(),
                                  ),
                                  reUsableRow(
                                    title: 'Username',
                                    value: data[index]['username'].toString(),
                                  ),
                                  reUsableRow(
                                    title: 'Email',
                                    value: data[index]['email'].toString(),
                                  ),
                                  reUsableRow(
                                    title: 'Address',
                                    value: data[index]['address']['street']
                                        .toString(),
                                  ),
                                ],
                              ),
                            );
                          });
                    }
                  }))
        ],
      ),
    );
  }
}

class reUsableRow extends StatelessWidget {
  reUsableRow({Key? key, required this.title, required this.value})
      : super(key: key);
  String title, value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value),
        ],
      ),
    );
  }
}
