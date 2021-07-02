import 'menu_item_model.dart';

class Menu {
    Menu({
        this.key,
        this.description,
        this.items,
        this.orderTag,
    });

    String key;
    String description;
    List<MenuItem> items;
    String orderTag;

    factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        key: json["key"] == null ? null : json["key"],
        description: json["description"] == null ? null : json["description"],
        items: json["items"] == null ? null : List<MenuItem>.from(json["items"].map((x) => MenuItem.fromJson(x))),
        orderTag: json["orderTag"] == null ? null : json["orderTag"],
    );

    Map<String, dynamic> toJson() => {
        "key": key == null ? null : key,
        "description": description == null ? null : description,
        "items": items == null ? null : List<dynamic>.from(items.map((x) => x.toJson())),
        "orderTag": orderTag == null ? null : orderTag,
    };
}