import 'package:flutter_chat_app_with_firebase/features/home/presentation/ui/home_screen.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/ui/auth_login.dart';
import '../../features/auth/presentation/ui/auth_signup.dart';
import 'routes.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.login,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: Routes.login,
        name: 'login',
        builder: (context, state) => LoginPage(),
      ),
      GoRoute(
        path: Routes.signup,
        name: 'signup',
        builder: (context, state) => SignupPage(),
      ),
      GoRoute(
        path: Routes.home,
        name: 'home',
        builder: (context, state) => HomeScreen(),
      ),
    ],
  );
}
