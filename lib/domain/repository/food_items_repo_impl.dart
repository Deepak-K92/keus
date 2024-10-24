import '../../data/data_source/food_items_data_source.dart';
import '../../get_it/di.dart';
import 'food_items_repo.dart';

class FoodItemsRepoImpl extends FoodItemsRepo {
  final FoodItemsDataSource foodItemsDataSource =
      locator<FoodItemsDataSource>();
  @override
  getFoodItemsData() => foodItemsDataSource.getFoodItems();
}
