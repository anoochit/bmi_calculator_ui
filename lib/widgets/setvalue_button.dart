import 'package:flutter/material.dart';

class SetValueButton extends StatefulWidget {
  SetValueButton({
    Key? key,
    required this.width,
    required this.height,
    required this.initValue,
    required this.onChanged,
    required this.title,
    this.unit,
    required this.activeColor,
    required this.inactiveColor,
  }) : super(key: key);

  final Color activeColor;
  final Color inactiveColor;
  final double width;
  final double height;
  final int initValue;
  final ValueChanged<int> onChanged;
  final String title;
  final String? unit;

  @override
  State<SetValueButton> createState() => _SetValueButtonState();
}

class _SetValueButtonState extends State<SetValueButton> {
  late int value;

  @override
  void initState() {
    value = widget.initValue;
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
          SizedBox(height: 8.0),

          // value
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${value}',
                style: TextStyle(
                  color: widget.activeColor,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              (widget.unit != null)
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Text(
                        widget.unit!.toLowerCase(),
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.4),
                          fontSize: 20.0,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    )
                  : Container()
            ],
          ),
          SizedBox(height: 4.0),

          // plus button, minus button
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipOval(
                child: Container(
                  color: widget.inactiveColor,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        (value > 0) ? value = (value - 1) : value = 0;
                        widget.onChanged(value);
                      });
                    },
                    icon: Icon(
                      Icons.remove,
                      color: widget.activeColor,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8.0),
              ClipOval(
                child: Container(
                  color: widget.inactiveColor,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        (value >= 0) ? value = (value + 1) : value = 0;
                        widget.onChanged(value);
                      });
                    },
                    icon: Icon(
                      Icons.add,
                      color: widget.activeColor,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
