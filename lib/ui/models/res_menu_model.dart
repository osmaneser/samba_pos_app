// To parse this JSON data, do
//
//     final responseMenu = responseMenuFromJson(jsonString);

import 'dart:convert';

import 'menu_model.dart';

ResponseMenu responseMenuFromJson(String str) => ResponseMenu.fromJson(json.decode(str));

String responseMenuToJson(ResponseMenu data) => json.encode(data.toJson());

class ResponseMenu {
    ResponseMenu({
        this.menus,
    });

    List<Menu> menus;

    factory ResponseMenu.fromJson(Map<String, dynamic> json) => ResponseMenu(
        menus: json["menus"] == null ? null : List<Menu>.from(json["menus"].map((x) => Menu.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "menus": menus == null ? null : List<dynamic>.from(menus.map((x) => x.toJson())),
    };
}

