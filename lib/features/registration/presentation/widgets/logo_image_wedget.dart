import 'package:flutter/material.dart';
import 'package:gaslocator/core/utils/media_query_values.dart';

import '../../../../core/utils/assets_manager.dart';

class LogoImageWidget extends StatelessWidget {
  const LogoImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImgAssets.logo,
      height: context.width / 2,
    );
  }
}
