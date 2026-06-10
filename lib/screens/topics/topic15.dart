import 'package:flutter/material.dart';

class DicePage extends StatefulWidget{
  const DicePage ({Key? key}) : super(key: key);
@override
 createState()=>_DicePageState();
  }
  class _DicePageState extends State<DicePage>{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            flex:2,
            child: Container(
                    color: Colors.blue,
                    padding: const EdgeInsetsGeometry.all(10),
                    child: Image.asset('assets/images/dices.png'),
            ),
      ),
          Expanded(child: Container(
          color: Colors.blue,
          padding: const EdgeInsetsGeometry.all(10),
          child: Image.asset('assets/images/dices.png'),
          ),
          ),
        ],
      ),
    );
  }

  }