import 'package:flutter/material.dart';

class Topic7Textfield extends StatefulWidget {
  const Topic7Textfield({super.key});

  @override
  State<Topic7Textfield> createState() =>
      _Topic7TextfieldState();
}

class _Topic7TextfieldState
    extends State<Topic7Textfield> {

  TextEditingController nameController =
  TextEditingController();

  TextEditingController passwordController =
  TextEditingController();

  String userName = "";

  bool isHidden = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Login page"),
        centerTitle: true,
      ),

      body: Padding(

        padding: const EdgeInsets.all(20),

        child: Column(

          children: [

            TextField(

              controller: nameController,

              decoration: InputDecoration(

                hintText: "Enter your name",

                labelText: "Name",

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),

                prefixIcon: const Icon(
                  Icons.person,
                ),
              ),
            ),

            const SizedBox(height: 20),
            TextField(
              controller: passwordController,
              obscureText: isHidden,
              decoration: InputDecoration(
                hintText: "Enter password",
                labelText:"password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                prefixIcon: const Icon(
                  Icons.lock,
                ),
                suffixIcon: IconButton(onPressed: (){
                  setState(() {
                    isHidden =!isHidden;
                  });
                },
                  icon: Icon(
                    isHidden
                    ? Icons.visibility_off
                        :Icons.visibility,
                  ),
              ),
            ),
            ),
            const SizedBox(height:30),

            ElevatedButton(

              onPressed: () {

                setState(() {

                  userName =
                      nameController.text;

                });
                ScaffoldMessenger.of(context)
                .showSnackBar(
                    SnackBar(
                      content: Text(
                        "welcome $userName",
                      ),
                ),
                );
              },

              child: const Text(
                "Login",
              ),
            ),

            const SizedBox(height: 30),

            Text(

              userName,

              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
} 