import 'package:flutter/material.dart';

class DrawerListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onTAp;

  const DrawerListTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTAp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        onTAp();
      },
      horizontalTitleGap: 0.0,
      leading: Icon(
          icon,
          color: Colors.white,
      ),
      title: Text(
        title,
        style:const TextStyle(color: Colors.white),
      ),
    );
  }
}