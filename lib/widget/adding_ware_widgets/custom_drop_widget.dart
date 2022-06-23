import 'package:flutter/material.dart';

class CustomDropWidget extends StatefulWidget{
  final String? value;
  const CustomDropWidget({Key? key,this.value}) : super(key: key);

  @override
  State<CustomDropWidget> createState() => CustomDropWidgetState();
}

class CustomDropWidgetState extends State<CustomDropWidget> {
   static String? value;
   bool edit=false;

   @override
   void initState() {
    super.initState();
    value=widget.value??'In';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
            width: 99,
            child: Text('IN/OUT : ')
        ),
        Container(
          width: 300,
          padding: const EdgeInsets.only(left:9,right: 9),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
                side:const  BorderSide(
                    color: Colors.indigo
                ),
                borderRadius: BorderRadius.circular(17)
            ),
          ),
          child: DropdownButton(
              icon:const Icon(Icons.arrow_drop_down_circle_outlined,color: Colors.indigo,),
              dropdownColor: Colors.indigo,
              isExpanded: true,
              value: (widget.value==null||edit==true)
                  ?value
                  :widget.value,
              onChanged: (String? v) {
                setState(() {
                  edit=true;
                  value=v;
                });
              },
              items:const[
                DropdownMenuItem(
                  value: 'In',
                  child:Text('In',
                    style: TextStyle(color: Colors.black),),
                ),
                DropdownMenuItem(
                  value: 'Out',
                  child:Text('Out',
                    style: TextStyle(color: Colors.black),),
                ),
              ]
          ),
        ),
      ],
    );
  }
}