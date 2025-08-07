import 'package:flutter/material.dart';
import 'package:fmusic/common/color.dart';

class TitleSection extends StatelessWidget {
  final String title;
  final bool hasViewAll;
  final String trailing;
  const TitleSection({
    super.key,
    required this.title, this.hasViewAll = false,  this.trailing = "",
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          if(hasViewAll)
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                trailing,
                style: Theme.of(context).textTheme.bodySmall?.apply(color: JColor.primayColor),
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
