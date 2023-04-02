class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
  // final product = [Item("001", "iphone 12", "apple company", 999, "#33505a", "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-12-finish-unselect-gallery-1-202207_GEO_US?wid=5120&hei=2880&fmt=p-jpg&qlt=80&.v=1662129048006")]
  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      color: map["color"],
      image: map["image"],
    );
  }
  toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "color": color,
        "image": image
      };
}

class CatalogModel {
  static List<Item> Items = [
    Item(
        id: 0,
        name: "SMAli",
        desc: "Developer",
        price: 800,
        color: "color",
        image: "image")
  ];
}
