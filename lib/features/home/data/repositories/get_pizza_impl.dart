import 'package:cravely/core/di/injection.dart';
import 'package:cravely/features/home/data/models/pizza_model.dart';
import 'package:cravely/features/home/domain/entities/pizza_entities.dart';

class GetPizzaImpl extends GetPizzaRepo {
  // access the pizza collection from firestore
  final FirebaseFirestore _firestore;

  GetPizzaImpl(this._firestore);

  @override
  Stream<List<PizzaEntity>> getPizzas() {
    return _firestore.collection('pizzas') 
      .snapshots() 
      .map((snap) => snap.docs
        .map((doc) => PizzaModel.fromJson(doc.data()))
        .toList()
      );
  }

}
