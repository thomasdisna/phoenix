import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:vphoenixtest/MODEL/newsModel.dart';
import 'package:vphoenixtest/Repo/RepoPage.dart' as repo;


class NewsContro extends ControllerMVC{
  GlobalKey<ScaffoldState> scaffoldKey;
  GlobalKey<FormState> RegFormKey;
  List NewsValue = [];

  NewsContro() {
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
    RegFormKey = new GlobalKey<FormState>();
  }




  void getNew() async {
    repo.getNews().then((value) {
      print("Response of LanguageListt---- --> " + value.toString());
      setState(() {
        NewsValue = value["articles"];

        // leng = value["articles"].toString().length;
        // print("lenggggggggggggggggggggggg"+leng.toString());
        // title = value["articles"][0]["title"].toString();
        // print("titleeeeeeeeeeeeeeee"+title);


      });
    });
  }




}