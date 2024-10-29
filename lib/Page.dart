import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/bloc_dummy.dart';
import 'package:flutter_application_1/model/Product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class MyProducts extends StatefulWidget {
  const MyProducts({super.key});

  @override
  State<MyProducts> createState() => _MyProductsState();
}

class _MyProductsState extends State<MyProducts> {
  Future<List<Products>> fetchAllPosts() async {
    final res = await http.get(Uri.parse('https://dummyjson.com/products'));
    if (res.statusCode == 200) {
      var jsonResponse = jsonDecode(res.body);
      List products = jsonResponse['products'];

      return products.map((post) => Products.fromJson(post)).toList();
    } else {
      throw Exception();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          shadowColor: Colors.black,
          surfaceTintColor: Colors.white,
          elevation: 1,
          backgroundColor: Colors.white,
          title: const Text(
            "Products",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.notifications_outlined),
              color: const Color.fromARGB(255, 90, 1, 105),
              tooltip: 'Notification Icon',
              onPressed: () {},
            )
          ],
        ),
        body: BlocBuilder<ProductBloc,ProductState>(builder: (context,state){
          if(state is ProductLoading){
   return Text("hi");
          }else if(state is ProductLoaded) {
            return   ListView.builder(
                      itemCount: state.products.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 2),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(
                                  16.0), //
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListTile(
                                    title: Text(state.products[index].title),
                                    leading: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                          state.products[index].images[0])),
                                    subtitle: Column(children: [Text(state.products[index].description),Text(state.products[index].price.toString()),Wrap(
                                        spacing:
                                            8.0, 
                                        runSpacing:
                                            4.0, 
                                        children: state.products[index].tags
                                            .map<Widget>((tag) {
                                          return Text(tag);
                                        }).toList()),],) 
                                  ),
                                  Text(state.products[index].reviews[0].comment)
                                ],
                              ),
                            ),
                          ),
                        );
                      });;
          }else if (state is ProductError){
            return Center(child: Text(state.error));

          }
          return CircularProgressIndicator();


        })
       
        );
  }
}