import 'package:flutter/material.dart';

class Topic14 extends StatefulWidget {
  const Topic14({super.key});

  @override
  _Topic14State createState()=> _Topic14State();
}
class _Topic14State extends State<Topic14>{
  final titleController = TextEditingController();
  String text ="No value Entered";
  void _setText(){
    setState(() {
      text=titleController.text;
    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:const Text('ABILIO IT SOLUTION'),
        backgroundColor: Colors.lightGreenAccent,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Text(
            "Using Controller",
            style: TextStyle(fontSize: 30),
          ),
          Padding(
            padding: const EdgeInsetsGeometry.all(15),
            child: TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller: titleController,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          ElevatedButton(onPressed: _setText,
          style: ButtonStyle(
            elevation: WidgetStateProperty.all(8),
            backgroundColor: WidgetStatePropertyAll(Colors.lightBlueAccent),
            foregroundColor: WidgetStatePropertyAll(Colors.white),
          ),
          child: const Text('Submit')),
          const SizedBox(
            height: 20,
          ),
          Text(text),
        ],
      ),
    );
  }
}