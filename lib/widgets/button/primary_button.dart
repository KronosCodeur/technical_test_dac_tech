import 'package:flutter/material.dart';

class PrimaryButton extends StatefulWidget {
  const PrimaryButton(
      {super.key,
      required this.elevation,
      required this.width,
      required this.height,
      required this.child,
      required this.radius,
      required this.onPressed,
      required this.color});
  final double elevation;
  final double width;
  final double height;
  final Widget child;
  final VoidCallback onPressed;
  final BorderRadius radius;
  final Color color;

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
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
            color: widget.color,
          ),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: widget.child,
          width: widget.width,
          height: widget.height,
        ),
      ),
    );
  }
}
