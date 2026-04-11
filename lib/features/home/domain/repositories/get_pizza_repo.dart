import 'package:cravely/features/home/domain/entities/pizza_entities.dart';

abstract class GetPizzaRepo {

  Stream<List<PizzaEntity>> getPizzas();

}