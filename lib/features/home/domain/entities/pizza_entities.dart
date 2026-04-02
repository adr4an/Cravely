
import 'package:cravely/features/home/domain/entities/macros_entity.dart';

class PizzaEntity {
  final String pizzaId;
  final String name;
  final String description;
  final double price;
  final double discount;
  final String imgUrl;
  final String categories;
  final String rating;
  final Macros macros;

  PizzaEntity({
    required this.pizzaId,
    required this.name,
    required this.description,
    required this.price,
    required this.discount,
    required this.imgUrl,
    required this.categories,
    required this.rating,
    required this.macros,
  });
}