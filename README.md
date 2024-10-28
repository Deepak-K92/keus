# keus_assignment

A Keus Assignment project.

## Problem Statement

As you know, it is very much possible to implement complex designs given by
designers using flutter and its libraries. The goal of this challenge is to implement
the UI designer's ideas in the flutter app.
Following link is a food delivery app inspiration, by one of the designers on
Dribbble.
https://dribbble.com/shots/15082658-Food-Delivery-App
Your task is to implement this design in flutter.

- Home screen:
- Horizontal list of food items
- List of food items
- Food item details bottom sheet
- Cart screen
- States can be created locally (Not required to use any external API)
- List of food items
- Add food items to cart
- Remove food items from cart
- You can search for any image and icon assets over the internet, they don't
  have to be exact same as shown in design(ex:
  https://www.graphicsfuel.com/2017/07/30-isolated-food-images)
- You can use any third party library. (Provider, Bloc, Riverpod, Flutter
  Animations, etc)

## Description

The architecture used in this project is clean architecture. We have used mock data for content to be diplayed in the ui. You can see them in the data layer. We are using flutter_bloc as state management , get_it for depedency injection and get for route navigation. The objective of the app is to implement the designs as shared in the prblem statement.

# Notes:

For the Cart Screen there was no further discussion on how items shouls apear in case of multiple items. So I had left it as it is. If you want fixed height you can just uncoment the code.

# Requirements:

- Donwload & install Java Sdk & Git
- Donwload Android SDK
- Donwload & configure for Flutter SDK in your System.
- Install Android Studio / VS code as IDEs

# Used Version for Projects:

- Flutter 3.24.2
- java 17.0.5
- Using Android Api 33
- Android min sdk 21

## Steps to Execute:

- First make sure to have all the required softwares installed && configured.
- Make sure to install Flutter plugins for Android/VS code.
- Make sure you create an android emulator from Android Sdk Manager.
- Make sure to install Command Line tools from Andriod SDK Manager.
- If you are using VS code create launch.json file with Flutter and Dart configuration with lib/main as launch point for the project.
- Run flutter doctor -v & check if there are any problems.(You will see them in red text). If not then you are good to procced.
- Click on f5 button to run the project in your Android emulator. Make sure that your adb is running.
- Run "flutter clean" & "flutter pub get" commands.
- Check in Debug Console to make sure that there are no problems occuring.

## Test Scenarios / Screenshots

- Upon Launch the user is able to see the Home Screen as shown in Design.
- Carousel with Rounded Images stacked on the gradients along with Indicators in the bottom determining the page no.
- Filter Buttons UI is seen below Carousel
- List of Food Items shown in customized UI.
- Food Items Details can be shown upon tapping one of the FoodItem Cards
- Upon FoodItems BottomSheet opening the we will see the item description and UI as shown ind design.
- You are able to increment/decrement quantity for the item.
- Your food item total would be shown in the button next to it along with "Add to cart" tex, you can tap on it.
- The cart section is viewable in the home screen only if there are any items in the cart.You can tap on it to proceed to cart screen.
- Here you will get the details of the food item and its quantity.
- Here you willl get the total amount of all the items in the cart.

Check the screenshots folder for the output here (https://github.com/Deepak-K92/keus/tree/main/screenshots).

## References

Downloaded and used SF Pro Display font from Adobe.

Flutter Packages used

- get_it
- flutter_bloc
- get
- sizer
- flutter_svg
- material_symbol_icons

Images are used from google search;
