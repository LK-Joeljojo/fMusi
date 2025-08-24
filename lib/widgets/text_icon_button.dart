
import 'package:flutter/material.dart';

import '../common/color.dart';

class TextIconButton extends StatelessWidget {
  final String text;
  final String icon;
  final VoidCallback? onTap;
  const TextIconButton({
    super.key,
    required this.text,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Image.asset(
            icon,
            width: 30,
            height: 30,
          ),
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.apply(color: JColor.whiteColor.withOpacity(0.5)),
          )
        ],
      ),
    );
  }
}
