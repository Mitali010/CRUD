import 'package:crudapp/error/failure.dart';
import 'package:crudapp/model/data_model.dart';
import 'package:dartz/dartz.dart';

abstract class Appservices {
  Future<Either<Failure, List<Datamodel>>> fetchdata();
  Future<Either<Failure, bool>> deleteuser(String id);
  Future<Either<Failure, bool>> updateuser(String id, String name, String email, String phone, String mobile);
  Future<Either<Failure, bool>> createuser(String name, String email, String phone, String mobile);

  


}



