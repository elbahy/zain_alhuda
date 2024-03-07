import 'package:go_router/go_router.dart';
import 'package:zain_alhuda/features/home/presentation/views/home_view.dart';

abstract class AppRouter {
  static final router = GoRouter(routes: [
    GoRoute(path: '/', builder: (context, state) => const HomeView()),
  ]);
}
