import 'package:samba_pos_app/core/init/locator.dart';
import 'package:samba_pos_app/core/models/base_view_model.dart';
import 'package:samba_pos_app/ui/models/menu_item_model.dart';
import 'package:samba_pos_app/ui/models/menu_model.dart';
import 'package:samba_pos_app/ui/models/order_model.dart';
import 'package:samba_pos_app/ui/models/res_menu_model.dart';
import 'package:samba_pos_app/ui/repository/main_repository.dart';

class OrderViewModel extends BaseViewModel {
  MainRepository _mainRepository = locator<MainRepository>();

  ResponseMenu responseMenu;
  Menu mainMenu;
  List<MenuItem> listMainMenu = [];
  MenuItem menuItem;
  List<OrderModel> orderModel = [];
  List<String> listNotChoose = [];

  getMainMenuList() async {
    state = BaseState.Busy;
    await Future.delayed(Duration(milliseconds: 1000));
    responseMenu = await _mainRepository.getMenus();

    mainMenu = responseMenu.menus.firstWhere((element) => element.key == "main", orElse: () => null);

    if (mainMenu != null) {
      listMainMenu = mainMenu.items;
      state = BaseState.Done;
      message = "Menü Listesi başarıyla alındı";
    } else {
      state = BaseState.Error;
      message = "Menü Listesi alınırken sorun oluştu";
    }
  }

  getMenuByName({String name}) {
    state = BaseState.Busy;
    menuItem = mainMenu.items.firstWhere((element) => element.name == name, orElse: () => null);
    if (menuItem != null) {
      state = BaseState.Done;
      message = "Menü Listesi başarıyla alındı";
    } else {
      state = BaseState.Error;
      message = "Menü Listesi alınırken sorun oluştu";
    }
  }

  Future<bool> orderNow(MenuItem menuItem) async {
    listNotChoose = [];
    await Future.delayed(Duration(milliseconds: 1000));

    if (menuItem.subMenus != null && menuItem.subMenus.length > 0) {
      menuItem.subMenus.forEach((order) {
        var findItem = orderModel.firstWhere((element) => element.key == order, orElse: () => null);
        if (findItem == null) listNotChoose.add(order);
      });

      if (listNotChoose.length > 0) {
        message = "Lütfen seçim yapmadığınız eksik kısımlarda seçim işlemlerini gerçekleştiriniz. \n \n";
        listNotChoose.forEach((notChoose) {
          message = message + responseMenu.menus.firstWhere((element) => element.key == notChoose).description + "\n ";
        });
        return false;
      }
    }

    message = "Sipariş başarıyla alındı";
    orderModel = [];
    return true;

  }

  Future<void> chooseItem(OrderModel addItem) async {
    OrderModel alreadyItem = orderModel.firstWhere((element) => element.key == addItem.key, orElse: () => null);
    if (alreadyItem != null) {
      alreadyItem = addItem;
    } else {
      orderModel.add(addItem);
    }
  }
}
