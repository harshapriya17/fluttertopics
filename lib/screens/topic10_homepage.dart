import 'package:flutter/material.dart';

import 'topic1_stateless.dart';
import 'topic2_layouts.dart';
import 'topic3_scroll.dart';
import 'topic4_listview.dart';
import 'topic5_navigation.dart';
import 'topic6_stateful.dart';
import 'topic7_textfield.dart';
import 'topic8_assets.dart';
import 'topic9_gridview.dart';

class Topic10Homepage extends StatelessWidget{
  const Topic10Homepage ({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
      title: const Text("Flutter topic"),
      centerTitle: true,
      ),
    body:ListView(
    padding: const EdgeInsets.all(15),
    children: [
      buildTopicTile(
    context,
    'topic 1 - Stateless Widget',
        const Topic1Stateless(),
    ),
buildTopicTile(
context,
"Topic 2 - Layouts",
const Topic2Layouts(),
),

buildTopicTile(
context,
"Topic 3 - Scroll",
const Topic3Scroll(),
),

buildTopicTile(
context,
"Topic 4 - ListView",
const FoodList(),
),

buildTopicTile(
context,
"Topic 5 - Navigation",
const Topic5Navigation(),
),

buildTopicTile(
context,
"Topic 6 - Stateful",
const Topic6Stateful(),
),

buildTopicTile(
context,
"Topic 7 - TextField",
const Topic7Textfield(),
),

buildTopicTile(
context,
"Topic 8 - Assets",
const Topic8Images(),
),

buildTopicTile(
context,
"Topic 9 - GridView",
const Topic9Gridview(),
),
],
),
);
}
Widget buildTopicTile(
    BuildContext context,
    String title,
    Widget page,
    )
  {
    return Card(
    elevation: 5,
    margin:const EdgeInsets.only(bottom: 15),
  child: ListTile(
  leading: const Icon(
  Icons.flutter_dash,
  color: Colors.blue,
  ),
  title:Text(
  title,
  ),
  trailing: const Icon(
  Icons.arrow_forward_ios,
  ),
  onTap: (){
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context)=>page,
    ),
  );
  },
  ),
    );
  }
}