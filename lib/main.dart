import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:http/http.dart' as http;

class productdetails{
  int id;
  String title;
  String description;
  int price;
  double discountPercentage;
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
        required this.discountPercentage,
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
          discountPercentage: json["discountPercentage"]?.toDouble(),
          rating: json["rating"]?.toDouble(),
          stock: json["stock"],
          brand: json["brand"],
          category: json["category"],
          thumbnail: json["thumbnail"],
          images: List<String>.from(json["images"].map((x)=>x)));

  // Map<String, dynamic> toJson() => {
  //   "id": id,
  //   "title": title,
  //   "description": description,
  //   "price": price,
  //   "discount": discountPercentage,
  //   "rating": rating,
  //   "stock": stock,
  //   "brand": brand,
  //   "category": category,
  //   "thumbnail": thumbnail,
  //   "images": List<dynamic>.from(images.map((x) => x)),
  // };
}

Future<productdetails> fetchproductdetails() async {
  final response = await http.get(Uri.parse('https://dummyjson.com/products/1'));

  if(response.statusCode==200){
    return productdetails.fromJson(jsonDecode(response.body));
  }
  else{
    throw Exception('Failed to load the details');
  }
}

void main() {
  runApp(Myapp());
}

  

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();
    fetchproductdetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Products')),
      body: Center(
        child: FutureBuilder<productdetails>(future: fetchproductdetails(),builder: (context, snapshot) {
          if(snapshot.hasData){
            return Text(snapshot.data!.description);
          }
          else if(snapshot.hasError){
            return Text('${snapshot.error}');
          }
          return CircularProgressIndicator();
        },),
      ),
    );
  }
}
