import 'package:bmi_calculator/shared/cubit/cubit.dart';
import 'package:bmi_calculator/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AgeWeightRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
        listener: (context, AppState state) {},
        builder: (context, AppState state) {
          AppCubit cubit = AppCubit.get(context);

          return Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 150,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[400],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'AGE',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${cubit.age}',
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                    onPressed: () {
                                      cubit.ageChange(-1);
                                    },
                                    heroTag: 'age-',
                                    mini: true,
                                    child: Icon(
                                      Icons.remove,
                                    )),
                                FloatingActionButton(
                                    onPressed: () {
                                      cubit.ageChange(1);
                                    },
                                    heroTag: 'age+',
                                    mini: true,
                                    child: Icon(
                                      Icons.add,
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[400],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'WEIGHT',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${cubit.weight}',
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                    onPressed: () {
                                      cubit.weightChange(-1);
                                    },
                                    heroTag: 'weight-',
                                    mini: true,
                                    child: Icon(
                                      Icons.remove,
                                    )),
                                FloatingActionButton(
                                    onPressed: () {
                                      cubit.weightChange(1);
                                    },
                                    heroTag: 'weight+',
                                    mini: true,
                                    child: Icon(
                                      Icons.add,
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
