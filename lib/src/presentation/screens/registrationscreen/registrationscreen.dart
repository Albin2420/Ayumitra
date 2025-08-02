import 'dart:developer';

import 'package:ayurmitra/src/presentation/controller/invoicecontroller/invoicecontroller.dart';
import 'package:ayurmitra/src/presentation/controller/registrationcontroller/registrationcontroller.dart';
import 'package:ayurmitra/src/presentation/widgets/button1.dart';
import 'package:ayurmitra/src/presentation/widgets/customTextField.dart';
import 'package:ayurmitra/src/presentation/widgets/customdatePicker.dart';
import 'package:ayurmitra/src/presentation/widgets/customdropDown.dart';
import 'package:ayurmitra/src/presentation/widgets/hourdropdown.dart';
import 'package:ayurmitra/src/presentation/widgets/minutedropdown.dart'
    show MinuteDropdown;
import 'package:ayurmitra/src/presentation/widgets/paymentopt.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Registrationscreen extends StatelessWidget {
  const Registrationscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(Registrationcontroller());
    final invoiceCtrl = Get.put(InvoiceController());
    final TextEditingController textController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
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
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: SizedBox(
                            height: 28,
                            width: 28,
                            child: Image.asset("assets/icons/back.png"),
                          ),
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
                    padding: const EdgeInsets.only(left: 34),
                    child: Row(
                      children: [
                        Text(
                          "Register",
                          style: GoogleFonts.poppins(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 30),

            //body of form
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                spacing: 6,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Customtextfield(
                    controller: textController,
                    hintText: 'Enter your full name',
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                spacing: 6,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Enter your Whatsapp number",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Customtextfield(
                    controller: textController,
                    hintText: 'Enter your Whatsapp number',
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                spacing: 6,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Address",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Customtextfield(
                    controller: textController,
                    hintText: 'Enter your full address',
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                spacing: 6,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Location",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  CustomDropdown(
                    hintText: 'Choose your location',
                    items: ["Arpookara", "villoonni", "kottayam", "Eranakulam"],
                    selectedValue: 'Eranakulam',
                    onChanged: (String? value) {
                      log("value:$value");
                    },
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                spacing: 6,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Branch",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  CustomDropdown(
                    hintText: 'Select the branch',
                    items: ["Arpookara", "villoonni", "kottayam", "Eranakulam"],
                    selectedValue: 'Eranakulam',
                    onChanged: (String? value) {
                      log("value:$value");
                    },
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Treatments",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Button1(
                    title: '+ Add Treatments',
                    onTap: () {
                      ctrl.addTreatmentInfo(context);
                    },
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                spacing: 6,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total Amount",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Customtextfield(controller: textController, hintText: ''),
                ],
              ),
            ),

            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                spacing: 6,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Discount Amount",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Customtextfield(controller: textController, hintText: ''),
                ],
              ),
            ),

            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                spacing: 6,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Payment Option",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  RadioButtonRowExample(
                    onOptionSelected: (int value) {
                      log("value:$value");
                    },
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                spacing: 6,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Advance Amount",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Customtextfield(controller: textController, hintText: ''),
                ],
              ),
            ),

            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                spacing: 6,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Balance Amount",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Customtextfield(controller: textController, hintText: ''),
                ],
              ),
            ),

            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                spacing: 6,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Treatment Date",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  CustomDatepicker(
                    onDateChanged: (value) {
                      log("date:$value");
                    },
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                spacing: 6,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Treatment Time",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    spacing: 4,
                    children: [
                      Expanded(
                        child: HourDropdown(
                          onChanged: (String? value) {
                            log("hr:$value");
                          },
                        ),
                      ),

                      Expanded(
                        child: MinuteDropdown(
                          onChanged: (String? value) {
                            log("min:$value");
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Button1(
              title: 'Save',
              onTap: () {
                invoiceCtrl.generateInvoice();
              },
            ),
          ),
        ],
      ),
    );
  }
}
