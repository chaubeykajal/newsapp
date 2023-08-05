
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:mynews_app/const/styling.dart';





Widget textfieldContainer(double field_h,double field_w,controller,hint_text,prefixicon){
  return Container( 
    height: field_h,
    width: field_w,
    decoration: BoxDecoration(borderRadius:BorderRadius.circular(10), boxShadow:[BoxShadow(color:const Color.fromARGB(255, 229, 226, 226).withOpacity(0.4),spreadRadius:0.2)] ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal:10.0),
      child: TextFormField(
        controller: controller,
        
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint_text,
          hintStyle: TextStyle(color: texttheme2),
          prefixIcon: prefixicon,
    
    
        ),
      ),
    )
  );
}


Widget imagecontainer(String img,String text, ){

  return Container(
    height:100,
    width:100,
    child: Column(
      children: [
        Image.asset(img, height:50,width: 50,),
        SizedBox(height:7,),
        Text(text),
      ],
    ),);
}



Widget normalText(String text, Color color ,double size,FontWeight weight){
  return
  Container(
    
    
    child: Text(text,style:TextStyle(color: color , fontSize: size , fontWeight:weight ),));
}




Widget RowListViewContainer(String img){
  return Stack(
    children: [Container(
    height:150,
    width:100,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
    child: ClipRRect(borderRadius:BorderRadius.circular(10),child: Image.network(img, fit:BoxFit.fill,)),
    
    ),
    const Padding(
      padding:EdgeInsets.symmetric(horizontal:30.0,vertical:10),
      child: Text("Insights",style: TextStyle(color: Colors.white),),
    )
    ],
    
  );
}



////            
           