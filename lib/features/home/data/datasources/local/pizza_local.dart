import 'package:cravely/core/constants/hive_key.dart';
import 'package:cravely/core/utils/helpers/log_helper.dart';
import 'package:cravely/features/home/data/models/pizza_hive_model.dart';
import 'package:cravely/features/home/domain/entities/pizza_entities.dart';
import 'package:hive/hive.dart';

class PizzaLocal {
  // collection keys of 'pizzas' in Hive
  final String _boxKey = DbKeys.dbProducts;

  late Box <PizzaHiveModel> _productBox;

  // Open the box
  Future<void> init() async {
    try {
      _productBox = await Hive.openBox<PizzaHiveModel>(_boxKey);
      logger.i('Hive box opened: $_boxKey'); // ← add logger
    } catch (e) {
      logger.e('Error opening Hive box: $e');
    }
  }

  Future<List<PizzaEntity>> getCachedPizzas() async {
    try {
      return _productBox.values
        .map((hiveModel) => hiveModel.toEntity())
        .toList();
    } 
    
    catch (e) {
      logger.e('Error getting cached pizzas: $e');
      
      // return empty list on error
      return [];  
    }
  }
  
  Future<void> savePizzas(List<PizzaEntity> pizzas) async {
    try {
      // get current keys in Hive 
      final existingKeys = _productBox.keys.toSet();

      // get new keys from Firestore
      final newKeys = pizzas.map((p) => p.pizzaId).toSet();

      // find what's in existingKeys but NOT in newKeys
      final deletedKeys = existingKeys.difference(newKeys);

      // delete removed pizzas
      await _productBox.deleteAll(deletedKeys);

      // overwrite/add updated pizzas
      await _productBox.putAll({
        for (var pizza in pizzas)
          pizza.pizzaId: PizzaHiveModel.fromEntity(pizza)
      });

      logger.i('Pizzas saved to Hive: ${pizzas.length}');
    } catch (e) {
      logger.e('Error saving pizzas: $e');
    }
  }
  
  // Future<void> clearPizzas(){
  //   try {
  //     _productBox.clear();
  //     logger.i('Pizzas cleared from Hive');
  //   } catch (e) {
  //     logger.e('Error clearing pizzas: $e');
  //   }
  // }

}