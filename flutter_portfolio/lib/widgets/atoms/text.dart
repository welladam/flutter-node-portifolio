import 'package:flutter/material.dart';

enum TypographyType { h1, h2, h3, subtitle, button, labelSmall, body }

getTextStyleByType(BuildContext context, TypographyType type) {
  switch (type) {
    case TypographyType.h1:
      return Theme.of(context).textTheme.headlineLarge;
    case TypographyType.h2:
      return Theme.of(context).textTheme.headlineMedium;
    case TypographyType.h3:
      return Theme.of(context).textTheme.headlineSmall;
    case TypographyType.subtitle:
      return Theme.of(context).textTheme.titleMedium;
    case TypographyType.button:
      return Theme.of(context).textTheme.labelMedium;
    case TypographyType.labelSmall:
      return Theme.of(context).textTheme.labelSmall;
    default:
      return Theme.of(context).textTheme.bodyMedium;
  }
}

class CustomText extends Text {
  final TypographyType type;

  const CustomText(
    super.data, {
    this.type = TypographyType.body,
    super.key,
    super.textAlign,
    super.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(data ?? '',
        style: getTextStyleByType(context, type).merge(style),
        textAlign: textAlign);
  }
}
