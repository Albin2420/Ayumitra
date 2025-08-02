import 'dart:developer';

import 'package:ayurmitra/src/presentation/widgets/button1.dart';
import 'package:ayurmitra/src/presentation/widgets/customdropDown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Registrationcontroller extends GetxController {
  @override
  void onInit() {
    log("Registrationcontroller()");
    super.onInit();
  }

  void addTreatmentInfo(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.white,
          child: Container(
            padding: const EdgeInsets.only(
              top: 40,
              left: 20,
              right: 20,
              bottom: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Treatments",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 8),
                CustomDropdown(
                  hintText: 'Choose prefered treatment',
                  items: [
                    'Couple Combo package',
                    'family 50 % off',
                    'special massage',
                  ],
                  selectedValue: 'Couple Combo package',
                  onChanged: (String? value) {
                    log("value:$value");
                  },
                ),
                SizedBox(height: 20),
                Text(
                  "Add Patients",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0x40D9D9D9),
                        border: Border.all(
                          color: const Color(0x40000000),
                          width: 0.85,
                        ),
                        borderRadius: BorderRadius.circular(8.53),
                      ),
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "Male",
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: SizedBox(
                            height: 40,
                            width: 40,
                            child: Image.asset("assets/icons/minus.png"),
                          ),
                        ),

                        Container(
                          width: 48,
                          height: 44,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(
                              color: const Color(0x4D000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(child: Text("1")),
                        ),

                        GestureDetector(
                          onTap: () {},
                          child: SizedBox(
                            height: 40,
                            width: 40,
                            child: Image.asset("assets/icons/plus.png"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0x40D9D9D9),
                        border: Border.all(
                          color: const Color(0x40000000),
                          width: 0.85,
                        ),
                        borderRadius: BorderRadius.circular(8.53),
                      ),
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "Female",
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: SizedBox(
                            height: 40,
                            width: 40,
                            child: Image.asset("assets/icons/minus.png"),
                          ),
                        ),

                        Container(
                          width: 48,
                          height: 44,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(
                              color: const Color(0x4D000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(child: Text("1")),
                        ),

                        GestureDetector(
                          onTap: () {},
                          child: SizedBox(
                            height: 40,
                            width: 40,
                            child: Image.asset("assets/icons/plus.png"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Button1(
                  title: 'Save',
                  onTap: () {
                    Get.back();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
