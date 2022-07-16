import 'package:flutter/material.dart';

class GenderButton extends StatelessWidget {
  const GenderButton({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.onTab,
    required this.width,
    required this.height,
    required this.selected,
  }) : super(key: key);

  final IconData icon;
  final Color iconColor;
  final String title;
  final VoidCallback onTab;
  final double width;
  final double height;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: (selected) ? Colors.white.withOpacity(0.15) : Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Material(
        child: InkWell(
          onTap: () => onTab,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: iconColor,
                size: width * 0.4,
              ),
              Text(
                title.toUpperCase(),
                style: TextStyle(
                  color: Colors.white.withOpacity(0.4),
                  fontSize: 20.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
