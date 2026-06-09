import 'package:flutter/material.dart';

class Topic11 extends StatefulWidget {
const Topic11({super.key});

@override
State<Topic11> createState() =>
_Topic11State();
}

class _Topic11State
extends State<Topic11> {

bool isAnimated = false;

List<String> tasks = [
"Learn Flutter",
"Build UI",
"Practice Widgets",
];

@override
Widget build(BuildContext context) {

return Scaffold(

appBar: AppBar(
title: const Text(
"Topic 11 Widgets",
),
),

body: ListView(
padding: const EdgeInsets.all(16),

children: [

/// CARD + LIST TILE
Card(
elevation: 5,

shape: RoundedRectangleBorder(
borderRadius:
BorderRadius.circular(16),
),

child: const ListTile(

leading: CircleAvatar(
child: Icon(Icons.person),
),

title: Text("Harsha Priya"),

subtitle:
Text("Flutter Developer"),

trailing:
Icon(Icons.arrow_forward_ios),
),
),

const SizedBox(height: 20),

/// EXPANSION TILE
Card(
child: ExpansionTile(

title:
const Text("See More"),

children: const [

ListTile(
title: Text("Option 1"),
),

ListTile(
title: Text("Option 2"),
),
],
),
),

const SizedBox(height: 20),

/// INKWELL
InkWell(

borderRadius:
BorderRadius.circular(16),

onTap: () {

ScaffoldMessenger.of(context)
    .showSnackBar(

const SnackBar(
content:
Text("InkWell Clicked"),
),
);
},

child: Container(
padding:
const EdgeInsets.all(20),

decoration: BoxDecoration(
color: Colors.blue,

borderRadius:
BorderRadius.circular(16),
),

child: const Center(
child: Text(
"InkWell Widget",

style: TextStyle(
color: Colors.white,
fontSize: 18,
),
),
),
),
),

const SizedBox(height: 20),

/// GESTURE DETECTOR
GestureDetector(

onDoubleTap: () {

showDialog(
context: context,

builder: (context) {

return AlertDialog(

title: const Text(
"Gesture Detector",
),

content: const Text(
"Double Tap Detected",
),

actions: [

TextButton(
onPressed: () {
Navigator.pop(context);
},

child: const Text("OK"),
),
],
);
},
);
},

child: Container(
height: 100,

decoration: BoxDecoration(
color: Colors.orange,

borderRadius:
BorderRadius.circular(16),
),

child: const Center(
child: Text(
"Double Tap Me",

style: TextStyle(
color: Colors.white,
fontSize: 18,
),
),
),
),
),

const SizedBox(height: 20),

/// ANIMATED CONTAINER
GestureDetector(

onTap: () {

setState(() {
isAnimated = !isAnimated;
});
},

child: AnimatedContainer(

duration:
const Duration(seconds: 1),

curve: Curves.easeInOut,

height:
isAnimated ? 180 : 100,

decoration: BoxDecoration(

color:
isAnimated
? Colors.purple
    : Colors.green,

borderRadius:
BorderRadius.circular(20),
),

child: const Center(
child: Text(
"Tap To Animate",

style: TextStyle(
color: Colors.white,
fontSize: 20,
),
),
),
),
),

const SizedBox(height: 20),

/// CHIPS
Wrap(
spacing: 10,

children: [

ChoiceChip(
label: const Text("Flutter"),
selected: true,
onSelected: (value) {},
),

FilterChip(
label: const Text("UI"),
selected: false,
onSelected: (value) {},
),

ActionChip(
label: const Text("Refresh"),
onPressed: () {},
),

InputChip(
label: const Text("Harsha"),
onDeleted: () {},
),
],
),

const SizedBox(height: 20),

/// DISMISSIBLE
const Text(
"Swipe To Delete",

style: TextStyle(
fontSize: 20,
fontWeight: FontWeight.bold,
),
),

const SizedBox(height: 10),

...tasks.map((task) {

return Dismissible(

key: Key(task),

background: Container(
color: Colors.red,

alignment:
Alignment.centerRight,

padding:
const EdgeInsets.only(
right: 20,
),

child: const Icon(
Icons.delete,
color: Colors.white,
),
),

onDismissed: (direction) {

setState(() {
tasks.remove(task);
});
},

child: Card(
child: ListTile(
title: Text(task),
),
),
);
}).toList(),

const SizedBox(height: 20),

/// HERO IMAGE
GestureDetector(

onTap: () {

Navigator.push(

context,

MaterialPageRoute(
builder:
(context) =>
const DetailPage(),
),
);
},

child: Hero(

tag: "hero",

child: ClipRRect(

borderRadius:
BorderRadius.circular(
20,
),

child: Image.network(
"https://picsum.photos/400/200",
height: 200,
fit: BoxFit.cover,
),
),
),
),

const SizedBox(height: 20),

/// LOADING
const Center(
child:
CircularProgressIndicator(),
),
],
),
);
}
}

class DetailPage extends StatelessWidget {
const DetailPage({super.key});

@override
Widget build(BuildContext context) {

return Scaffold(

appBar: AppBar(
title: const Text("Hero Page"),
),

body: Center(

child: Hero(

tag: "hero",

child: ClipRRect(

borderRadius:
BorderRadius.circular(20),

child: Image.network(
"https://picsum.photos/500/300",
),
),
),
),
);
}
}