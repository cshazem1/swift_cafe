import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_cafe/cubits/local_image_cuibt/local_image_cubit.dart';
import 'package:swift_cafe/cubits/my_id_cubit/get_id_cubit.dart';
import 'package:swift_cafe/cubits/shopping_basket_cubit/shopping_basket_cubit.dart';
import 'package:swift_cafe/screens/home_screen.dart';
import 'package:swift_cafe/screens/log_in_screen.dart';
import 'package:swift_cafe/screens/shopping_basket_screen.dart';
import 'package:swift_cafe/screens/sign_up_screen.dart';
import 'package:swift_cafe/simple_bloc_observer.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ShoppingBasketCubit(),
        ),
        BlocProvider(
          create: (context) => FirebaseLogInCubit(),
        ),
        BlocProvider(
          create: (context) => LocalImageCubit(),
        ),
        BlocProvider(
          create: (context) => GetIdCubit(),
        ),
      ],
      child: MaterialApp(
        routes: {
          LogInScreen.id: (context) => const LogInScreen(),
          HomeScreen.id: (context) => const HomeScreen(),
          SignUpScreen.id: (context) => const SignUpScreen(),
          SoppingBasketScreen.id: (context) => const SoppingBasketScreen()
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.deepOrange
              .withOpacity(.7), // Setting primary color to orange

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
        ),
        initialRoute: LogInScreen.id,
      ),
    );
  }
}
