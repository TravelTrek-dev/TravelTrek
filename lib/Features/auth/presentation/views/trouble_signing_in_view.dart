import 'package:flutter/material.dart';
import 'package:travel_trek/Features/auth/presentation/views/forgot_password_view.dart';
import 'package:travel_trek/Features/auth/presentation/views/resend_verification_view.dart';

class TroubleSigningInView extends StatelessWidget {
  const TroubleSigningInView({super.key});
  static const routeName = 'TroubleSigningInView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFDFDFB),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon:
                    const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
                style: IconButton.styleFrom(
                  backgroundColor: const Color(0xFFF0ECEB),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 16),
              // Header row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'TravelTrek',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              // Lock icon
              Center(
                child: Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0ECEB),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.lock_reset_rounded,
                    size: 36,
                    color: Color(0xFF66595B),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Center(
                child: Text(
                  'Trouble Signing In?',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2D2926),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Don't worry, we're here to help. Choose an option below to regain access to your account.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF847577),
                      height: 1.55,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              // Forgot Password button
              _TroubleOption(
                icon: Icons.vpn_key_rounded,
                label: 'Forgot Password',
                isPrimary: true,
                onTap: () => Navigator.pushNamed(
                  context,
                  ForgotPasswordView.routeName,
                ),
              ),
              const SizedBox(height: 14),
              // Resend Verification button
              _TroubleOption(
                icon: Icons.mark_email_unread_outlined,
                label: 'Resend Verification Email',
                isPrimary: false,
                onTap: () => Navigator.pushNamed(
                  context,
                  ResendVerificationView.routeName,
                ),
              ),
              const Spacer(),
              // Contact support
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Still having trouble? Contact Support',
                    style: TextStyle(
                      color: Color(0xFF66595B),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}

class _TroubleOption extends StatelessWidget {
  const _TroubleOption({
    required this.icon,
    required this.label,
    required this.isPrimary,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool isPrimary;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: isPrimary
          ? ElevatedButton.icon(
              icon: Icon(icon, size: 18),
              label: Text(label),
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF66595B),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                elevation: 0,
                textStyle: const TextStyle(
                    fontSize: 15, fontWeight: FontWeight.w600),
              ),
            )
          : OutlinedButton.icon(
              icon: Icon(icon, size: 18, color: const Color(0xFF66595B)),
              label: Text(
                label,
                style: const TextStyle(color: Color(0xFF66595B)),
              ),
              onPressed: onTap,
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFF66595B), width: 1.4),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                textStyle: const TextStyle(
                    fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ),
    );
  }
}
