import 'package:bmi_calculator/shared/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppState>
{
  AppCubit() : super(AppInitState());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isMale = true;

  String gender = 'Male';

  void isMaleChange(status) {
    isMale = status;
    print('isMale? $isMale');
    emit(AppIsMaleChangeState());

    genderChange();
  }

  void genderChange() {
    if(isMale){
      gender = 'Male';
    }else{
      gender = 'Female';
    }
    print('gender = $gender');
    emit(AppGenderChangeState());
  }

  double height = 170;

  void heightChange(value){
    height = value;
    print('height = $height');
    emit(AppHeightChangeState());
  }

  int age = 22;

  void ageChange(int? value){
    age += value!;
    print('age = $age');
    emit(AppAgeChangeState());
  }

  int weight = 70;

  void weightChange(int? value){
    weight += value!;
    print('weight = $weight');
    emit(AppWeightChangeState());
  }

  int result = 0;

  void resultChange(int? value){
    result = value!;
    print('result = $result');
    emit(AppResultChangeState());
  }

  bool isBottomSheetShown = false;

  void changeBottomSheetState({required bool isShow}) {
    isBottomSheetShown = isShow;

    print('isBottomSheetShown? $isBottomSheetShown');

    emit(AppChangeBottomSheetState());
  }

}
