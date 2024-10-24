import '../mock_data/food_items_data.dart';
import '../model/food_items_model.dart';
import 'food_items_data_source.dart';

class FoodItemsDataSourceImpl extends FoodItemsDataSource {
  @override
  getFoodItems() {
    FoodItemsModel foodItems = FoodItemsModel.fromJson(getFoodItemsData());
    return foodItems.data;
  }
}
