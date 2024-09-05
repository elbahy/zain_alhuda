import 'package:zain_alhuda/core/api/api_consumer.dart';
import 'package:zain_alhuda/core/api/api_strings.dart';
import 'package:zain_alhuda/features/reciters/presentation/data/reciters_model.dart';

class RecitersRepo {
  Future<List<RecitersModel>> getReciters() async {
    List<RecitersModel> recitersModel = <RecitersModel>[];
    final recitersData =
        await ApiConsumer(endpoint: EndPoints.recitersBaseUrl).get();

    for (var item in recitersData['reciters']) {
      recitersModel.add(RecitersModel.fromJson(item));
    }
    return recitersModel;
  }
}
