part of 'food_items_cubit.dart';

@immutable
sealed class FoodItemsState extends Equatable {}

final class FoodItemsInitial extends FoodItemsState {
  @override
  List<Object?> get props => [];
}

final class FoodItemsLoading extends FoodItemsState {
  @override
  List<Object?> get props => [];
}

final class FoodItemsLoadedState extends FoodItemsState {
  final List<FoodItemDetails> items;
  final PageController pageController;
  final int activePage;
  FoodItemsLoadedState(
    this.pageController, {
    required this.items,
    required this.activePage,
  });

  @override
  List<Object?> get props => [items];
}
