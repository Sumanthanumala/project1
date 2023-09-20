
class productdetails{

  int id;
  String title;
  String description;
  double price;
  double discount;
  double rating;
  int stock;
  String brand;
  String category;
  String thumbnail;
  List<String> images;

  productdetails(
      {required this.id,
        required this.title,
        required this.description,
        required this.price,
        required this.discount,
        required this.rating,
        required this.stock,
        required this.brand,
        required this.category,
        required this.thumbnail,
        required this.images,
      });

  factory productdetails.fromJson(Map<String,dynamic>json) =>
      productdetails(id: json["id"],
          title: json["title"],
          description: json["description"],
          price: json["price"],
          discount: json["discount"],
          rating: json["rating"],
          stock: json["stock"],
          brand: json["brand"],
          category: json["category"],
          thumbnail: json["thumbnail"],
          images: List<String>.from(json["images"].map((x)=>x)));

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "price": price,
    "discount": discount,
    "rating": rating,
    "stock": stock,
    "brand": brand,
    "category": category,
    "thumbnail": thumbnail,
    "images": List<dynamic>.from(images.map((x) => x)),
  };
}