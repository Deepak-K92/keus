import 'package:get_it/get_it.dart';

import '../cubit/food_items_cubit.dart';
import '../data/data_source/food_items_data_source.dart';
import '../data/data_source/food_items_data_source_impl.dart';
import '../domain/repository/food_items_repo.dart';
import '../domain/repository/food_items_repo_impl.dart';
import '../domain/use_case/food_items_usecase.dart';
import '../domain/use_case/food_items_usecase_impl.dart';

GetIt locator = GetIt.instance;

initLocator() {
  locator.registerFactory<FoodItemsRepo>(() => FoodItemsRepoImpl());
  locator.registerFactory<FoodItemsDataSource>(() => FoodItemsDataSourceImpl());
  locator.registerFactory<FoodItemsUsecase>(() => FoodItemsUsecaseImpl());

  locator.registerSingleton(() => FoodItemsCubit());
}
