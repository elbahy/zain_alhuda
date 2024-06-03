import 'package:zain_alhuda/features/azkar/data/models/azkar_model.dart';

abstract class AzkarState {}

final class AzkarInitial extends AzkarState {}

class AzkarLoading extends AzkarState {}

class AzkarLoaded extends AzkarState {
  final AzkarModel azkarList;

  AzkarLoaded({required this.azkarList});
}

class AzkarError extends AzkarState {
  final String message;

  AzkarError({required this.message});
}
