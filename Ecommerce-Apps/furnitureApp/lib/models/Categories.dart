class Category {
  final String id, title, image;
  final int numOfProducts;

  // constructor - named parameter
  Category({this.id, this.title, this.image, this.numOfProducts});

  // It creates an Category instance from JSON. (Ideal when interacting with an API that return JSON data)
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json["id"],
      title: json["title"],
      image: json["image"],
      numOfProducts: json["numOfProducts"],
    );
  }
}

// Our demo category
Category category = Category(
  id: "1",
  title: "Armchair",
  image: "https://i.imgur.com/JqKDdxj.png",
  numOfProducts: 100,
);