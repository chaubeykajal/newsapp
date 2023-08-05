// import 'package:flutter/material.dart';

// class MyClickableWidget extends StatefulWidget {

//   final  Function ontab;
//   final Image? imgurl;
//   final Function? onlongpress;
//   const MyClickableWidget({required this.ontab, required this.imgurl, required this.onlongpress});
  
  

//   @override

//   _MyClickableWidgetState createState() => _MyClickableWidgetState();
// }



// class _MyClickableWidgetState extends State<MyClickableWidget> {

   
   
//      get onlongpress => null;
     
//        get imgurl => null;
   
//     // get imgurl => null;
//     // get onlongpress => null;
//     // get ontap => null;
  
   
    

//   void _resetsize(){
//     setState((){
//       _widgetsize=100.0;

//     });
//   }

//   void _increasesize(){

//     setState((){
//       _widgetsize=_Increasesize;
//     });
//   }


//   @override
//   Widget build(BuildContext context) {
    
//     return GestureDetector(
//       onTap:widget.ontab as void Function()?, 
//       onLongPress: onlongpress as void Function()?,
//       child: Container(
//         height:90,
//         width: 90,
//         decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
//         child:imgurl,

//       )


//     );
// }

// }