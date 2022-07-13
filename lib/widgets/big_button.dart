import 'package:flutter/material.dart';

class BigButton extends StatelessWidget {
  const BigButton({
    Key? key,
    required this.width,
    required this.height,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  final double width;
  final double height;
  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          onPressed: () {},
          child: Text(
            text.toUpperCase(),
            style: const TextStyle(fontSize: 22),
          ),
        ),
      ),
    );
  }
}
