import 'package:cravely/features/home/domain/entities/pizza_entities.dart';

class PizzaModel extends PizzaEntity {
 
  PizzaModel({
    required super.pizzaId,
    required super.name,
    required super.description,
    required super.price,
    required super.imgUrl, 
    required super.discount, 
    required super.categories, 
    required super.rating, 
    required super.macros, 
  });

   // Create PizzaModel from JSON retrieved from firestore
  factory PizzaModel.fromJson(Map<String, dynamic> json) {
    return PizzaModel(
      pizzaId:     json['pizzaId']     as String?  ?? '',
      name:        json['name']        as String?  ?? '',
      description: json['description'] as String?  ?? '',
      imgUrl:      json['imgUrl']      as String?  ?? '',
      categories:  json['categories']  as String?  ?? '',
      price:       (json['price']      as num? ?? 0).toDouble(),
      discount:    (json['discount']   as num? ?? 0).toDouble(),
      rating:      ((json['rating']    as num? ?? 0).toDouble()),
      macros:      json['macros'] != null
        ? Macros(
            cals:      (json['macros']['cals']      as num? ?? 0).toInt(),
            carbs:     (json['macros']['carbs']     as num? ?? 0).toInt(),
            proteins:  (json['macros']['proteins']  as num? ?? 0).toInt(),
            fats:      (json['macros']['fats']      as num? ?? 0).toInt(),
          )
        : Macros.empty,
    );
  }

} 