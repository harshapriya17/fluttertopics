import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{
 const LoginPage({super.key});
 @override
  State<LoginPage>createState()=>_LoginPageState();
}
class _LoginPageState extends State<LoginPage>{
  bool isLoginSelected = true;
  bool obscurePassword=true;
  bool hasPasswordError=true;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,

      body:SafeArea(
          child: Padding(
              padding: const EdgeInsetsGeometry.symmetric(
                horizontal: 20,
                vertical: 10,
      ),
          child: Column(
            children: [
              const SizedBox(height: 25),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        isLoginSelected=true;
                      });
                    },
                    child: Column(
                      children: [
                        Text(
                          "Log in",
                          style: TextStyle(
                            color: isLoginSelected
                                ? const Color(0xFF3C5BA5)
                                :Colors.grey,
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height:8),
                        Container(
                          height: 3,
                          width: 130,
                          color: isLoginSelected
                          ? const Color(0xFF3C5BA5)
                              :Colors.transparent,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 35),

                  GestureDetector(
                    onTap: (){
                      setState(() {
                        isLoginSelected=false;
                      });
                    },
                    child: Column(
                      children: [
                        Text("Sign up",style: TextStyle(
                          color: !isLoginSelected
                              ? const Color(0xFF3C5BA5)
                              :Colors.transparent,
                        ),
                    ),
                      ]
                    ),
                  ),
                ],
              ),
              const SizedBox(height:10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Your Email",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade800,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "contact@dscodetech.com",
                  filled:true,
                  fillColor:Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height:10),

              TextFormField(
                obscureText: obscurePassword,
                decoration: InputDecoration(
                  hintText: "**********",

                  suffixIcon: IconButton(icon: Icon(
                    obscurePassword
                    ?Icons.visibility_off_outlined
                        :Icons.visibility_outlined,
                  ),
                  onPressed: (){
                    setState(() {
                      obscurePassword=!obscurePassword;
                    });
                  },
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: hasPasswordError
                          ? Colors.red
                          :Colors.grey.shade300,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: hasPasswordError
                          ?Colors.red
                          :const Color(0xFF3C5BA5),
                      width: 2,
                    ),
                  ),
                  errorText: hasPasswordError
                    ? "Wrong Password"
                      :null,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  TextButton(onPressed: (){},
                      child: const Text(
                        "Forget password?",
                        style: TextStyle(
                          color: Color(0xFF3C5BA5),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                  ),
                ],
              ),
const SizedBox(height: 15),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(onPressed: (){},
                    style:ElevatedButton.styleFrom(
                      backgroundColor:
                        const Color(0xFF3C5BA5),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                          BorderRadius.circular(12),
                      ),
                    ),
                  child: const Text(
                    "Continue",
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
              ),
              ),
            ],
          ),
          ),
      ) ,
    );
  }
}