import 'package:flutter/material.dart';

class Topic12 extends StatefulWidget {
  const Topic12({super.key});
  @override
  _Topic12State createState() => _Topic12State();
}

class _Topic12State extends State<Topic12> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar:AppBar(
          title: const Text("ListView"),
          backgroundColor: Colors.blue,
          foregroundColor:Colors.white,
        ),
        backgroundColor:Colors.blueGrey,
// body: ListView(
//   padding: const EdgeInsets.all(20),
//   children: const <Widget>[
//     CircleAvatar(
//       maxRadius: 50,
//             backgroundColor: Colors.black12,
//             child: Icon(
//               Icons.person,
//               color: Colors.white,
//               size: 50,
//             ),
//           ),
//           Center(
//             child: Text(
//               "Harsha",
//               style: TextStyle(
//                 fontSize: 50,
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
// backgroundColor: Colors.black38,
// child: Icon(Icons.person,
//     color: Colors.white,
//     size: 50),
//            ),
//            Center(
//              child: Text(
//                'Harsha',
//                style: TextStyle(
//                    fontSize: 50,
//                    color: Colors.white
//                ),
//              ),
//            ),
//            Text(
// """1. Professional & Informative
// Abilio IT Solutions Pvt. Ltd., established in 2018, is a leading India-based technology company specializing in innovative software products and IT services. With expertise spanning web development, mobile app design, and digital transformation, the company helps businesses enhance efficiency, improve customer engagement, and stay competitive in the digital era. Known for its client-focused approach and commitment to quality, Abilio IT Solutions has built a reputation for delivering tailored solutions that align with each client’s unique goals.
//
// 2. Promotional & Engaging
// At Abilio IT Solutions, technology meets creativity to shape the future of businesses. Since its inception in 2018, the company has been empowering organizations with cutting-edge web, mobile, and digital transformation solutions. Whether it’s crafting a sleek mobile app, building a robust enterprise platform, or streamlining operations through automation, Abilio’s team blends innovation with precision to deliver measurable results. Their mission is simple—turning ideas into impactful digital experiences.
//
// 3. Narrative & Vision-Oriented
// In 2018, a small team of passionate technologists came together with a shared vision—to redefine how businesses harness the power of technology. That vision became Abilio IT Solutions, a company dedicated to creating smarter, faster, and more intuitive digital solutions. Today, Abilio partners with clients across industries, helping them navigate the complexities of the digital world with confidence. Every project is more than just code—it’s a step toward building a connected, innovative future.""",
//              style: TextStyle(
//                  fontSize: 20,
//                  color: Colors.white70
//              ),
//            ),
//          ],
//        ),
//     );
// }
// }
        body:
        ListView.separated
          (
          itemBuilder: (context, position) {
            return
              Card(
                child:Padding(padding: const EdgeInsets.all(15.0),
                  child:
                  Text
                    ('List Item $position',
                  ),
                ),
              );
          },
          separatorBuilder:(context,position) {
            return Card(
                color: Colors.grey,
                child: Padding(padding:const EdgeInsets.all(5.0),
                  child:Text('Separator $position',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
          },
          itemCount: 20,
        ),
      );
  }
}