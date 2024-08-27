import 'package:flutter/material.dart';

import 'hex_color.dart';

class AppColors {
  static Color primary = HexColor('#002850');

  static Color blackblue = HexColor('#002040');

  static Color primaryText = HexColor('#292929');
  static Color secondPrimary = HexColor('#A5B4BE');
  static Color secondText = HexColor('#80869A');
  static Color dotsColor = HexColor('#F4E07D');
  static Color red = HexColor('#CE0001');
  static Color redLight = HexColor('#F5CCCC');
  static Color primaryHint = HexColor('#E2E2E2');
  static Color primaryButton = HexColor('#002850');
  static Color hint = Colors.grey;
  static Color blackLite = Colors.black54;
  static Color error = Colors.red;
  static Color success = Colors.green;
  static Color white = Colors.white;
  static Color black = Colors.black;
  static Color gray = Colors.grey;
  static Color grayLite = Colors.grey[700]!;
  static Color gray1 = HexColor('#C4C4C4');
  static Color gray2 = HexColor('#BABABB');
  // static Color gray6 = HexColor('#A7A7A7');
  // static Color gray7 = HexColor('#A0A1A0');

  static Color greenLight = HexColor('#35B82A');

  static Color blue3 = Color(0xff3646ff);
  static Color bink = HexColor('#FF9F9F');
  static Color purple1 = HexColor('#854AA4');
  static Color purple1light = HexColor('#E3D2FE');
  static Color blue = HexColor('#143A7B');
  static Color blue1 = HexColor('#CBDFF8');
  static Color blue2 = HexColor('#8290F8');
  static Color blue4 = Color(0xff3E3F68);
  static Color bluelight = HexColor('#D7EAF9');
  static Color orange = HexColor('#FE7C04');
  static Color orangelight = HexColor('#FFEAD7');
  static Color opacityWhite = Colors.white.withOpacity(0.5);
  static Color transparent = Colors.transparent;

  Color darken(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  Color lightens(String color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(HexColor(color));
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }
}
