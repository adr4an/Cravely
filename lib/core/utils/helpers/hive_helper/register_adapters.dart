import 'package:hive/hive.dart';
import 'package:cravely/features/home/data/models/pizza_hive_model.dart';

void registerAdapters() {
	Hive.registerAdapter(PizzaHiveModelAdapter());
}
