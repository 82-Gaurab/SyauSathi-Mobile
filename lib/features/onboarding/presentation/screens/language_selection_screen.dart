import 'package:flutter/material.dart';

import 'package:syau_sewa_mobile/core/localization/generated/app_localizations.dart';

import '../widgets/language_option_tile.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  State<LanguageSelectionScreen> createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  static const Color backgroundColor = Color(0xFFFFFEFC);
  static const Color primaryColor = Color(0xFF24483A);
  static const Color buttonColor = Color(0xFFA71936);

  // Default selection: Nepali.
  String selectedLanguage = 'ne';

  bool get isNepali => selectedLanguage == 'ne';

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        bottom: false,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final illustrationHeight = (constraints.maxHeight * 0.365).clamp(
              190.0,
              310.0,
            );

            return Column(
              children: [
                // Top landscape illustration
                SizedBox(
                  height: illustrationHeight,
                  width: double.infinity,
                  child: Icon(Icons.image),
                ),

                // Language selection section
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(18, 16, 18, 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          localization.chooseLanguage,
                          style: const TextStyle(
                            color: primaryColor,
                            fontSize: 23,
                            fontWeight: FontWeight.w700,
                          ),
                        ),

                        const SizedBox(height: 3),

                        Text(
                          localization.chooseLanguageSubtitle,
                          style: const TextStyle(
                            color: Color(0xFF77766E),
                            fontSize: 11,
                          ),
                        ),

                        const SizedBox(height: 12),

                        // Nepali option
                        LanguageOptionTile(
                          title: localization.nepaliLanguage,
                          subtitle: localization.recommendedLanguage,
                          isSelected: isNepali,
                          onTap: () {
                            setState(() {
                              selectedLanguage = 'ne';
                            });
                          },
                        ),

                        const SizedBox(height: 9),

                        // English option
                        LanguageOptionTile(
                          title: localization.englishLanguage,
                          isSelected: !isNepali,
                          onTap: () {
                            setState(() {
                              selectedLanguage = 'en';
                            });
                          },
                        ),

                        const Spacer(),

                        // Continue button
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: ElevatedButton(
                            onPressed: () {
                              // Persistence and navigation will be added later.
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: buttonColor,
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(28),
                              ),
                            ),
                            child: Text(
                              isNepali
                                  ? localization.continueNepali
                                  : localization.continueEnglish,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
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
