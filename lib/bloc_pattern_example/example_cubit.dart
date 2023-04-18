import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/bloc_pattern_example/math_repository.dart';

class ExampleCubit extends Cubit<int> {
  ExampleCubit() : super(0);

  var mathRepo = MathRepository();

  void toplamaYap(String s1, String s2) {
    emit(mathRepo.toplama(s1, s2));
  }

  carpmaYap(String s1, String s2) {
    emit(mathRepo.carpma(s1, s2));
  }
}
