class PizzaEntity {
  final String pizzaId;
  final String name;
  final String description;
  final double price;
  final double discount;
  final String imgUrl;
  final String categories;
  final double rating;
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

class Macros {
  final int cals;
  final int carbs;
  final int proteins;
  final int fats;

  const Macros({
    required this.cals,
    required this.carbs,
    required this.proteins,
    required this.fats,
  });

  factory Macros.fromJson(Map<String, dynamic> json) {
    return Macros(
      cals: json['cals'],
      carbs: json['carbs'],
      proteins: json['proteins'],
      fats: json['fats'],
    );
  }

  // Empty Macros
  static const Macros empty = Macros(
    cals: 0,
    carbs: 0,
    proteins: 0,
    fats: 0,
  );
  
}