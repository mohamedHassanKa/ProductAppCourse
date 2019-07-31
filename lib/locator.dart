
import 'package:get_it/get_it.dart';

import './core/services/api.dart';
import './core/viewmodels/CRUDModel.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerLazySingleton(() => Api('products'));
  locator.registerLazySingleton(() => CRUDModel()) ;
}