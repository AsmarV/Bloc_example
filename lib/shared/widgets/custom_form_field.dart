
import 'package:flutter/material.dart';

import '../../core/utils/responsive.dart';
import '../../app.dart';



class CustomFormField extends StatelessWidget {
  const CustomFormField(
      {super.key,
      required this.hint,
      this.isEnable,
      required this.controller,
      this.inputType,
      this.iconData,
      this.isRequired, this.isPassword});

  final String hint;
  final TextEditingController controller;

  final bool? isEnable;
  final bool? isRequired;
  final bool? isPassword;
  final TextInputType? inputType;
  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword??false,
      enabled: isEnable ?? true,
      keyboardType: inputType ?? TextInputType.text,
      style: TextStyle(color: primeColor, fontSize: font(0.35)),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(sized16()/1.2),
        label: Text(
          hint,
          style: const TextStyle(color: primeColor),
        ),
        hintText: hint,
        hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: font(0.3)),
        prefixIcon: iconData != null
            ? Icon(
                iconData,
                color: primeColor,
                size: font(0.4),
              )
            : null,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: shadePrimeColor,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: primeColor,
            )),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: shadePrimeColor,
            )),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: primeColor,
            ))
      ),
      validator: (String? val) {

        if (isRequired ?? false) {
          if (val != null && val.isEmpty) {
            return 'Please fill $hint';
          }
        }

        return null;
      },
    );
  }
}
