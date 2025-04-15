import 'package:a2sv_hub/bloc_observer.dart';
import 'package:a2sv_hub/core/presentation/routes/router.dart';
import 'package:a2sv_hub/features/auth/presentation/Bloc/auth_bloc.dart';
import 'package:a2sv_hub/features/auth/presentation/Bloc/auth_event.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'features/presentation/pages/splash_screen.dart';
import 'features/presentation/pages/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();

  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'A2SV Hub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2065D1)),
        useMaterial3: true,
      ),
      home: const SplashScreenWrapper(),
    );
  }
}

class SplashScreenWrapper extends StatefulWidget {
  const SplashScreenWrapper({Key? key}) : super(key: key);

  @override
  State<SplashScreenWrapper> createState() => _SplashScreenWrapperState();
}

class _SplashScreenWrapperState extends State<SplashScreenWrapper> {
  @override
  void initState() {
    super.initState();
    // Navigate to HomePage after 2 seconds
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();

    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => di.serviceLocator<AuthBloc>()
            ..add(const AuthGetCurrentUserEvent()),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        title: 'A2SV Hub',
        debugShowCheckedModeBanner: false,
      ),
    );

  }
}
