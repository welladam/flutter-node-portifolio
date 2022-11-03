import 'package:flutter/material.dart';
import 'package:flutter_portfolio/widgets/atoms/text.dart';

class CustomButton extends StatelessWidget {
  final Widget? child;
  final String? text;
  final Function()? onPressed;

  const CustomButton({
    super.key,
    this.child,
    this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 6,
        shadowColor: Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              padding: const EdgeInsets.all(10),
              minimumSize: Size.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              )),
          child: child ??
              CustomText(
                text?.toUpperCase() ?? '',
                type: TypographyType.button,
              ),
        ));
  }
}
