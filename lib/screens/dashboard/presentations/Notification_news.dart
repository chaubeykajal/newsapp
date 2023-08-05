

import 'package:flutter/material.dart';
import 'package:mynews_app/const/styling.dart';
import 'package:mynews_app/model/model.dart';


class DetailNews extends StatelessWidget{

  final Article article;

  const DetailNews({required this.article});


  @override
  Widget build(BuildContext context){

  
  return Scaffold(
    appBar: AppBar(
      title: Text("My Feeds",style:TextStyle(color: texttheme)),
      actions: [Icon(Icons.arrow_upward_outlined)],),

      body:Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height*0.40,
              width: MediaQuery.of(context).size.width,
              child:Image.network(article.urlToImage,fit:BoxFit.fill),

            ),
            Text(article.title,style: TextStyle(fontSize:20, fontWeight: FontWeight.w500,color:texttheme),),

            Text(article.description,style: TextStyle(fontSize:15, fontWeight: FontWeight.w300,color:texttheme2),)
          ],
        ),
      )

  );

  }
}
