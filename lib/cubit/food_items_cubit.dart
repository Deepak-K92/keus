import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/model/food_items_model.dart';
import '../domain/use_case/food_items_usecase.dart';
import '../get_it/di.dart';
import '../presentation/model/cart_model.dart';

part 'food_items_state.dart';

class FoodItemsCubit extends Cubit<FoodItemsState> {
  FoodItemsCubit() : super(FoodItemsInitial());

  //DI
  final FoodItemsUsecase usecase = locator<FoodItemsUsecase>();

  //Controllers & Variable Declarations
  PageController pageController = PageController(initialPage: 0);
  int activePage = 0, quantity = 0, price = 0, cutlery = 0;
  double total = 0;

  Set<CartModel> cartItems = {};

  ///HOME

  //Load Data
  void getFoodItemsData() {
    final List<FoodItemDetails> data = usecase.getFoodItemsData();
    emit(FoodItemsLoadedState(
        items: data, pageController, activePage: activePage));
  }

  //Filter Tabs
  List<String> getFilterTabsList() =>
      ['', 'Salads', 'Pizza', 'Beverages', 'Snacks'];

  //Call Api on Load Screen
  Future getFoodItems() async {
    emit(FoodItemsLoading());
    await Future.delayed(const Duration(seconds: 1));
    getFoodItemsData();
  }

  //Returns Price of Food Item
  double getPrice({required int index}) {
    final List<FoodItemDetails> data = usecase.getFoodItemsData();
    emit(FoodItemsLoadedState(
        items: data, pageController, activePage: activePage));
    return data[index].price ?? 0;
  }

  //Carousel Logic on Page Change for Indicator
  void setActivePageValue({required int value}) {
    activePage = value;
    getFoodItemsData();
  }

  //Validation
  void checkDefaultQuantity({required int index}) {
    if (quantity == 0) {
      incrementPrice(index: index);
    }
  }

  //Add Quant
  void incrementPrice({required int index}) {
    quantity = quantity + 1;
    getFoodItems();
  }

  //Sub Quant
  void decrementPrice({required int index}) {
    if (quantity > 0) {
      quantity = quantity - 1;
      getFoodItems();
    }
  }

  //Add to Cart Logic
  void onAddToCart({required FoodItemDetails details, required int quantity}) {
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

  void addToCart({required CartModel item}) {
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

  ///CART

  //Add Item Quantity in Cart Screen
  void addItemQuant({required int quant, required CartModel item}) {
    int temp = 0;
    temp = quant;
    temp++;
    item.quantity = temp;
    total = calclatePriceInCart();
    getFoodItems();
  }

  //Sub Item Quantity in Cart Screen
  void subItemQuant({required int quant, required CartModel item}) {
    if (item.quantity == 1) {
      cartItems.remove(item);
      if (cartItems.isEmpty) {
        Get.back();
      }
    } else {
      int temp = 0;
      temp = quant;
      temp--;
      item.quantity = temp;
      total = calclatePriceInCart();
    }

    getFoodItems();
  }

  //Add Cutlery Quantity in Cart Screen
  void addCutleryQuant({required int quant}) {
    cutlery++;
    total = calclatePriceInCart();
    getFoodItems();
  }

  //Sub Cutlery Quantity in Cart Screen
  void subCutleryQuant({required int quant}) {
    if (cutlery > 0) {
      cutlery--;
      total = calclatePriceInCart();
      getFoodItems();
    }
  }
}
