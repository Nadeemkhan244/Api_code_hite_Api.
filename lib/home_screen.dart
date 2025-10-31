import 'dart:convert';
import 'package:apitutoral/Modles/PostModles.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PostModles> postList = [];

  Future<List<PostModles>> getPostApi() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);

      // ✅ Fixed line below
      return jsonList
          .map((item) => PostModles.fromJson(item as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('khan'),
         backgroundColor: Colors.teal,
       ),
      body: Column(
        children: [
        Expanded(
          child: FutureBuilder(
              future: getPostApi(),
            builder: (context , snapshot ) {
              if (!snapshot.hasData) {
                return Text('Loading');
              } else {
                return ListView.builder(
                    itemCount: postList.length,
                    itemBuilder: (context, index){
                      return Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(postList[index].title.toString()),
                            Text(postList[index].title.toString()),
                            Text(postList[index].title.toString())
                          ],
                        ),
                      );
                    }
                );
              }
            },
          ),
        )
        ],
      ),
    );
  }
}
