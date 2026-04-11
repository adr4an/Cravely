import 'package:cravely/features/home/domain/entities/pizza_entities.dart';
import 'package:hive/hive.dart';
import 'package:cravely/core/utils/helpers/hive_helper/hive_types.dart';
import 'package:cravely/core/utils/helpers/hive_helper/hive_adapters.dart';
import 'package:cravely/core/utils/helpers/hive_helper/fields/pizza_hive_model_fields.dart';
part 'pizza_hive_model.g.dart';

@HiveType(typeId: HiveTypes.pizzaHiveModel, adapterName: HiveAdapters.pizzaHiveModel)
class PizzaHiveModel extends HiveObject{
	@HiveField(PizzaHiveModelFields.pizzaId)
  final String pizzaId;
	@HiveField(PizzaHiveModelFields.name)
  final String name;
	@HiveField(PizzaHiveModelFields.description)
  final String description;
	@HiveField(PizzaHiveModelFields.price)
  final double price;
	@HiveField(PizzaHiveModelFields.discount)
  final double discount;
	@HiveField(PizzaHiveModelFields.imgUrl)
  final String imgUrl;
	@HiveField(PizzaHiveModelFields.categories)
  final String categories;
	@HiveField(PizzaHiveModelFields.rating)
  final double rating;
	@HiveField(PizzaHiveModelFields.cals)
  final int cals;
	@HiveField(PizzaHiveModelFields.carbs)
  final int carbs;
	@HiveField(PizzaHiveModelFields.proteins)
  final int proteins;
	@HiveField(PizzaHiveModelFields.fats)
  final int fats;

  PizzaHiveModel({
    required this.pizzaId,
    required this.name,
    required this.description,
    required this.price,
    required this.discount,
    required this.imgUrl,
    required this.categories,
    required this.rating,
    required this.cals,
    required this.carbs,
    required this.proteins,
    required this.fats,    
  });

  // Entity to HiveModel
  factory PizzaHiveModel.fromEntity(PizzaEntity pizza) {
    return PizzaHiveModel(
      pizzaId: pizza.pizzaId,
      name: pizza.name,
      description: pizza.description,
      price: pizza.price,
      discount: pizza.discount,
      imgUrl: pizza.imgUrl,
      categories: pizza.categories,
      rating: pizza.rating,
      cals: pizza.macros.cals,
      carbs: pizza.macros.carbs,
      proteins: pizza.macros.proteins,
      fats: pizza.macros.fats,

    );
  }

  // HiveModel to Entity
  PizzaEntity toEntity() {
    return PizzaEntity(
      pizzaId: pizzaId,
      name: name,
      description: description,
      price: price,
      discount: discount,
      imgUrl: imgUrl,
      categories: categories,
      rating: rating,
      macros: Macros(
        cals: cals,
        carbs: carbs,
        proteins: proteins,
        fats: fats,
      ),
    );
  }

}