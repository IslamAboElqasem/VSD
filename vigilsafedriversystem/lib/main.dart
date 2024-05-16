import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vigilsafedriversystem/Features/Sign_Up/presentation/view_model/sign_up_cubit/sign_up_cubit.dart';
import 'package:vigilsafedriversystem/firebase_options.dart';

import 'Features/Splash/presentation/views/splash_view.dart';

Future<void> main() async {
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
          create: (context) => SignUpCubit(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: const Color(0xFF82CAFA),
          ),
          home: const SplashView()),
    );
  }
}
