import 'package:flutter/material.dart';

Widget editTable() {
  return AlertDialog(
    backgroundColor: Colors.white,
    alignment: Alignment.center,
    title: Text(
      'Edit Table',
      style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 23),
      textAlign: TextAlign.center,
    ),
    content: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFormField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: 'Table Name',
            enabled: true,
            contentPadding:
                const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
            focusedBorder: OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.black),
              borderRadius: new BorderRadius.circular(10),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: new BorderSide(color: Colors.black),
              borderRadius: new BorderRadius.circular(10),
            ),
          ),
        ),
        SizedBox(
          height: 45,
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
              child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.amber),
            ),
            child: Text('Submit'),
            onPressed: () {},
          )),
        )
      ],
    ),
  );
}
