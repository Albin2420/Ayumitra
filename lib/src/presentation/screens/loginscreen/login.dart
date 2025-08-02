import 'package:ayurmitra/src/presentation/screens/homescreen/homescreen.dart';
import 'package:ayurmitra/src/presentation/widgets/button1.dart';
import 'package:ayurmitra/src/presentation/widgets/loginTailer.dart';
import 'package:ayurmitra/src/presentation/widgets/privacyPolicy.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Logintailer(),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              top: 30,
              right: 20,
              bottom: 30,
            ),
            child: Row(
              children: [
                Text(
                  "Login or register to book \nyour appointments",
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              spacing: 10,
              children: [
                Row(
                  children: [
                    Text(
                      "Email",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),

                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0x40D9D9D9),
                    borderRadius: BorderRadius.circular(8.53),
                    border: Border.all(
                      color: const Color(0x1A000000),
                      width: 0.85,
                    ),
                  ),
                  child: TextField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 14,
                      ),
                      hintText: 'Enter your email',
                    ),
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              spacing: 10,
              children: [
                Row(
                  children: [
                    Text(
                      "Password",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),

                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0x40D9D9D9),
                    borderRadius: BorderRadius.circular(8.53),
                    border: Border.all(
                      color: const Color(0x1A000000),
                      width: 0.85,
                    ),
                  ),
                  child: TextField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 14,
                      ),
                      hintText: 'Enter password',
                    ),
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 84),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Button1(
              title: "Login",
              onTap: () {
                Get.to(() => Homescreen());
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [Privacypolicy(), SizedBox(height: 30)],
        ),
      ),
    );
  }
}
