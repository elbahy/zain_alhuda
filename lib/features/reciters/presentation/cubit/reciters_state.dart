import 'package:zain_alhuda/features/reciters/presentation/data/reciters_model.dart';

abstract class RecitersState {}

final class RecitersInitial extends RecitersState {}

class GetRecitersLoading extends RecitersState {}

class GetRecitersSuccess extends RecitersState {
  final List<RecitersModel> reciters;

  GetRecitersSuccess({required this.reciters});
}

class GetRecitersFailure extends RecitersState {
  final String errorMsg;

  GetRecitersFailure({required this.errorMsg});
}
