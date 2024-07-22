import 'package:flutter/material.dart';
import 'package:gaslocator/core/utils/media_query_values.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    required this.image,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      height: context.width / 2,
    );
  }
}
