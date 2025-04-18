import 'package:a2sv_hub/features/auth/presentation/pages/login_page.dart';
import 'package:a2sv_hub/features/auth/presentation/pages/role_page.dart';
import 'package:a2sv_hub/features/auth/presentation/pages/signup_page.dart';
import 'package:go_router/go_router.dart';

import 'app_routes.dart';

final router = GoRouter(
  initialLocation: '/role',
  routes: <RouteBase>[
    //! Auth -------------------------------------------------------------------
    GoRoute(
      path: Routes.role,
      builder: (context, state) => const RolePage(),
    ),
    GoRoute(
      path: Routes.login,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: Routes.signup,
      builder: (context, state) => const SignupPage(),
    ),
  ]
);