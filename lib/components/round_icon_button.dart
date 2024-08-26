import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData? icon;
  final VoidCallback? onPressed;

  const RoundIconButton({
    this.icon,
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 6,
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      // shape: CircleBorder(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      fillColor: const Color(0xFF4C4F5E),
      child: Icon(icon),
    );
  }
}
