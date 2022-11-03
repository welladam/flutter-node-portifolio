import 'package:flutter/material.dart';
import 'package:flutter_portfolio/theme/color.dart';
import 'package:flutter_portfolio/widgets/atoms/button.dart';

class CustomInput extends StatelessWidget {
  final Function()? onButtonPressed;
  final String? hintText;
  const CustomInput({super.key, this.onButtonPressed, this.hintText});

  final outlineInputBorder = const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
      borderRadius: BorderRadius.all(Radius.circular(16)));

  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 15,
        shadowColor: Theme.of(context).shadowColor,
        borderRadius: BorderRadius.circular(16),
        child: TextField(
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: outlineInputBorder,
              enabledBorder: outlineInputBorder,
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: primaryColor),
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              hintText: hintText,
              hintStyle: TextStyle(color: Theme.of(context).hintColor),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
              suffixIcon: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                  child: CustomButton(
                    onPressed: onButtonPressed,
                    child: const Icon(
                      Icons.search,
                      size: 26,
                    ),
                  ))),
        ));
  }
}
