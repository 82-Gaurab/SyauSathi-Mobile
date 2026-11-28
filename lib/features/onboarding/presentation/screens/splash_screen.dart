import 'dart:async';

import 'package:flutter/material.dart';

import 'package:syau_sewa_mobile/core/localization/generated/app_localizations.dart';
import 'package:syau_sewa_mobile/features/onboarding/presentation/screens/language_selection_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const Color backgroundColor = Color(0xFF1E3B2F);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _navigate() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => LanguageSelectionScreen()),
    );
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), _navigate);
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: SplashScreen.backgroundColor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final screenHeight = constraints.maxHeight;

            return Stack(
              children: [
                // Bottom mountain illustration.
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  height: screenHeight * 0.29,
                  child: const SplashLandscapePlaceholder(),
                ),

                // Main logo and application information.
                Positioned(
                  left: 16,
                  right: 16,
                  top: screenHeight * 0.25,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SplashLogoPlaceholder(),

                      const SizedBox(height: 14),

                      Text(
                        localization.appName,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          height: 1.3,
                        ),
                      ),

                      const SizedBox(height: 12),

                      Text(
                        localization.appTagline,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xFFD8D6C3),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

                // Branding at the bottom.
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 16,
                  child: Text(
                    localization.poweredBy,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFFD8D6C3),
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class SplashLogoPlaceholder extends StatelessWidget {
  const SplashLogoPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 88,
      height: 88,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFFF5F0DC),
        border: Border.all(color: const Color(0xFFD5A33B), width: 2),
      ),
      child: const Center(
        // Replace this icon with your actual logo image.
        child: Icon(Icons.image_outlined, size: 38, color: Color(0xFF1E3B2F)),

        // Later:
        // child: Image.asset(
        //   'assets/images/app_logo.png',
        //   width: 65,
        //   height: 65,
        // ),
      ),
    );
  }
}

class SplashLandscapePlaceholder extends StatelessWidget {
  const SplashLandscapePlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Background landscape color.
          Container(color: const Color(0xFF294C3D)),

          // Placeholder for mountain illustration.
          const Center(
            child: Icon(
              Icons.image_outlined,
              size: 45,
              color: Color(0xFFB8C6AE),
            ),

            // Later replace with:
            // Image.asset(
            //   'assets/images/splash_mountains.png',
            //   fit: BoxFit.cover,
            // ),
          ),

          // Bottom foreground landscape.
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 45,
              decoration: const BoxDecoration(
                color: Color(0xFF4F6B43),
                borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
