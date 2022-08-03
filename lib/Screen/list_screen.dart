import 'package:crudapp/Screen/update_screen.dart';
import 'package:crudapp/controllers/data_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final dataController = Get.put<DataController>(DataController());
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Obx(
        () => ListView.builder(
            shrinkWrap: true,
            itemCount: dataController.dataList.length,
            itemBuilder: (BuildContext ctx, index) {
              return Column(children: [
                const SizedBox(
                  height: 10,
                ),
                Card(
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(dataController.dataList[index].id.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 18)),
                          Text(dataController.dataList[index].name ?? '',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 18)),
                          dataController.dataList[index].email != null
                              ? Text(dataController.dataList[index].email ?? '',
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 18))
                              : const SizedBox(
                                  height: 1,
                                ),
                          Text(dataController.dataList[index].mobile ?? '',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 18)),
                          Text(dataController.dataList[index].phone ?? '',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 18)),
                        ],
                      ),
                      Expanded(
                        child: IconButton(
                            onPressed: () async {
                              dataController.deleteuser(
                                  dataController.dataList[index].id);
                              Get.snackbar('employee information', 'deleted!',
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: Colors.blueAccent);
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.redAccent,
                            )),
                      ),
                      Expanded(
                        child: IconButton(
                            onPressed: () {
                              Get.to(() => UpdateScreen(
                                    id: dataController.dataList[index].id,
                                    name: dataController.dataList[index].name,
                                    email: dataController.dataList[index].email,
                                    phone: dataController.dataList[index].phone,
                                    mobile:
                                        dataController.dataList[index].mobile,
                                  ));
                            },
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.grey,
                            )),
                      ),
                    ],
                  ),
                )
              ]);
            }),
      ),
    );
  }
}
