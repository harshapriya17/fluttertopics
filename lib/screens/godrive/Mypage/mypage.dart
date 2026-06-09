import 'package:flutter/material.dart';

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
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Row(
                children: [
                  Icon(
                    Icons.circle,
                    size: 12,
                    color: isOnline ? Colors.green : Colors.red,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    isOnline ? "Online" : "Offline",
                    style: TextStyle(
                      color: isOnline ? Colors.green : Colors.red,
                      fontWeight: FontWeight.bold,
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
    );
  }
}