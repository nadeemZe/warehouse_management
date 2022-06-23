import 'package:flutter/material.dart';
import 'package:warehouse_management/constant/helper.dart';

import '../../controller/bloc_navigator.dart';

class AboutUs extends StatefulWidget with NavigationStates{
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  bool isExpanded0=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(21),
        child: Center(
          child: Column(
            children: [
              Text(
                'About Us',
                style: headerTextStyle,
              ),
              const SizedBox(height: 51,),
              Text(
                'You can contact with us by our information',
                style:header2TextStyle
              ),
              const SizedBox(height: 17,),
              Container(
                width: 500,
                padding: const EdgeInsets.all(17),
                decoration:BoxDecoration(
                  color: Colors.white,
                  borderRadius:BorderRadius.circular(15),
                  boxShadow:const [
                    BoxShadow(
                        color:Colors.black12,
                        blurRadius: 1,
                        offset:Offset (0,5)
                    ),
                  ],
                ),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:const[
                        SizedBox(width: 33,),
                        Text('*<<< NZ >>>*',style: TextStyle(fontSize: 21)),
                      ],
                    ),
                    const SizedBox(height: 12,),
                    Row(
                      children: const [
                        Icon(Icons.add_location,color: Colors.indigo,),
                        SizedBox(width: 12,),
                        Text('Syria,Latakia',style: TextStyle(fontSize: 17)),
                      ],
                    ),
                    const SizedBox(height: 9,),
                    Row(
                      children: const[
                        Icon(Icons.phone_outlined,color: Colors.indigo,),
                        SizedBox(width: 12,),
                        Text('00963........',style: TextStyle(fontSize: 17)),
                      ],
                    ),
                    const SizedBox(height: 9,),
                    Row(
                      children: const[
                        Icon(Icons.email,color: Colors.indigo,),
                        SizedBox(width: 12,),
                        Text('.....@gmail.com',style: TextStyle(fontSize: 17)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}