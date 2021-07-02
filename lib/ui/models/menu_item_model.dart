class MenuItem {
    MenuItem({
        this.name,
        this.caption,
        this.image,
        this.items,
        this.price,
        this.subMenus,
    });

    String name;
    String caption;
    String image;
    List<MenuItem> items;
    String price;
    List<String> subMenus;

    factory MenuItem.fromJson(Map<String, dynamic> json) => MenuItem(
        name: json["name"] == null ? null : json["name"],
        caption: json["caption"] == null ? null : json["caption"],
        image: json["image"] == null ? null : json["image"],
        items: json["items"] == null ? null : List<MenuItem>.from(json["items"].map((x) => MenuItem.fromJson(x))),
        price: json["price"] == null ? null : "${json["price"]}",
        subMenus: json["subMenus"] == null ? null : List<String>.from(json["subMenus"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "caption": caption == null ? null : caption,
        "image": image == null ? null : image,
        "items": items == null ? null : List<dynamic>.from(items.map((x) => x.toJson())),
        "price": price == null ? null : price,
        "subMenus": subMenus == null ? null : List<dynamic>.from(subMenus.map((x) => x)),
    };
}
