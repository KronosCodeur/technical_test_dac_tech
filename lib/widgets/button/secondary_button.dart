import 'package:flutter/material.dart';
import 'package:technical_test_dac_tech/themes/app_color_light.dart';

class SecondaryButton extends StatefulWidget {
  const SecondaryButton(
      {super.key,
      required this.elevation,
      required this.width,
      required this.height,
      required this.child,
      required this.radius,
      required this.onPressed,
      required this.borderWidth,
      required this.borderColor});
  final double elevation;
  final double width;
  final double height;
  final Widget child;
  final double borderWidth;
  final Color borderColor;
  final VoidCallback onPressed;
  final BorderRadius radius;

  @override
  State<SecondaryButton> createState() => _SecondaryButtonState();
}

class _SecondaryButtonState extends State<SecondaryButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Material(
        elevation: widget.elevation,
        borderRadius: widget.radius,
        color: Colors.transparent,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: widget.radius,
            border: Border.all(
                color: widget.borderColor, width: widget.borderWidth),
            color: AppColor.white,
          ),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          width: widget.width,
          height: widget.height,
          child: widget.child,
        ),
      ),
    );
  }
}
