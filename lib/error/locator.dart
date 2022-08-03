import 'package:crudapp/services/httpservices.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

setup() {
  getIt.registerLazySingleton<HttpServices>(() => HttpServices());
}
