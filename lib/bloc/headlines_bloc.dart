import 'dart:convert';

import 'package:flutter_application_1/models/Artical.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

abstract class HeadlineEvent{} 

class FetchHeadlines extends HeadlineEvent{}
//bloc state
abstract class HeadlineState{}
class HeadlineInitial extends HeadlineState{}
class HeadlineLoading extends HeadlineState{}

class HeadlineLoaded extends HeadlineState{
   
   final List<Article> articles;
   HeadlineLoaded(this.articles);
}


class HeadlineError extends HeadlineState{
   final  String  error;
   HeadlineError(this.error);
}

//Update Bloc
class HeadlineBloc extends Bloc<HeadlineEvent,HeadlineState>{
HeadlineBloc() :super(HeadlineInitial()){
  on<FetchHeadlines>(_onFetchHeadlines);
}

 
Future<void> _onFetchHeadlines(
  FetchHeadlines event,
  Emitter<HeadlineState> emit,
) async{
  emit(HeadlineLoading());
  try {
        final res = await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?country=us&apiKey=abb021fcd9124fe4a756d19365dc0136'));
        List<Article> article;
    if (res.statusCode == 200) {
      var jsonResponse = jsonDecode(res.body);
      List articles = jsonResponse['articles'];

    article = articles.map((post) => Article.fromJson(post)).toList();
    
      emit(HeadlineLoaded(article));
    }
   
  } catch (e) {
    emit(HeadlineError("error $e"));
  }
}

}