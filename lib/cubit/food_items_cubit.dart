import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:keus_assignment/data/model/food_items_model.dart';
import 'package:keus_assignment/domain/use_case/food_items_usecase.dart';
import 'package:keus_assignment/get_it/di.dart';
import 'package:meta/meta.dart';

part 'food_items_state.dart';

class FoodItemsCubit extends Cubit<FoodItemsState> {
  FoodItemsCubit() : super(FoodItemsInitial());

  final FoodItemsUsecase usecase = locator<FoodItemsUsecase>();

  PageController pageController = PageController(initialPage: 0);
  int activePage = 0, quantity = 0, price = 0;
  double total = 0;

  getFoodItemsData() {
    final List<FoodItemDetails> data = usecase.getFoodItemsData();
    emit(FoodItemsLoadedState(
        items: data, pageController, activePage: activePage));
  }

  double getPrice({required int index}) {
    final List<FoodItemDetails> data = usecase.getFoodItemsData();
    emit(FoodItemsLoadedState(
        items: data, pageController, activePage: activePage));
    return data[index].price ?? 0;
  }

  getFoodItems() async {
    emit(FoodItemsLoading());
    await Future.delayed(const Duration(seconds: 1));
    getFoodItemsData();
  }

  carouselOnIndicatorTap({required double index}) {
    // activePage = index.round();
    pageController.animateTo(index,
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    // getFoodItemsData();
  }

  setActivePageValue({required int value}) {
    activePage = value;
    getFoodItemsData();
  }

  checkDefaultQuantity({required int index}) {
    if (quantity == 0) {
      incrementPrice(index: index);
    }
  }

  incrementPrice({required int index}) {
    quantity = quantity + 1;
    // var prc = getPrice(index: index);
    // total = quantity.toDouble() * prc;
    getFoodItems();
  }

  decrementPrice({required int index}) {
    if (quantity > 0) {
      quantity = quantity - 1;
      // var prc = getPrice(index: index);
      // total = quantity.toDouble() * prc;
      getFoodItems();
    }
  }
}
