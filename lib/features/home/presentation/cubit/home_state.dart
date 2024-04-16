class HomeState {}

class HomeInitial extends HomeState {}

class GetLastQuranReadSuccess extends HomeState {
  final int surahNum;
  final int quranPage;

  GetLastQuranReadSuccess({required this.quranPage, required this.surahNum});
}

class GetLastQuranReadFailure extends HomeState {}

class GetLocationLoading extends HomeState {}

class GetLocationSuccess extends HomeState {
  final double latitude;
  final double longitude;
  GetLocationSuccess({required this.latitude, required this.longitude});
}

class GetLocationFailure extends HomeState {
  final String errorMsg;
  GetLocationFailure({required this.errorMsg});
}
