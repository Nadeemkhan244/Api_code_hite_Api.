import 'package:apitutoral/Modles/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class Examplethree extends StatefulWidget {
  const Examplethree({super.key});

  @override
  State<Examplethree> createState() => _ExamplethreeState();
}

class _ExamplethreeState extends State<Examplethree> {
  List<UserModel> userList = [] ;
  Future<List<UserModel>> getUserApi()async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      for(Map i in data){
        print(i['name']);
        userList.add(UserModel.fromJson(i));
      }
      return userList;
    }else {
      return userList;
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
                 future: getUserApi(),
                 builder: (context , AsyncSnapshot<List<UserModel>> snapshot){
                   if(!snapshot.hasData){
                     return CircularProgressIndicator();
                   }else{
                     return ListView.builder(
                         itemCount: userList.length,
                         itemBuilder: (context , index){
                           return Card(
                                child:  Column(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                      Text('Name'),
                                      Text(snapshot.data![index].name.toString()),
                                     //ReusbaleRow(title : 'Name', value: snapshot.data![index].name.toString())
                                   ],
                                 ),
                           );
                         }
                     );
                   }

                 }
             )
         )
        ],
      ),
    );
  }
}

