import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse_management/controller/bloc_navigator.dart';
import 'drawer_list_tile.dart';

class SideMenu extends StatelessWidget{
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(17),
      color: Colors.indigo,
      child: ListView(
           children: [
             DrawerHeader(
               child: Image.asset("images/nad.png"),
             ),
             DrawerListTile(
               title: "Home",
               icon: Icons.home_filled,
               onTAp: () {
                 BlocProvider.of<BlocNavigator>(context)
                     .add(WaresWidgetTap());
               },
             ),
             DrawerListTile(
               title: "Add Ware",
               icon: Icons.add,
               onTAp: () {
                 BlocProvider.of<BlocNavigator>(context)
                     .add(AddingWareWidgetTap());
               },
             ),
             DrawerListTile(
               title: "About US",
               icon: Icons.explore,
               onTAp: () {
                 BlocProvider.of<BlocNavigator>(context)
                     .add(AboutUsWidgetTap());
               },
             ),
           ],
      ),
    );
  }
}
