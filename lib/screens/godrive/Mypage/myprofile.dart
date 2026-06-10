import 'package:flutter/material.dart';
import 'package:foodgo/screens/godrive/Mypage/menu_bar.dart';
import 'personalinfo_widget.dart';

class Name extends StatefulWidget {
  const Name({super.key});

  @override
  State<Name> createState() => _NameState();
}

class _NameState extends State<Name> {
  bool isOnline = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Profile',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          // Online / Offline Toggle
          GestureDetector(
            onTap: () {
              setState(() {
                isOnline = !isOnline;
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              width: 85,
              height: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: isOnline ? Colors.green.withOpacity(0.1) : Colors.grey.shade200,
                border: Border.all(
                  color: isOnline ? Colors.green : Colors.grey.shade400,
                ),
              ),
              child: Stack(
                children: [
                  // Moving Thumb
                  AnimatedAlign(
                    duration: const Duration(milliseconds: 200),
                    alignment: isOnline ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      width: 26,
                      height: 26,
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isOnline ? Colors.green : Colors.grey,
                      ),
                    ),
                  ),
                  // Integrated Text
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: isOnline ? 0 : 20,
                        right: isOnline ? 20 : 0,
                      ),
                      child: Text(
                        isOnline ? "Online" : "Offline",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: isOnline ? Colors.green : Colors.grey.shade700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Notification Icon
          IconButton(
            onPressed: () {
              // Notification action
            },
            icon: const Icon(Icons.notifications_none),
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            ProfileWidget(
              name: "Harsha",
              phone: "+91 63091 09052",
              imageUrl: "assets/images/burger.png",
              isVerified:true),

           // const SizedBox(height: 20),
            const MenuCardWidget(),
           // const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}