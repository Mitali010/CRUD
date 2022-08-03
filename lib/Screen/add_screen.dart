import 'package:crudapp/controllers/data_controllers.dart';
import 'package:crudapp/global.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  final dataController = Get.put<DataController>(DataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Center(
            child: Text(
          'employee detail',
          style: TextStyle(color: Colors.black),
        )),
        backgroundColor: appbarcolor,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter name ',
              ),
              controller: nameController,
            ),
            const SizedBox(
              height: 24,
            ),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter email id',
              ),
              controller: emailController,
            ),
            const SizedBox(
              height: 24,
            ),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter mobile no ',
              ),
              controller: mobileController,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 24,
            ),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter phone no ',
              ),
              controller: phoneController,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: ElevatedButton(
                    onPressed: () {
                      dataController.createuser(
                        nameController.text,
                        emailController.text,
                        mobileController.text.toString(),
                        phoneController.text.toString(),
                      );
                      Get.snackbar('employee information', 'added!',
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.blueAccent);

                      Get.toNamed('/home_screen');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: buttoncolor,
                    ),
                    child: const Text(
                      'Add',
                    ),
                  )),
                ])
          ],
        ),
      ),
    );
  }
}
