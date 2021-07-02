import 'package:get_it/get_it.dart';
import 'package:samba_pos_app/ui/modules/order/order_view_model.dart';
import 'package:samba_pos_app/ui/repository/main_repository.dart';

GetIt locator = GetIt.instance;

setupLocator() {
  locator.registerLazySingleton(() => MainRepository());
  locator.registerLazySingleton(() => OrderViewModel());
}
