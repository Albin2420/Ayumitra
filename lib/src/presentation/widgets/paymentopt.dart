import 'package:ayurmitra/src/presentation/controller/paymentcontroller(radiobtn)/paymentcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RadioButtonRowExample extends StatelessWidget {
  final ValueChanged<int> onOptionSelected;

  RadioButtonRowExample({super.key, required this.onOptionSelected});

  final PaymentController controller = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Radio<int>(
                value: 1,
                groupValue: controller.selectedOption.value,
                onChanged: (value) {
                  controller.setSelectedOption(value!);
                  onOptionSelected(value);
                },
              ),
              const Text('Cash'),
            ],
          ),

          Row(
            children: [
              Radio<int>(
                value: 2,
                groupValue: controller.selectedOption.value,
                onChanged: (value) {
                  controller.setSelectedOption(value!);
                  onOptionSelected(value);
                },
              ),
              const Text('Card'),
            ],
          ),

          Row(
            children: [
              Radio<int>(
                value: 3,
                groupValue: controller.selectedOption.value,
                onChanged: (value) {
                  controller.setSelectedOption(value!);
                  onOptionSelected(value);
                },
              ),
              const Text('UPI'),
            ],
          ),
        ],
      ),
    );
  }
}
