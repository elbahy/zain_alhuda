import 'package:zain_alhuda/features/reciters/presentation/data/reciters_model.dart';

List<String> getRecitersAudioLinks(Moshaf moshaf) {
  List<String> numbers = moshaf.surahList.split(',');
  return numbers
      .map((e) => '${moshaf.server}/${e.padLeft(3, '0')}.mp3')
      .toList();
}
