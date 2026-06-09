import 'package:flutter/material.dart';

/// Wraps [child] in a Stack. When [isLoading] is true, a full-screen
/// semi-transparent overlay with a styled card + spinner is shown on top.
class AppModalHud extends StatelessWidget {
  const AppModalHud({
    super.key,
    required this.isLoading,
    required this.child,
    this.message,
    this.spinnerColor,
  });

  final bool isLoading;
  final Widget child;
  final String? message;
  final Color? spinnerColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading)
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.45),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 36,
                    vertical: 32,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.14),
                        blurRadius: 28,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 48,
                        height: 48,
                        child: CircularProgressIndicator(
                          color: spinnerColor ?? const Color(0xff8B7E7A),
                          strokeWidth: 3,
                        ),
                      ),
                      if (message != null) ...[
                        const SizedBox(height: 18),
                        Text(
                          message!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF2D2A2A),
                            decoration: TextDecoration.none,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Please wait…',
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFF847577),
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
