
import 'package:get_it/get_it.dart';

import './core/services/api.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerLazySingleton(() => Api());
}