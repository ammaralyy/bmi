import 'dart:math';
import 'package:bmi_calculator/modules/age_weight_row.dart';
import 'package:bmi_calculator/shared/cubit/cubit.dart';
import 'package:bmi_calculator/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayout extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, AppState state) {},
        builder: (context, AppState state) {
          AppCubit cubit = AppCubit.get(context);

          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text('BMI Calculator'),
            ),
            body: Column(
              children: [
                Expanded(
                  child: Container(
                    height: 150,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                cubit.isMaleChange(true);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: cubit.isMale
                                      ? Colors.blue
                                      : Colors.grey[400],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image(
                                      image:
                                          AssetImage('assets/images/male.png'),
                                      height: 90,
                                      width: 90,
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      'MALE',
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                cubit.isMaleChange(false);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: !cubit.isMale
                                      ? Colors.blue
                                      : Colors.grey[400],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image(
                                      image: AssetImage(
                                          'assets/images/female.png'),
                                      height: 90,
                                      width: 90,
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      'FEMALE',
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[400],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'HEIGHT',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                '${cubit.height.round()}',
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                'CM',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Slider(
                            value: cubit.height,
                            max: 240,
                            min: 80,
                            onChanged: (value) {
                              cubit.heightChange(value);
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                AgeWeightRow(),
                Container(
                  width: double.infinity,
                  color: Colors.blue,
                  child: MaterialButton(
                    onPressed: () {
                      var result =
                          (cubit.weight / pow((cubit.height / 100), 2));

                      cubit.resultChange(result.round());

                      if (!cubit.isBottomSheetShown) {
                        scaffoldKey.currentState!
                            .showBottomSheet(
                              (context) => Container(
                                width: double.infinity,
                                color: Colors.blue,
                                padding: EdgeInsets.all(20),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Gender: ${cubit.gender}',
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Result: ${cubit.result}',
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Age: ${cubit.age}',
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              elevation: 20.0,
                            )
                            .closed
                            .then((value) {
                          cubit.changeBottomSheetState(isShow: false);
                        });
                        cubit.changeBottomSheetState(isShow: true);
                      }
                    },
                    height: 50,
                    child: Text(
                      'Calculate',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
