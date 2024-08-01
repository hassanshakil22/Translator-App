import 'package:flutter/material.dart';

class CustomDropdownbutton extends StatefulWidget {
  final value;
  const CustomDropdownbutton({super.key, this.value});
  @override
  State<CustomDropdownbutton> createState() => _CustomDropdownbuttonState();
}

class _CustomDropdownbuttonState extends State<CustomDropdownbutton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        items: [
          DropdownMenuItem(
            child: Text("English"),
            value: "en",
          ),
          DropdownMenuItem(
            child: Text("Spanish"),
            value: "en",
          ),
          DropdownMenuItem(
            child: Text("Italic"),
            value: "en",
          ),
          DropdownMenuItem(
            child: Text("English"),
            value: "en",
          ),
          DropdownMenuItem(
            child: Text("English"),
            value: "en",
          ),
        ],
        onChanged: (selectedvalue) {
          setState(() {
            selectedvalue = widget.value;
          });
        });
  }
}
