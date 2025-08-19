import 'package:flutter/material.dart';
import '../common/color.dart';

class ButtonIconText extends StatelessWidget {
  final bool hasborder;
  final String imageUrl;
  final String text;
   const ButtonIconText({
    super.key,
     this.hasborder = true, required this.imageUrl, required this.text
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 30,
        padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
        decoration: BoxDecoration(
          color: hasborder?Colors.transparent : JColor.primayColor,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: hasborder?JColor.whiteColor : Colors.transparent
          )
        ),
        child: Center(
          child: Row(
            children: [
              Image.asset(imageUrl,width: 15,height: 15,color: JColor.whiteColor,),
              Text(
                  text,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.apply(
                          color: JColor.whiteColor
                              .withOpacity(0.9)),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
