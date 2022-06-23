import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget{

  final String? text;
  final String? hintText;
  final TextEditingController? controller;
  final Function()? onTap;
  final bool readOnly;

  const CustomTextField({
    Key? key,
    this.text,
    this.hintText,
    this.controller,
    this.onTap,
    required this.readOnly
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            width: 99,
            child: Text(text!)
        ),
        SizedBox(
          width: 300,
          child: TextField(
            controller:controller ,
            decoration: InputDecoration(
              hintStyle: const TextStyle(color: Colors.black54),
              hintText: hintText,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  color: Colors.indigo,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.indigo, width: 1),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
            readOnly:readOnly,
            onTap: onTap
          ),
        )
      ],
    );
  }
}