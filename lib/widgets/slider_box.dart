import 'package:flutter/material.dart';

class SliderBox extends StatefulWidget {
  const SliderBox({
    Key? key,
    required this.width,
    required this.height,
    required this.sliderActiveColor,
    required this.sliderInactiveColor,
    required this.minValue,
    required this.maxValue,
    required this.title,
    required this.unit,
    required this.onChanged,
  }) : super(key: key);

  final double width;
  final double height;
  final MaterialColor sliderActiveColor;
  final Color sliderInactiveColor;
  final double minValue;
  final double maxValue;
  final String title;
  final String unit;
  final ValueChanged<int> onChanged;

  @override
  State<SliderBox> createState() => _SliderBoxState();
}

class _SliderBoxState extends State<SliderBox> {
  late double slideValue;

  @override
  void initState() {
    slideValue = widget.minValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // title
          Text(
            widget.title.toUpperCase(),
            style: TextStyle(
              color: Colors.white.withOpacity(0.4),
              fontSize: 20.0,
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),

          // value
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${slideValue.floor()}',
                style: TextStyle(
                  color: widget.sliderActiveColor,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.unit,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.4),
                  fontSize: 24.0,
                  fontWeight: FontWeight.w300,
                ),
              )
            ],
          ),

          // slider
          Slider(
            activeColor: Colors.amber,
            inactiveColor: Colors.amber.shade100,
            min: widget.minValue,
            max: widget.maxValue,
            value: slideValue,
            onChanged: (value) {
              setState(() {
                slideValue = value;
                widget.onChanged(slideValue.floor());
              });
            },
          ),
        ],
      ),
    );
  }
}
