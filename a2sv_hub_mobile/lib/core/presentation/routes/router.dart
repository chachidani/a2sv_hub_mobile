import 'package:a2sv_hub/features/auth/presentation/pages/login_page.dart';
import 'package:a2sv_hub/features/auth/presentation/pages/role_page.dart';
import 'package:a2sv_hub/features/auth/presentation/pages/signup_page.dart';
import 'package:a2sv_hub/features/contests/presentation/pages/contest_page.dart';
import 'package:a2sv_hub/features/contests/presentation/pages/head_contest.dart';
import 'package:a2sv_hub/features/contests/presentation/pages/profile.dart';
import 'package:a2sv_hub/features/contests/presentation/pages/users.dart';
import 'package:a2sv_hub/features/presentation/pages/attendence.dart';
import 'package:a2sv_hub/features/presentation/pages/head_exercise.dart';
import 'package:a2sv_hub/features/presentation/pages/head_problem.dart';
import 'package:a2sv_hub/features/presentation/pages/head_track.dart';
import 'package:go_router/go_router.dart';

import '../../../features/presentation/pages/home_page.dart';
import '../../../features/presentation/pages/problem_page.dart';
import '../../../features/presentation/pages/profile_page.dart';
import 'app_routes.dart';

final router = GoRouter(initialLocation: '/role', routes: <RouteBase>[
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
  GoRoute(
    path: Routes.contests,
    builder: (context, state) => const ContestPage(),
  ),
  GoRoute(
    path: Routes.home,
    builder: (context, state) => const HomePage(),
  ),
  GoRoute(
    path: Routes.problem,
    builder: (context, state) => const ProblemPage(),
  ),
  GoRoute(
    path: Routes.profile,
    builder: (context, state) => const ProfilePage(),
  ),
  GoRoute(
    path: Routes.users,
    builder: (context, state) => const UsersPage(),
  ),
  GoRoute(
    path: Routes.head_problem,
    builder: (context, state) => const HeadProblemPage(),
  ),
  GoRoute(
    path: Routes.head_constest,
    builder: (context, state) => const HeadContestPage(),
  ),
  GoRoute(
    path: Routes.headTrack,
    builder: (context, state) => const HeadTrackPage(),
  ),
  GoRoute(
    path: Routes.headExercise,
    builder: (context, state) => HeadExercisPage(),
  ),
  GoRoute(
    path: Routes.headAttendence,
    builder: (context, state) => TakeAttendence(),
  ),
]);
