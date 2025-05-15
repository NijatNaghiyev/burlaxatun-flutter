import 'package:flutter_bloc/flutter_bloc.dart';

class AddButtonStateCubit extends Cubit<bool> {
  AddButtonStateCubit() : super(false); // false = enabled

  void disable() => emit(true);
  void enable() => emit(false);
}
