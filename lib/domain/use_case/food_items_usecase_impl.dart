import 'package:keus_assignment/domain/repository/food_items_repo.dart';

import '../../get_it/di.dart';
import 'food_items_usecase.dart';

class FoodItemsUsecaseImpl extends FoodItemsUsecase {
  final FoodItemsRepo foodItemsUsecase = locator<FoodItemsRepo>();
  @override
  getFoodItemsData() => foodItemsUsecase.getFoodItemsData();
}
