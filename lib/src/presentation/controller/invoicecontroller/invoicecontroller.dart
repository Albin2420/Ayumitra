import 'dart:developer';
import 'dart:io';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:path_provider/path_provider.dart';

class InvoiceController extends GetxController {
  Future<void> generateInvoice() async {
    try {
      final pdf = pw.Document();

      final logo = await imageFromAssetBundle('assets/images/logo.png');
      final signature = await imageFromAssetBundle(
        "assets/images/signature.png",
      );

      pdf.addPage(
        pw.MultiPage(
          pageTheme: _buildTheme(logo),
          build: (context) => [
            _buildHeader(logo),
            pw.SizedBox(height: 20),
            pw.Divider(color: PdfColors.grey400, thickness: 0.5),
            pw.SizedBox(height: 20),
            _buildPatientDetails(),
            pw.SizedBox(height: 20),
            dottedDivider(),
            pw.SizedBox(height: 20),
            _buildTreatmentTable(),
            pw.SizedBox(height: 20),
            dottedDivider(),
            pw.SizedBox(height: 20),
            _buildTotals(),
            pw.SizedBox(height: 30),
            _buildFooter(signature),
          ],
        ),
      );

      final output = await getTemporaryDirectory();
      final filePath = "${output.path}/invoice.pdf";
      final file = File(filePath);

      if (await file.exists()) {
        await file.delete();
        log("Old invoice deleted.");
      }

      final pdfBytes = await pdf.save();
      await file.writeAsBytes(pdfBytes);
      log("New invoice saved at: $filePath");

      await Printing.layoutPdf(onLayout: (format) async => pdfBytes);
    } catch (e) {
      log("Error in generateInvoice(): $e");
    }
  }

  pw.PageTheme _buildTheme(pw.ImageProvider logo) {
    return pw.PageTheme(
      margin: const pw.EdgeInsets.all(20),
      buildBackground: (context) => pw.FullPage(
        ignoreMargins: true,
        child: pw.Opacity(
          opacity: 0.05,
          child: pw.Image(logo, fit: pw.BoxFit.cover),
        ),
      ),
    );
  }

  pw.Widget _buildHeader(pw.ImageProvider logo) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Image(logo, width: 70, height: 70),
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.end,
          children: [
            pw.Text(
              "KUMARAKOM",
              style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
            ),
            pw.SizedBox(height: 4),
            pw.Text(
              "Cheepunkal P.O, Kottayam, Kerala - 686563",
              style: pw.TextStyle(color: PdfColor.fromHex("#9A9A9A")),
            ),
            pw.SizedBox(height: 4),
            pw.Text(
              "e-mail: unknown@gmail.com",
              style: pw.TextStyle(color: PdfColor.fromHex("#9A9A9A")),
            ),
            pw.SizedBox(height: 4),
            pw.Text(
              "Mob: +91 9876543210 | +91 976543210",
              style: pw.TextStyle(color: PdfColor.fromHex("#9A9A9A")),
            ),
            pw.SizedBox(height: 4),
            pw.Text("GST No: 32AABCU9603R1ZW"),
          ],
        ),
      ],
    );
  }

  pw.Widget _buildPatientDetails() {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          "Patient Details",
          style: pw.TextStyle(
            fontSize: 14,
            fontWeight: pw.FontWeight.bold,
            color: PdfColors.green,
          ),
        ),
        pw.SizedBox(height: 10),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Table.fromTextArray(
              border: null,
              cellStyle: pw.TextStyle(fontSize: 10),
              headers: ['', ''],
              data: [
                ['Name', 'Salih T'],
                ['Address', 'Nadakkave, Kozhikode'],
                ['WhatsApp Number', '+91 987654321'],
              ],
            ),
            pw.Table.fromTextArray(
              border: null,
              cellStyle: pw.TextStyle(fontSize: 10),
              headers: ['', ''],
              data: [
                ['Booked On', '31/01/2024   |   12:12pm'],
                ['Treatment Date', '21/02/2024'],
                ['Treatment Time', '11:00 am'],
              ],
            ),
          ],
        ),
      ],
    );
  }

  pw.Widget dottedDivider({double space = 3, double height = 1}) {
    return pw.LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints!.maxWidth;
        final count = (width / (space * 2)).floor();
        return pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: List.generate(
            count,
            (_) => pw.Container(
              width: space,
              height: height,
              decoration: const pw.BoxDecoration(
                color: PdfColors.grey400,
                shape: pw.BoxShape.circle,
              ),
            ),
          ),
        );
      },
    );
  }

  pw.Widget _buildTreatmentTable() {
    return pw.Table.fromTextArray(
      headers: ['Treatment', 'Price', 'Male', 'Female', 'Total'],
      data: [
        ['Panchakarma', '230', '4', '4', '2,540'],
        ['Njavara Kizhi Treatment', '230', '4', '4', '2,540'],
        ['Panchakarma', '230', '4', '6', '2,540'],
      ],
      border: null,
      headerStyle: pw.TextStyle(
        fontWeight: pw.FontWeight.bold,
        color: PdfColors.green,
      ),
      cellHeight: 30,
      cellAlignments: {
        0: pw.Alignment.centerLeft,
        1: pw.Alignment.center,
        2: pw.Alignment.center,
        3: pw.Alignment.center,
        4: pw.Alignment.centerRight,
      },
    );
  }

  pw.Widget _buildTotals() {
    return pw.Padding(
      padding: pw.EdgeInsets.only(right: 8),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.end,
        children: [
          pw.Container(
            width: 150,
            child: pw.Column(
              children: [
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.end,
                  children: [
                    _buildTotalRow('Total Amount', '7,620', true),
                    pw.SizedBox(height: 8),
                    _buildTotalRow('Discount  \t', '500'),
                    pw.SizedBox(height: 8),
                    _buildTotalRow('Advance', '1,200'),
                    pw.SizedBox(height: 8),
                    pw.SizedBox(
                      width: double.infinity,
                      child: dottedDivider(), // stays inside
                    ),
                    pw.SizedBox(height: 8),
                    _buildTotalRow('Balance', '5,920', true),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  pw.Widget _buildTotalRow(String title, String value, [bool bold = false]) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.end,
      children: [
        pw.Text(
          title,
          style: pw.TextStyle(
            fontWeight: bold ? pw.FontWeight.bold : pw.FontWeight.normal,
          ),
        ),
        pw.SizedBox(width: 38),
        pw.Text(
          value,
          style: pw.TextStyle(
            fontWeight: bold ? pw.FontWeight.bold : pw.FontWeight.normal,
          ),
        ),
      ],
    );
  }

  pw.Widget _buildFooter(pw.ImageProvider signature) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.end,
      children: [
        pw.Column(
          children: [
            pw.Text(
              'Thank you for choosing us',
              textAlign: pw.TextAlign.end,
              style: pw.TextStyle(
                fontSize: 16,
                color: PdfColors.green,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
            pw.SizedBox(height: 8),
            pw.Text(
              "Your well-being is our commitment, and we're honored \nyou've entrusted us with your health journey",
              textAlign: pw.TextAlign.end,
              style: pw.TextStyle(
                fontSize: 9,
                color: PdfColor.fromHex("#00000036"),
              ),
            ),
            pw.SizedBox(height: 20),
            pw.Image(signature, width: 70, height: 70),
          ],
        ),
      ],
    );
  }
}
