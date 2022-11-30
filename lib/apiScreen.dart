import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterdemo/NewsModel.dart';
import 'package:flutterdemo/PostModel.dart';
import 'package:http/http.dart' as http;

class ApiScreen extends StatefulWidget {
  const ApiScreen({Key? key}) : super(key: key);

  @override
  State<ApiScreen> createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {

  String country ="us";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Api")),
        body: Column(
          children: [
            Row(
              children: [
                ElevatedButton(onPressed: (){
                  setState(() {
                    country ="In";
                  });
                }, child: Text("India"),),
                ElevatedButton(onPressed: (){
                  setState(() {
                    country ="Uk";
                  });
                }, child: Text("Uk"),),
                ElevatedButton(onPressed: (){
                  setState(() {
                    country ="Au";
                  });
                }, child: Text("AU"),),
                ElevatedButton(onPressed: (){
                  setState(() {
                    country ="US";
                  });
                }, child: Text("US"),),
              ],
            ),


            Expanded(
              child: FutureBuilder(
                 future: apiCalling("$country"),
                builder: (contetx,snapshot){
                   if(snapshot.hasError)
                     {
                       return Text("${snapshot.error}");
                     }
                   else if(snapshot.hasData)
                     {
                       NewsModel? l1 = snapshot.data;

                       return ListView.builder(
                           itemCount: l1!.articles!.length,
                           itemBuilder: (context,index){
                            return ListTile(
                              title: Text("${l1.articles![index].title}"),
                              subtitle: Text("${l1.articles![index].source!.name}"),
                            );
                       });

                     }
                   return CircularProgressIndicator();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<NewsModel> apiCalling(String con) async {
  String apiLink = "https://newsapi.org/v2/top-headlines?country=$con&category=business&apiKey=1ee831619156425192704ed881bf244e";

  var jsonString = await http.get(Uri.parse(apiLink));
   var json = jsonDecode(jsonString.body);

   return NewsModel.fromJson(json); // Data in map {}

   // json.map((e)=>NewsMode.fromJson(e)).toList(); // Data In List []

}
