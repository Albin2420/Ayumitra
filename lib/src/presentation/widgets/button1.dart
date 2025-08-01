import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button1 extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const Button1({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(left: 9, right: 9, top: 12, bottom: 12),
        decoration: BoxDecoration(
          color: Color(0xff006837),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
