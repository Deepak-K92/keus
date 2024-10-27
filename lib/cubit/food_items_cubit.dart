import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:keus_assignment/get_it/di.dart';

import '../data/model/food_items_model.dart';
import '../domain/use_case/food_items_usecase.dart';
import '../presentation/model/cart_model.dart';

part 'food_items_state.dart';

class FoodItemsCubit extends Cubit<FoodItemsState> {
  FoodItemsCubit() : super(FoodItemsInitial());

  final FoodItemsUsecase usecase = locator<FoodItemsUsecase>();

  PageController pageController = PageController(initialPage: 0);
  int activePage = 0, quantity = 0, price = 0, cutlery = 0;
  double total = 0;

  Set<CartModel> cartItems = {};

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

  onAddToCart({required FoodItemDetails details, required int quantity}) {
    addToCart(
        item: CartModel(
      id: details.id ?? 0,
      name: details.name ?? '',
      imageUrl: details.imageUrl ?? '',
      quantity: quantity,
      price: details.price ?? 0,
    ));
    quantity = 0;
    final List<FoodItemDetails> data = usecase.getFoodItemsData();
    emit(FoodItemsLoadedState(
        items: data, pageController, activePage: activePage));

    Get.back();

    emit(FoodItemsLoadedState(
        items: data, pageController, activePage: activePage));
  }

  addToCart({required CartModel item}) {
    // ignore: collection_methods_unrelated_type

    if (cartItems.contains(item)) {
      cartItems.remove(item);
      cartItems.add(item);
    } else {
      cartItems.add(item);
    }
    total = calclatePriceInCart();
    total;
  }

  double calclatePriceInCart() {
    double tot = 0;
    for (var item in cartItems) {
      tot = tot + (item.quantity * (item.price));
    }
    return tot;
  }

  addItemQuant({required int quant, required CartModel item}) {
    int temp = 0;
    temp = quant;
    temp++;
    item.quantity = temp;
    total = calclatePriceInCart();
    getFoodItems();
  }

  subItemQuant({required int quant, required CartModel item}) {
    if (item.quantity == 1) {
      cartItems.remove(item);
    } else {
      int temp = 0;
      temp = quant;
      temp--;
      item.quantity = temp;
      total = calclatePriceInCart();
    }

    getFoodItems();
  }

  addCutleryQuant({required int quant}) {
    cutlery++;
    total = calclatePriceInCart();
    getFoodItems();
  }

  subCutleryQuant({required int quant}) {
    if (cutlery > 0) {
      cutlery--;
      total = calclatePriceInCart();
      getFoodItems();
    }
  }
}
