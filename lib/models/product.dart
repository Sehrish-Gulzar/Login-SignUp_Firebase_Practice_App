import 'package:flutter/material.dart';

class Product {
  final String? image, title, description;
  final int? price, size, id;
  final Color? color;
  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.size,
    required this.color,
  });
}

List<Product> products = [
  Product(
      id: 1,
      title: "Office Code",
      price: 234,
      size: 12,
      description: dummyText,
      image: "assets/images/bag_5.png",
      color: Color(0xFFFB7883)),
  Product(
    id: 2,
    title: "Office Code",
    price: 234,
    size: 12,
    description: dummyText,
    image: "assets/images/bag_6.png",
    color: Color(0xFFAEAEAE),
  ),
  Product(
      id: 3,
      title: "Cream Dress",
      price: 234,
      size: 12,
      description: dummyText,
      image: "assets/images/image (1).png",
      color: Color(0xFFE1AFD1)),
  Product(
      id: 4,
      title: "T-shirt",
      price: 234,
      size: 10,
      description: dummyText,
      image: "assets/images/image (3).png",
      color: Color(0xFF989493)),
  Product(
      id: 5,
      title: "Black mini dress",
      price: 234,
      size: 8,
      description: dummyText,
      image: "assets/images/image (2).png",
      color: Color(0xFFAEAEAE)),
  Product(
      id: 6,
      title: "Head Phones",
      price: 234,
      size: 11,
      description: dummyText,
      image: "assets/images/image (4).png",
      color: Color(0xFFAEAEAE)),
  Product(
      id: 7,
      title: "Belt Bag",
      price: 234,
      size: 8,
      description: dummyText,
      image: "assets/images/bag_2.png",
      color: Color(0xFFD3A984)),
  Product(
      id: 8,
      title: "Hang Top",
      price: 234,
      size: 10,
      description: dummyText,
      image: "assets/images/bag_3.png",
      color: Color(0xFF989493)),
  Product(
      id: 9,
      title: "Office Code",
      price: 234,
      size: 12,
      description: dummyText,
      image: "assets/images/image (5).png",
      color: Color(0xFFB8000)),
  Product(
    id: 10,
    title: "Office Code",
    price: 234,
    size: 12,
    description: dummyText,
    image: "assets/images/image (6).png",
    color: Color(0xFFC4E4FF),
  ),
  Product(
      id: 11,
      title: "Old Fashion",
      price: 234,
      size: 11,
      description: dummyText,
      image: "assets/images/bag_4.png",
      color: Color(0xFFE6B398)),
  Product(
      id: 12,
      title: "Office Code",
      price: 234,
      size: 12,
      description: dummyText,
      image: "assets/images/bag_1.png",
      color: Color(0xFF3D82AE)),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
