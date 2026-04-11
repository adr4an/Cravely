part of 'get_pizza_bloc.dart';

enum GetPizzaStatus { initial, loading, successFetch, failedFetch, offline }

class GetPizzaState extends Equatable {
  final GetPizzaStatus status;
  final List<PizzaEntity> pizzas;
  final String errorMessage;

  const GetPizzaState({
    required this.status,
    this.pizzas = const [],
    this.errorMessage = '',
  });

  const GetPizzaState.initial() : this(status: GetPizzaStatus.initial);

  const GetPizzaState.loading() : this(status: GetPizzaStatus.loading);

  const GetPizzaState.offline() : this(status: GetPizzaStatus.offline);

  const GetPizzaState.successFetch(List<PizzaEntity> pizzas) 
    : this(status: GetPizzaStatus.successFetch, pizzas: pizzas);

  const GetPizzaState.failedFetch(String errorMessage) 
    : this(status: GetPizzaStatus.failedFetch, errorMessage: errorMessage);


  @override
  List<Object> get props => [status, pizzas, errorMessage];
}

