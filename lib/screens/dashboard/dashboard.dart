

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynews_app/const/styling.dart';
import 'package:http/http.dart'as http;
import 'package:mynews_app/screens/dashboard/presentations/Notification_news.dart';
import 'package:mynews_app/widgets/dashboardwidget.dart';
import '../../model/model.dart';


class MyHomePage extends StatefulWidget{
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController search_ctrl= TextEditingController();
  
  List <Article> articles=[];

  @override
  void initState(){
    super.initState();
    fetchArticles();
  }
  

Future<void> fetchArticles() async {
    
    final response = await http.get(Uri.parse(
        "https://newsapi.org/v2/everything?q=bitcoin&apiKey=26965304c1ae4cac9ceede9008818c8e"));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      setState(() {
        articles = (jsonData['articles'] as List)
            .map((data) => Article.fromJson(data))
            .toList();
      });
    } else {
      throw Exception('Failed to load articles');
    }
  
}


  @override

  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        leading:Icon(Icons.settings),
        title: Row(
          children: [
            Text("Discover",style: TextStyle(color: texttheme),),
            ],
        ),
        actions:[
          Text("Feeds",style: TextStyle(color: texttheme , fontSize: 20)),
          Icon(Icons.arrow_forward_ios)
        ],
        
      ),

      body:
        Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
               
                textfieldContainer(MediaQuery.of(context).size.height*0.05, MediaQuery.of(context).size.width, search_ctrl,"Search Here",const Icon(Icons.search)),
                SizedBox(height: 25,),
                
                SingleChildScrollView(scrollDirection: Axis.horizontal,
                  child: Row(children: [
                  imagecontainer("images/folders.png","MyFeed"),
                  imagecontainer("images/folder.png","All News"),
                  imagecontainer("images/flame.png","Trending"),
                  imagecontainer("images/star.png","Top Stories"),
                  imagecontainer("images/bookmark.png","Bookmark"),
                  imagecontainer("images/unseen.png","Unseen"),
            
                ],),),
            
                Row (
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                      normalText("Notifications", texttheme,15, FontWeight.w300),
                      normalText("Views", Colors.blueAccent,15, FontWeight.w300),
                    ]
                  ),
                
                normalText("__________", texttheme,15, FontWeight.w500),
            
            
            
           
                  Container(
                     height:345,
                    color: Color.fromARGB(255, 209, 215, 245),
                    child: ListView.builder(
                    shrinkWrap:true,
                    // physics:const NeverScrollableScrollPhysics(),
                    itemCount:9,
                    
                    itemBuilder: (context, index){
                      final article=articles[index];
                      return ListTile(
                        title:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child:
                              Text(article.title,style:TextStyle(fontSize:15,fontWeight: FontWeight.w500 , color: texttheme),),),
                              Container( height :50,width:50,decoration: BoxDecoration(
                              borderRadius:BorderRadius.circular(10)),
                              child: ClipRRect(borderRadius:BorderRadius.circular(10),child:Image.network(article.urlToImage, height:12 , width:12,fit:BoxFit.fill,))),
                                                      
                             ],
                            ),
                                  
                        subtitle: Text("Author: "+article.author,
                          style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              color: Colors.black54,
                            ),),
                        
                                  
                          onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailNews(article:article),
                            ),
                          );
                        },
                        
                      );
                    }),
                  ),
                  // ),
               
                  
                
                SizedBox(height: 40,),
                Row (
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                      normalText("Insights", texttheme,15, FontWeight.w300),
                      normalText("Views", Colors.blueAccent,15, FontWeight.w300),
                    ]),
                
                normalText("__________", texttheme,15, FontWeight.w500),
                
                
               
                
                    Expanded(child: 
                    ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount:10,
                      itemBuilder:(context ,index){
                        final Row_article=articles[index];
                        
                        return InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder:(context)=>DetailNews(article: Row_article)));
                          },

                          child: RowListViewContainer(Row_article.urlToImage));
                        
                        
                        },


                )
              ),
              
              
               
                
              ])
              ),
         
       
    

    );
    
    }
}
      
      
      
  