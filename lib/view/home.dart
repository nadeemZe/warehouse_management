import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse_management/controller/bloc_navigator.dart';
import 'package:warehouse_management/widget/side_menu.dart';
import 'package:warehouse_management/widget/home_widgets/wares_widget.dart';

class MyHomePage extends StatelessWidget{
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<BlocNavigator>(
        create: (context)=>BlocNavigator(WaresWidget()),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
                child: SideMenu()
            ),
            Expanded(
                flex: 5,
                child: BlocBuilder<BlocNavigator, NavigationStates>(
                  builder: (context, navigationState) {
                    return navigationState as Widget;
                  },
                ),
            )
          ],
        ),
      ),
    );
  }
}