import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zain_alhuda/features/reciters/presentation/cubit/reciters_state.dart';
import 'package:zain_alhuda/features/reciters/presentation/data/reciters_model.dart';
import 'package:zain_alhuda/features/reciters/presentation/data/reciters_repo.dart';

class RecitersCubit extends Cubit<RecitersState> {
  RecitersCubit(this.recitersRepo) : super(RecitersInitial()) {
    audioPlayer.onPlayerComplete.listen((event) {
      _playNextAudio(); // عند اكتمال الصوت، الانتقال للصوت التالي
    });
  }

  static RecitersCubit get(context) => BlocProvider.of<RecitersCubit>(context);
  late List<RecitersModel> recitersModel;
  final RecitersRepo recitersRepo;

  final List<RecitersModel> _searchList = <RecitersModel>[];

  static AudioPlayer audioPlayer = AudioPlayer();
  String currentPlayingUrl = '';
  int currentIndex = -1; // لتتبع الصوت الحالي
  List<String> links = [];

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

  void playAudio(List<String> link, int index) async {
    links = link; // تأكد من تعيين الروابط قبل التشغيل
    currentIndex = index; // تعيين الفهرس الحالي للصوت الذي سيتم تشغيله

    // تحقق من حالة المشغل الحالية
    if (audioPlayer.state == PlayerState.playing &&
        currentPlayingUrl == link[index]) {
      // إذا كان الصوت يتم تشغيله وهو نفس الرابط، قم بإيقافه مؤقتًا
      await audioPlayer.pause();
      playAudioIcon(99999999999999);
    } else if (audioPlayer.state == PlayerState.paused &&
        currentPlayingUrl == link[index]) {
      // إذا كان الصوت متوقف مؤقتًا وهو نفس الرابط المطلوب، استأنف التشغيل
      await audioPlayer.resume();
      playAudioIcon(index);
    } else {
      // قم بإيقاف الصوت الحالي (إن وجد) ثم تشغيل الصوت الجديد
      if (audioPlayer.state == PlayerState.playing) {
        await audioPlayer.stop();
      }
      currentPlayingUrl = link[index]; // حفظ الرابط الحالي
      currentIndex = index; // تعيين الفهرس الحالي
      await audioPlayer.play(UrlSource(link[index]));
      if (!isClosed) playAudioIcon(index);
    }
  }

  void audioPlayerDispose() {
    if (audioPlayer.state == PlayerState.playing) {
      audioPlayer.stop();
      currentPlayingUrl = '';
      playAudioIcon(9999999999999);
    }
  }

  void playAudioIcon(int index) {
    emit(PlayAudioIcon(index: index));
  }

  void _playNextAudio() {
    if (currentIndex < links.length - 1) {
      currentIndex++;

      playAudio(links, currentIndex);
      // scrollController.jumpTo(currentIndex.toDouble());
    } else {
      // بدلاً من إعادة تعيين القيم، قم بإيقاف التشغيل
      currentIndex = -1; // تأكد من إعادة تعيين الفهرس
      currentPlayingUrl = ''; // تأكد من إعادة تعيين الرابط
      playAudioIcon(-1); // استخدم قيمة مميزة للإشارة إلى الإيقاف
    }
  }
}
