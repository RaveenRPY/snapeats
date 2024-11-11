import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:snapeats/utils/app_colors.dart';

import 'features/presentation/views/splash/splash_view.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    // systemNavigationBarColor: AppColors.primaryGreen,
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          theme: ThemeData(
            colorScheme:
            ColorScheme.fromSeed(seedColor: AppColors.primaryGreen),
            useMaterial3: true,
          ),
          home: const SplashView(),
        );
      },
    );
  }
}
