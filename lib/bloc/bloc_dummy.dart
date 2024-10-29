import 'dart:convert';

import 'package:flutter_application_1/Page.dart';
import 'package:flutter_application_1/model/Product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

abstract class ProductEvent{} 

class FetchProducts extends ProductEvent{}
//bloc state
abstract class ProductState{}
class ProductInitial extends ProductState{}
class ProductLoading extends ProductState{}

class ProductLoaded extends ProductState{
   final List<Products> products;
   ProductLoaded(this.products);
}


class ProductError extends ProductState{
   final  String  error;
   ProductError(this.error);
}

//Update Bloc
class ProductBloc extends Bloc<ProductEvent,ProductState>{
ProductBloc() :super(ProductInitial()){
  on<FetchProducts>(_onFetchProducts);
}

 
Future<void> _onFetchProducts(
  FetchProducts event,
  Emitter<ProductState> emit,
) async{
  emit(ProductLoading());
  try {
     final res = await http.get(Uri.parse('https://dummyjson.com/products'));
    List<Products> prod;
    if (res.statusCode == 200) {
      var jsonResponse = jsonDecode(res.body);
      List products = jsonResponse['products'];
     prod =  products.map((post) => Products.fromJson(post)).toList();
      emit(ProductLoaded(prod));
    }
   
  } catch (e) {
    emit(ProductError("error $e"));
  }
}

}