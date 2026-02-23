import 'package:go_router/go_router.dart';
import '../../../features/breathing/presentation/pages/breathing_page.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const BreathingPage()),
    ],
  );
}
