import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keus_assignment/cubit/food_items_cubit.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_routes/app_route.dart';
import 'get_it/di.dart';

void main() {
  initLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FoodItemsCubit(),
        )
      ],
      child: Sizer(builder: (context, orientation, screenType) {
        return GetMaterialApp(
          title: 'Keus Assignment',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
            fontFamily: 'SF',
            useMaterial3: true,
          ),
          getPages: AppRoute().getAppRoutes(),
        );
      }),
    );
  }
}
