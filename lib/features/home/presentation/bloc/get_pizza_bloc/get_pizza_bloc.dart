import 'package:bloc/bloc.dart';
import 'package:cravely/features/home/data/datasources/local/pizza_local.dart';
import 'package:cravely/features/home/domain/entities/pizza_entities.dart';
import 'package:cravely/features/home/domain/repositories/get_pizza_repo.dart';
import 'package:equatable/equatable.dart';

part 'get_pizza_event.dart';
part 'get_pizza_state.dart';

class GetPizzaBloc extends Bloc<GetPizzaEvent, GetPizzaState> {
  final GetPizzaRepo getPizzaRepo;
  final PizzaLocal pizzaLocal;

  GetPizzaBloc(this.getPizzaRepo, this.pizzaLocal) 
    : super(GetPizzaState.initial()) {

    on<FetchPizzaEvent>((event, emit) async {
      // load cached pizzas first
      final cached = await pizzaLocal.getCachedPizzas();

      if (cached.isNotEmpty) {
        emit(GetPizzaState.successFetch(cached)); 
      } else {
        emit(GetPizzaState.loading());
      }

      // check connectivity status 
      if (!event.isConnected) {
        if (cached.isEmpty) {
          emit(GetPizzaState.offline()); 
        }
        
        return; 
      }

      // listen to Firestore stream
      await emit.forEach<List<PizzaEntity>>(
        getPizzaRepo.getPizzas(), 

        onData: (pizzas) {
          pizzaLocal.savePizzas(pizzas); // save data whenever new data is fetched

          return GetPizzaState.successFetch(pizzas);
        },

        onError: (error, stackTrace) => 
          GetPizzaState.failedFetch(error.toString()),
      );
    });

  }
  
}
