import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:vphoenixtest/CONTROLER/ControllerPage.dart';

import 'NewsDetailPage.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends StateMVC<NewsPage> {
  NewsContro _con;

  _NewsPageState() : super(NewsContro()) {
    _con = controller;
  }
  @override
  void initState() {
   _con.getNew();

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(child: Text("TIMES OF INDIA",style: TextStyle(color: Colors.white,fontSize: 32,),)),
      ),
      body: _con.NewsValue.length!=null ?SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30,),
            Container(
              height: _con.NewsValue.length.toDouble()*120,
              child: ListView.separated(physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext  context,int index){
                return InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              NewsDetailPage(Image:_con.NewsValue[index]["urlToImage"],Title:_con.NewsValue[index]["title"] ,)),
                    );
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left:20.0,right: 10),
                        child: Container(
                          height: 100,
                          width: 100,
                          child: _con.NewsValue[index]["urlToImage"]!=null?
                          Image.network(_con.NewsValue[index]["urlToImage"],fit: BoxFit.cover,):
                              Image.network("https://static.toiimg.com/thumb/msid-47529300,width-1070,height-580,imgsize-110164,resizemode-75,overlay-toi_sw,pt-32,y_pad-40/photo.jpg",fit: BoxFit.cover,)
                        ),
                      ),
                      Column(crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Container(
                            height:30,
                            width: w/2,

                            child:_con.NewsValue[index]["title"] !=null? Text(
                              _con.NewsValue[index]["title"],
                              overflow: TextOverflow.ellipsis,
                              maxLines: null,


                              style: TextStyle(color: Colors.yellow,fontSize: 20,fontWeight: FontWeight.bold,
                                letterSpacing: 1,),):Text("No Title"),
                          ),
                          Container(
                            height:30,
                            width: w/2,


                            child:_con.NewsValue[index]["description"]!=null?  Text(_con.NewsValue[index]["description"],
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w700),
                            ):Text("No Description"),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
                  separatorBuilder: (BuildContext  context,int index){
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Divider(height: 1,color: Colors.grey[500],thickness: 1),
                    );
                  },
                  itemCount:_con.NewsValue.length),
            ),
          ],
        ),
      ):CircularProgressIndicator(backgroundColor: Colors.cyan,),

    );
  }
}
