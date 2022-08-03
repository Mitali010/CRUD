import 'dart:developer';

import 'package:crudapp/model/data_model.dart';
import 'package:crudapp/services/httpservices.dart';
import 'package:crudapp/error/locator.dart';

import 'package:get/get.dart';

class DataController extends GetxController {
  final isloading = true.obs;
  var dataList = <Datamodel>[].obs;

  @override
  void onInit() {
    fetchdata();
    super.onInit();
  }

  fetchdata() async {
    var res = await getIt.get<HttpServices>().fetchdata();
    res.fold((l) {
      log(l.errorMessage);
      //isloading(true);
      //Error();
    }, (r) {
      isloading(false);
      dataList.value = r;
    });
  }

  deleteuser(var id) async {
    var res = await getIt.get<HttpServices>().deleteuser(id.toString());
    res.fold((l) {
      log(l.errorMessage);
    }, (r) {
      isloading(false);
      //if (res == false)
      fetchdata();
    });
  }

  updateuser(id, name, email, phone, mobile) async {
    var res = await getIt
        .get<HttpServices>()
        .updateuser(id, name, email, phone, mobile);
    res.fold((l) {
      log(l.errorMessage);
    }, (r) {
      isloading(false);
      fetchdata();
    });
  }

  createuser(name, email, phone, mobile) async {
    var res =
        await getIt.get<HttpServices>().createuser(name, email, phone, mobile);
    res.fold((l) {
      log(l.errorMessage);
    }, (r) {
      isloading(false);
      fetchdata();
    });
  }
}
