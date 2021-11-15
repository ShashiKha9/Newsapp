import 'package:flutter/cupertino.dart';
import 'package:newsapp/modals/news.dart';
import 'package:newsapp/repo/newsrepo.dart';
import 'package:rxdart/rxdart.dart';

class NewsBloc{
  final NewsRepo _repository = NewsRepo();
  final BehaviorSubject<News> _news =
  BehaviorSubject<News>();

  newslist( ) async {
    News response = await _repository.newsList();


    _news.sink.add(response);
  }

dispose() {
  _news.close();

  print("DISPOSED");
}
unSubscribeEvents(){
  _news.add(null!);


}
BehaviorSubject<News> get newsList =>
    _news;



}
final bloc = NewsBloc();