import 'dart:convert';
import 'dart:ui';

import 'package:ars_progress_dialog/dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:newsapp/modals/news.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:newsapp/modals/news.dart';

import 'modals/news.dart';


class ApiProvider{
  final Dio _dio =Dio();
  final String url = "https://api.first.org/data/v1/news";



  Future <News> newslist() async {
  // ArsProgressDialog progressDialog = ArsProgressDialog(
  //     context,
  //     blur: 2,
  //     backgroundColor: Color(0x33000000),
  //     animationDuration: Duration(milliseconds: 500));

  // progressDialog.show();

  try {

    Response response =  await _dio.get(url);
    print("api 1");
    print("hello");

    // progressDialog.dismiss();

    return News.fromJson(response.data);

  } catch (error, stacktrace) {
    // Fluttertoast.showToast(msg: "server error",);

    print("Exception occured: $error stackTrace: $stacktrace");
    // progressDialog.dismiss();
    return News.withError(error);
  }

  }
  }


