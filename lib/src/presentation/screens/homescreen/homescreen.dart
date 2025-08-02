import 'dart:developer';

import 'package:ayurmitra/src/presentation/screens/registrationscreen/registrationscreen.dart';
import 'package:ayurmitra/src/presentation/widgets/bookingCard.dart';
import 'package:ayurmitra/src/presentation/widgets/button1.dart';
import 'package:ayurmitra/src/presentation/widgets/searchButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 64, bottom: 20),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1, color: Color(0x33000000)),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 28,
                          width: 28,
                          child: Image.asset("assets/icons/back.png"),
                        ),
                        SizedBox(
                          height: 28,
                          width: 28,
                          child: Image.asset("assets/icons/noti.png"),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 40,
                            child: TextField(
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 8,
                                ),
                                prefixIcon: SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: Image.asset(
                                    "assets/icons/search.png",
                                    scale: 3,
                                  ),
                                ),
                                hintText: "Search for treatments",
                                hintStyle: GoogleFonts.poppins(
                                  color: const Color(0x4D000000),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide: const BorderSide(
                                    color: Color(0x4D000000),
                                    width: 1,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    color: Color(0x4D000000),
                                    width: 1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Searchbutton(
                          onTap: () {
                            log("message");
                          },
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 28),

                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Sort by :",
                          style: GoogleFonts.poppins(
                            color: const Color(0xff404040),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        Container(
                          width: 169,
                          height: 39,
                          padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(1), // opacity
                            borderRadius: BorderRadius.circular(33),
                            border: Border.all(
                              color: const Color(0x4D000000), // #0000004D
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Date",
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                                width: 20,
                                child: Image.asset(
                                  scale: 3,
                                  "assets/icons/down.png",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            //body
            SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Bookingcard(),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Bookingcard(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Button1(
              title: 'Register Now',
              onTap: () {
                Get.to(() => Registrationscreen());
              },
            ),
          ),
        ],
      ),
    );
  }
}
