import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zain_alhuda/features/reciters/presentation/cubit/reciters_state.dart';
import 'package:zain_alhuda/features/reciters/presentation/data/reciters_model.dart';

class RecitersCubit extends Cubit<RecitersState> {
  RecitersCubit() : super(RecitersInitial());

  static RecitersCubit get(context) => BlocProvider.of(context);
  late RecitersModel recitersModel;

  Future<void> getReciters() async {
    emit(GetRecitersLoading());
    try {
      // await ApiConsumer().get(path: apis)
    } catch (e) {
      emit(GetRecitersFailure(errorMsg: e.toString()));
    }
  }
}
