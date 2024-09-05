import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zain_alhuda/features/reciters/presentation/cubit/reciters_state.dart';
import 'package:zain_alhuda/features/reciters/presentation/data/reciters_model.dart';
import 'package:zain_alhuda/features/reciters/presentation/data/reciters_repo.dart';

class RecitersCubit extends Cubit<RecitersState> {
  RecitersCubit(this.recitersRepo) : super(RecitersInitial());

  static RecitersCubit get(context) => BlocProvider.of<RecitersCubit>(context);
  late List<RecitersModel> recitersModel;
  final RecitersRepo recitersRepo;

  final List<RecitersModel> _searchList = <RecitersModel>[];

  AudioPlayer audioPlayer = AudioPlayer();

  Future<void> getReciters() async {
    emit(GetRecitersLoading());
    try {
      await recitersRepo.getReciters().then((value) {
        recitersModel = value;

        emit(GetRecitersSuccess(reciters: recitersModel));
      });
    } catch (e) {
      emit(GetRecitersFailure(errorMsg: e.toString()));
    }
  }

  void searchReciters(String query) {
    _searchList.clear();
    if (query.isEmpty) {
      emit(GetRecitersSuccess(reciters: recitersModel));
    } else {
      for (var element in recitersModel) {
        if (element.name.contains(query)) {
          _searchList.add(element);
        }
      }
      emit(GetRecitersSuccess(reciters: _searchList));
    }
  }

  String? currentPlayingUrl;

  void playAudio(String link) async {
    // تحقق من حالة المشغل الحالية
    if (audioPlayer.state == PlayerState.playing && currentPlayingUrl == link) {
      // إذا كان الصوت يتم تشغيله وهو نفس الرابط، قم بإيقافه مؤقتًا
      await audioPlayer.pause();
    } else if (audioPlayer.state == PlayerState.paused &&
        currentPlayingUrl == link) {
      // إذا كان الصوت متوقف مؤقتًا وهو نفس الرابط المطلوب، استأنف التشغيل
      await audioPlayer.resume();
    } else {
      // قم بإيقاف الصوت الحالي (إن وجد) ثم تشغيل الصوت الجديد
      await audioPlayer.stop();
      currentPlayingUrl = link; // حفظ الرابط الحالي
      await audioPlayer.play(UrlSource(link));
    }
  }
}
