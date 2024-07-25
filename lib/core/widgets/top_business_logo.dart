import 'package:flutter/material.dart';

import '../utils/assets_manager.dart';

class TopBusinessLogo extends StatelessWidget {
  const TopBusinessLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      width: 170,
      height: 60,
      AppImages.topBusinessLogo,
    );
  }
}
