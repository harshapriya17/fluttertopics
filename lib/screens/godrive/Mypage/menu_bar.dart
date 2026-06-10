import 'package:flutter/material.dart';

class MenuCardWidget extends StatelessWidget{
  const MenuCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          _menuTile("My Documents",Icons.description_outlined),
          _menuTile("Penalty Points",Icons.warning_amber_rounded),
          _menuTile("Help Center",Icons.support_agent),
          _menuTile("Report Problem",Icons.report_problem_outlined),
          _menuTile("Emergency Contant",Icons.contact_phone_outlined),
          _menuTile("Cancellation Policy",Icons.policy_outlined),
          _menuTile("Privacy Policy",Icons.privacy_tip_outlined),
          _menuTile("Delete Account",Icons.delete_outline),

          const Divider(height:1),
          _menuTile(
            "Logout",
            Icons.logout,
            isLogout:true,
          ),
        ],
      ),
    );
  }
  Widget _menuTile(
      String title,
      IconData icon,{
        bool isLogout = false,
      }){
    return ListTile(
      leading: Icon(
        icon,
        color:isLogout?Colors.red:Colors.black87,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isLogout? Colors.red:Colors.black87,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing :isLogout
      ?null
      :const Icon(
        Icons.arrow_forward_ios,
        size: 16,
      ),
      onTap: (){},
    );
  }
}