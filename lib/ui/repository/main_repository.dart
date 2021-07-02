import 'dart:convert';

import 'package:samba_pos_app/ui/models/res_menu_model.dart';
import "package:flutter/services.dart" as svcFlutter;
import "package:yaml/yaml.dart";

class MainRepository {
  Future<ResponseMenu> getMenus() async {
    final data = await svcFlutter.rootBundle.loadString('assets/menu.yaml');
    //TODO: Bu kısımda refactor yapılacak!
    final mapData = loadYaml(data);
    var resultt = json.encode(mapData);
    var resp = ResponseMenu.fromJson(json.decode(resultt));
    return resp;
  }
}
