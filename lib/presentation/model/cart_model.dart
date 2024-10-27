import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class CartModel extends Equatable {
  final String name, imageUrl;
  int quantity, id;
  final double price;

  CartModel(
      {required this.id,
      required this.name,
      required this.imageUrl,
      required this.quantity,
      required this.price});

  @override
  List<Object?> get props => [name, id, imageUrl, quantity, price];
}
