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

  static AudioPlayer audioPlayer = AudioPlayer();
  String currentPlayingUrl = '';

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

  void playAudio(String link, int index) async {
    // تحقق من حالة المشغل الحالية
    if (audioPlayer.state == PlayerState.playing && currentPlayingUrl == link) {
      // إذا كان الصوت يتم تشغيله وهو نفس الرابط، قم بإيقافه مؤقتًا
      await audioPlayer.pause();
      emit(PlayAudioIcon(index: 99999999999999));
    } else if (audioPlayer.state == PlayerState.paused &&
        currentPlayingUrl == link) {
      // إذا كان الصوت متوقف مؤقتًا وهو نفس الرابط المطلوب، استأنف التشغيل
      await audioPlayer.resume();
      emit(PlayAudioIcon(index: index));
    } else {
      // قم بإيقاف الصوت الحالي (إن وجد) ثم تشغيل الصوت الجديد
      if (audioPlayer.state == PlayerState.playing) {
        await audioPlayer.stop();
      }
      currentPlayingUrl = link;
      // حفظ الرابط الحالي
      await audioPlayer.play(UrlSource(link));
      emit(PlayAudioIcon(index: index));
    }
  }

  static void audioPlayerDispose() {
    audioPlayer.dispose();
  }

  void playAudioIcon(int index) {
    emit(PlayAudioIcon(index: index));
  }
}
