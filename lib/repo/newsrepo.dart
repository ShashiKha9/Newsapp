import 'package:flutter/cupertino.dart';
import 'package:newsapp/modals/news.dart';

import '../apiprovider.dart';

class NewsRepo{

ApiProvider _apiProvider = ApiProvider();

  Future<News> newsList()  {
    return _apiProvider.newslist();
  }
}