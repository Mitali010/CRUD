// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:crudapp/controllers/data_controllers.dart';
import 'package:crudapp/global.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class UpdateScreen extends StatefulWidget {
  final id, name, email, mobile, phone;
  const UpdateScreen(
      {Key? key, this.id, this.name, this.email, this.mobile, this.phone})
      : super(key: key);

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  @override
  void initState() {
    super.initState();
    nameController.text = widget.name;
    emailController.text = widget.email;
    phoneController.text = widget.phone;
    mobileController.text = widget.mobile;
    //print(dataController.dataList.toString());
  }

  
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
        backgroundColor: Colors.pinkAccent,
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
                hintText: 'Enter email id ',
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
            Row(children: [
              Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        dataController.updateuser(
                          widget.id.toString(),
                          nameController.text,
                          emailController.text,
                          phoneController.text.toString(),
                          mobileController.text.toString(),
                        );
                        Get.snackbar('employee information', 'updated!',
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.blueAccent);
                        Get.toNamed("/home_screen");
                        //Get.to(() => const HomeScreen());
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(buttoncolor)),
                      child: const Text(
                        'update',
                      ))),
            ])
          ],
        ),
      ),
    );
  }
}
