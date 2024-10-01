import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class Post {
  final int id;
  final String url;
  final String slug;
  final String content;
  final String title;
  final String image;

  Post(
      {required this.id,
      required this.url,
      required this.slug,
      required this.content,
      required this.image,
      required this.title});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        id: json['id'],
        slug: json['slug'],
        url: json['url'],
        title: json['title'],
        content: json['content'],
        image: json['image']);
  }
  Map<String,dynamic> toJson(){
    return {
      'id':id,
      "url" : url,
      "title" : title,
      "content" :content,
      "image" :image
    };
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ListUser(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

class ListUser extends StatefulWidget {
  const ListUser({super.key});

  @override
  State<ListUser> createState() => _ListUserState();
}

class _ListUserState extends State<ListUser> {
 

  Future<List<Post>> fetchAllPosts() async {
    final res = await http.get(
        Uri.parse('https://jsonplaceholder.org/posts')); // Fixed URL
    if (res.statusCode == 200) {
      List jsonResponse = jsonDecode(res.body);
      
      var data = jsonResponse.map((post) => Post.fromJson(post)).toList();
   
      return data;// Print each post in the terminal
    }else{
      throw Exception();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text("My app"),
       ),
     body: Center(
      child: FutureBuilder(future: fetchAllPosts(), builder: (context,snap){
        if(snap.hasData){
          return ListView.builder(
            itemCount: snap.data?.length,
            
            itemBuilder: (BuildContext context, int index){
            return Card(
              child:  ListTile(leading:CircleAvatar(backgroundImage: NetworkImage(snap.data![index].image)),title:  Text(snap.data![index].title),subtitle:Text(snap.data![index].content,overflow: TextOverflow.ellipsis,)),
            );
          });
        }
        else if (snap.hasError){
          return Text("no data");
        }
        return Center(child: CircularProgressIndicator(),);
      }),
     ),
    ); 
  }
}

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
      
//       body: ListView.builder(
//           itemCount: 10,
//           itemBuilder: (BuildContext context, int index) {
//             return ListTile(title: Text("List item $index"));
//           }),
          
//     );
//   }
// }
