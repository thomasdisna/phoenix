// import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ImagePage.dart';


class NewsDetailPage extends StatefulWidget {
  NewsDetailPage({this.Image,this.Title});
  String Image;
  String Title;
  @override
  _NewsDetailPageState createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {


  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ImagePage()),
          );

        },
      ),

      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(child: Text("TIMES OF INDIA",style: TextStyle(color: Colors.white,fontSize: 32,),)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: w,
              child:widget.Image!= null ? Image.network(widget.Image,fit: BoxFit.cover,)
                  :Image.network("https://static.toiimg.com/thumb/msid-47529300,width-1070,height-580,imgsize-110164,resizemode-75,overlay-toi_sw,pt-32,y_pad-40/photo.jpg",
                fit: BoxFit.cover,),

            ),
            Container(
              height:2000,
              width: w,

              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: widget.Title!=null?Text(widget.Title.toString(),

                  maxLines: null,
                  style: TextStyle(color: Colors.yellow,fontSize: 20,fontWeight: FontWeight.bold,
                    letterSpacing: 1,),):Text("No Title"),
              )
            ),


          ],
        ),
      ),
    );
  }
}
