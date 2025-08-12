import 'package:flutter/material.dart';

class IconTextRow extends StatelessWidget {
  final String icon;
  final String title;
  final Color? color;
  final VoidCallback? onTap;
  final double paddingleft; 
  const IconTextRow({super.key, required this.icon, required this.title, this.onTap, this.color, this.paddingleft= 0});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 15,),
      leading: Image.asset(icon, width: 25,height: 25,color: color,),
      title: Padding(
        padding: EdgeInsets.only(left: paddingleft),
        child: Text(title, style: Theme.of(context).textTheme.titleSmall,),
      ),
      onTap: onTap,
    );
  }
}