import 'package:ayurmitra/src/presentation/screens/splashscreen/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class AyurMitra extends StatelessWidget {
  const AyurMitra({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ayur Mitra',
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      home: SplashScreen(),
    );
  }
}
