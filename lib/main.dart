import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_cafe/screens/home_screen.dart';
import 'package:swift_cafe/screens/log_in_screen.dart';
import 'package:swift_cafe/screens/sign_up_screen.dart';
import 'package:swift_cafe/simple_bloc_observer.dart';
import 'cubits/categry_image_cuibt/get_location_image_cubit.dart';
import 'cubits/firebase_log_in_cubit/firebase_log_in_cubit.dart';
import 'firebase_options.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FirebaseLogInCubit(),
      child: BlocProvider(
        create: (context) => GetLocationImageCubit(),
        child: MaterialApp(
          routes: {
            LogInScreen.id: (context) => LogInScreen(),
            HomeScreen.id: (context) => HomeScreen(),
            SignUpScreen.id: (context) => const SignUpScreen()
          },
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
            useMaterial3: true,
          ),
          initialRoute: LogInScreen.id,
        ),
      ),
    );
  }
}
