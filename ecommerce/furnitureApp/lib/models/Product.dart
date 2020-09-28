class Product {
  final int price;
  final String id, title, category, image, subTitle, description;

  // constructor - named parameter
  Product({
    this.id,
    this.price,
    this.title,
    this.category,
    this.image,
    this.subTitle,
    this.description,
  });

  // Here, factory constructors is initializing a final variable using logic that can’t be handled in the initializer list.
  // It create an Category from JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      title: json["title"],
      image: json["image"],
      price: json["price"],
      category: json["category"],
      subTitle: json["subTitle"],
      description: json["description"],
    );
  }
}

// Our Demo Product
Product product = Product(
  id: "1",
  price: 1600,
  title: "Wood Frame",
  image: "https://i.imgur.com/sI4GvE6.png",
  category: "Chair",
  subTitle: "Tieton Armchair",
  description: description,
);

String description =
    "This armchair is an elegant and functional piece of furniture. It is suitable for family visits and parties with friends and perfect for relaxing in front of the TV after hard work.";
