import 'package:bloc/bloc.dart';
import 'package:bmi_calculator/shared/bloc_observer.dart';
import 'package:bmi_calculator/shared/cubit/cubit.dart';
import 'package:bmi_calculator/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'layout/home_layout.dart';

void main() {
  Bloc.observer = MyBlocObserver();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, AppState state) {},
        builder: (context, AppState state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: HomeLayout(),
          );
        },
      ),
    );
  }
}
