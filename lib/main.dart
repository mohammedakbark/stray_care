import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stray_care/controller/controller.dart';
import 'package:stray_care/controller/payment_service.dart';
import 'package:stray_care/controller/user_db_controller.dart';
import 'package:stray_care/firebase_options.dart';
import 'package:stray_care/view/const/custom_colors.dart';
import 'package:stray_care/view/login_selection.dart';
import 'package:stray_care/view/modules/user/user_home.dart';
import 'package:stray_care/view/splash_screen.dart';

void main() async {
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserController>(
          create: (context) => UserController(),
        ),
        ChangeNotifierProvider<UserDBController>(
          create: (context) => UserDBController(),
        ),
        ChangeNotifierProvider<PaymentController>(create: (_)=>PaymentController())
      ],
      child: MaterialApp(
          theme: ThemeData(
            // scaffoldBackgroundColor: DEFAULT_BLUE_DARK,
            colorScheme:
                ColorScheme.fromSeed(seedColor: CustomColors.buttonColor1),
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          title: 'Stray Care',
          home: SplashScreen()),
    );
  }
}
