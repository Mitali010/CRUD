import 'package:crudapp/Screen/add_screen.dart';
import 'package:crudapp/Screen/home_screen.dart';
import 'package:crudapp/Screen/list_screen.dart';
import 'package:crudapp/Screen/update_screen.dart';
import 'package:crudapp/error/locator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(name: "/home_screen", page: () => const HomeScreen()),
        GetPage(name: "/list_screen", page: () => const ListScreen()),
        GetPage(name: "/add_screen", page: () => const AddScreen()),
        GetPage(name: "/update_screen", page: () => const UpdateScreen()),
      ],
      home: const HomeScreen(),
    );
  }
}
