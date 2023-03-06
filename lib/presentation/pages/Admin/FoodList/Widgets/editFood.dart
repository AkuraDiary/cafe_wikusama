import 'package:flutter/material.dart';

Widget editFood() {
  return AlertDialog(
    backgroundColor: Colors.white,
    alignment: Alignment.center,
    title: Text(
      'Edit Food',
      style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 23),
      textAlign: TextAlign.center,
    ),
    content: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              fixedSize: const Size(100, 100),
              shape: const CircleBorder(),
            ),
            onPressed: () {},
            child: const Text('',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                ))),
        SizedBox(
          height: 15,
        ),
        TextFormField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: 'Food Name',
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
          height: 5,
        ),
        TextFormField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: 'Price',
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
          height: 5,
        ),
        TextFormField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: 'Description',
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
