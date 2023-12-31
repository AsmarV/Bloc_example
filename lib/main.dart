import 'package:bloc_example/features/onboarding/splash/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';

import 'app.dart';

import 'features/auth/login/bloc/login_bloc.dart';
import 'features/onboarding/onboard/bloc/onboard_bloc.dart';
import 'features/onboarding/splash/bloc/splash_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: providers,
      child: MaterialApp(
        navigatorKey: navKey,
        scaffoldMessengerKey: scaffoldKey,
        title: title,
        theme: lightTheme,
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}

var providers = [
  ///ONBOARDING PROVIDER
  BlocProvider<SplashBloc>(
    create: (context) => SplashBloc(),
  ),
  BlocProvider<OnboardBloc>(
    create: (context) => OnboardBloc(),
  ),

  ///AUTH PROVIDER
  BlocProvider<LoginBloc>(
    create: (context) => LoginBloc(),
  ),
];
