import 'package:flutter/material.dart';
import '../../../shared/core/utils/app_colors..dart';
import '../../../shared/core/utils/app_text_style.dart';

typedef Validator = String? Function(String?);

class CustomTextFormFieldWidget extends StatefulWidget {
  TextInputType keyboardType;

  TextEditingController controller;
  Validator myValidator;
  void Function(String)? onChanged;

  CustomTextFormFieldWidget({
    this.keyboardType = TextInputType.text,
    required this.controller,
    required this.myValidator,
    required this.onChanged,
  });

  @override
  State<CustomTextFormFieldWidget> createState() =>
      _CustomTextFormFieldWidgetState();
}

class _CustomTextFormFieldWidgetState extends State<CustomTextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: AppColors.primary,
      ),
      onChanged: widget.onChanged,
      cursorColor: AppColors.blueColor,
      decoration: InputDecoration(
        // fillColor: AppColors.mobileSearchColor,
        // filled: true,
        hintText: "What do you Search for?",

        hintStyle: AppTextStyle.textStyle16.copyWith(
          color: Colors.grey.shade500,
        ),

        prefixIcon: const IconButton(
          onPressed: null,
          icon: Icon(Icons.search ,color: AppColors.primary,),
        ),
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        enabledBorder: _outLineInputBorder(color: AppColors.primary),
        focusedBorder: _outLineInputBorder(color: AppColors.primary),
        errorBorder: _outLineInputBorder(color: AppColors.redColor),
      ),
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      validator: widget.myValidator,
    );
  }

  OutlineInputBorder _outLineInputBorder({required Color color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(100),
      borderSide: BorderSide(
        width: 1.5,
        color: color,
      ),
    );
  }
}