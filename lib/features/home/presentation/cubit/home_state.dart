class HomeState {}

class HomeInitial extends HomeState {}

class GetLastQuranReadSuccess extends HomeState {
  final int surahNum;
  final int quranPage;

  GetLastQuranReadSuccess({required this.quranPage, required this.surahNum});
}

class GetLastQuranReadFailure extends HomeState {}
