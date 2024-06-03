import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zain_alhuda/core/databases/local_json/json_load.dart';
import 'package:zain_alhuda/core/databases/local_json/json_strings.dart';
import 'package:zain_alhuda/features/azkar/data/models/azkar_model.dart';
import 'package:zain_alhuda/features/azkar/presentation/cubit/azkar_state.dart';

class AzkarCubit extends Cubit<AzkarState> {
  AzkarCubit() : super(AzkarInitial());
  static AzkarCubit get(context) => BlocProvider.of(context);

  Future<void> getAzkar() async {
    emit(AzkarLoading());
    try {
      JsonLoad().loadJson(path: JsonStrings.azkarPath).then((value) {
        AzkarModel azkarModel = AzkarModel.fromJson(value);
        emit(AzkarLoaded(azkarList: azkarModel));
      });
    } catch (e) {
      emit(AzkarError(message: e.toString()));
    }
  }
}
