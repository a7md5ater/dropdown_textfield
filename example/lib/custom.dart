import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';

class CustomDropDownTextField extends StatelessWidget {
  final List<DropDownValueModel> list;
  final SingleValueDropDownController controller;
  final String? hint;
  final void Function(dynamic)? onChanged;
  final Color? fillColor;
  final String? Function(String?)? validator;

  const CustomDropDownTextField({
    super.key,
    required this.list,
    required this.controller,
    this.hint,
    this.onChanged,
    this.fillColor,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return DropDownTextField(
      dropdownRadius: 8,
      dropDownItemCount: list.length,
      listPadding: ListPadding(bottom: 15, top: 15),
      clearOption: false,
      controller: controller,
      dropDownIconProperty: IconProperty(
        icon: Icons.keyboard_arrow_down,
        color: Colors.black,
        size: 30,
      ),
      textStyle: const TextStyle(color: Colors.black, fontSize: 16),
      listTextStyle: TextStyle(
        color: Colors.black.withOpacity(0.4),
        fontSize: 16,
      ),
      validator: validator,
      textFieldDecoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hint,
        hintStyle: TextStyle(
          color: Colors.black.withOpacity(0.4),
          fontSize: 16,
        ),
        contentPadding: const EdgeInsetsDirectional.only(
          top: 13,
          end: 13,
          start: 20,
        ),
        errorStyle: const TextStyle(
          color: Colors.red,
          fontSize: 16,
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
            borderSide: const BorderSide(color: Colors.white)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
            borderSide: const BorderSide(color: Colors.white)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
          borderSide: const BorderSide(color: Colors.white),
        ),
      ),
      onChanged: onChanged,
      dropDownList: list
          .map(
            (element) => DropDownValueModel(
              name: element.name,
              value: element.value,
            ),
          )
          .toList(),
    );
  }
}
