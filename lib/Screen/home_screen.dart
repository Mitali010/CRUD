import 'package:crudapp/Screen/list_screen.dart';
import 'package:crudapp/global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: appbarcolor,
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            const Text("Employees Information"),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed("/add_screen");
                },
                style: ElevatedButton.styleFrom(primary: buttoncolor),
                child: const Text(
                  "Add",
                  style: TextStyle(fontSize: 20),
                ))
          ]),
        ),
        body: const ListScreen());
  }
}
