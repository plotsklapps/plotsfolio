import 'package:flutter/material.dart';
import 'package:plotsfolio/utils/utils.dart';

class PhoneFrame extends StatelessWidget {
  const PhoneFrame({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Center(
        child: AspectRatio(
          aspectRatio: 9 / 16,
          child: Container(
            decoration: BoxDecoration(
              color: Utils.gunMetal,
              border: Border.all(
                color: Utils.gunMetal,
                width: 8,
              ),
              borderRadius: BorderRadius.circular(30), // Adjusted borderRadius
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Utils.gunMetal.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: const Offset(12, 12),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 24, bottom: 18),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
