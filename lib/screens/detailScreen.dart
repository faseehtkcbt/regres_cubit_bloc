import 'package:flutter/material.dart';

import '../data/modal/ListModel.dart';


class DetailScreen extends StatelessWidget {
   Data data;
  DetailScreen({super.key,required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(""),
      ),
      backgroundColor: Colors.deepPurpleAccent,
      body: Center(
        child: Card(
          color: Colors.deepPurple,
          margin: const EdgeInsets.all(50.0),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          child:  Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  radius: 100.0,
                  backgroundImage: NetworkImage(data.avatar!),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      'ID',
                      style: TextStyle(
                          fontSize: 40.0, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      data.id.toString(),
                      style: const TextStyle(
                          fontSize: 40.0, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      'First Name ',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w300),
                    ),
                    Text(
                      data.firstName.toString(),
                      style: const TextStyle(
                          fontSize: 40.0, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      'Last Name ',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w300),
                    ),
                    Text(
                      data.lastName.toString(),
                      style: const TextStyle(
                          fontSize: 40.0, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      'E-Mail ',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w300),
                    ),
                    Text(
                      data.email.toString(),
                      style: const TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
