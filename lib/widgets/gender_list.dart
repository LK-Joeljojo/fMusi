import 'package:flutter/material.dart';
import 'package:fmusic/common/color.dart';

class GenderList extends StatelessWidget {
  final Map objet;
  const GenderList({super.key, required this.objet});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          objet["image"],
          width: double.maxFinite,
          height: double.maxFinite,
          fit: BoxFit.cover,
        ),
        Container(
          width: double.maxFinite,
          height: double.maxFinite,
          alignment: AlignmentDirectional.center,
          color: JColor.blackColor.withOpacity(0.9),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(objet["name"],
                  style: Theme.of(context).textTheme.titleMedium?.apply(
                        color: JColor.whiteColor,
                      )),
                       Text(objet["songs"],
                  style: Theme.of(context).textTheme.bodySmall?.apply(
                        color: JColor.whiteColor.withOpacity(0.5),
                      )),
            ],
          ),
        )
      ],
    );
  }
}
