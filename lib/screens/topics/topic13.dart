import 'package:flutter/material.dart';

class Topic13GridView extends StatefulWidget{
  @override
  _Topic13GridViewState createState()=> _Topic13GridViewState();
}
 class _Topic13GridViewState extends State<Topic13GridView>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GridView",
      ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
    body:GridView(
      gridDelegate:
      SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing:10,
          mainAxisSpacing: 10
      ),
      children:List.generate(20,(index){
          return Padding(padding: const  EdgeInsetsGeometry.all(8.0),
          child:Container(
            color: Colors.lightBlueAccent.shade700,
            child: Center(
              child: Text('Item $index',
              style: TextStyle(fontSize: 30,color: Colors.white))
            ),
            ),
          );
    }
    ),
    ),
    );
  }
 }