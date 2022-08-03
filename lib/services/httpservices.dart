// ignore_for_file: override_on_non_overriding_member

import 'dart:convert';
import 'dart:developer';

import 'package:crudapp/error/failure.dart';
import 'package:crudapp/model/data_model.dart';
import 'package:crudapp/global.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';

//abstract class Failure {}
//class ServerFailure implements Failure {}

class HttpServices extends Service {
  @override
  Future<Either<Failure, List<Datamodel>>> fetchdata() async {
    try {
      final response =
          await http.get(Uri.parse('https://$domainName/allemployee/'));
      List<Datamodel> data = datamodelFromJson(response.body);
      return Right(data);
    } catch (e) {
      return Left(Failure(errorMessage: e.toString(), errorUrl: ''));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteuser(String id) async {
    try {
      final response =
          await http.post(Uri.parse('https://$domainName/deleteemployee/'),
              headers: {'Content-Type': 'application/json; charset=UTF-8'},
              body: jsonEncode(<String, String>{
                "id": id.toString(),
              }));
      return const Right(true);
    } catch (e) {
      return Left(Failure(errorMessage: e.toString(), errorUrl: ''));
    }
  }

  @override
  Future<Either<Failure, bool>> updateuser(
      String id, String name, String email, String phone, String mobile) async {
    try {
      final response = await http.post(
        Uri.parse('https://$domainName/updateemployee/'),
        //headers: {'Content-Type' : 'application/json; charset=UTF-8'},
        body: {
          "id": id,
          "name": name,
          "email": email,
          "phone": phone,
          "mobile": mobile,
        },
      );
      return const Right(true);
    } catch (e) {
      return Left(Failure(errorMessage: e.toString(), errorUrl: ''));
    }
  }

  @override
  Future<Either<Failure, bool>> createuser(
      String name, String email, String phone, String mobile) async {
    try {
      final response = await http.post(
        Uri.parse('https://$domainName/addemployee/'),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(<String, dynamic>{
          "name": name,
          "email": email,
          "phone": phone,
          "mobile": mobile,
        }),
      );
      return const Right(true);
    } catch (e) {
      return Left(Failure(errorMessage: e.toString(), errorUrl: ''));
    }
  }
}
