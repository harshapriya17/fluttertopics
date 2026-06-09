import 'package:flutter/material.dart';
class Topic8Images extends StatelessWidget{
  const Topic8Images ({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("images"),
        centerTitle: true,
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              "https://png.pngtree.com/png-clipart/20231003/original/pngtree-tasty-burger-png-ai-generative-png-image_13245897.png",
              height:200,
              width:200,
              fit: BoxFit.cover,
        ),
        const SizedBox(height:20),
        const Text(
          "Burger",
          style:TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold
          ),
            ),
          ],
        ),
      ),
    );
  }
}