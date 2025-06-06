import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';

import '../../../theme/app_theme.dart';
import '../controller.dart';

class LanguageSelectionPanel extends StatelessWidget {
  const LanguageSelectionPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<MeetingController>();
    final l10n = AppLocalizations.of(context)!;
    
    return Container(
      decoration: BoxDecoration(
        color: GcbAppTheme.surface,
        border: Border(
          left: BorderSide(
            color: GcbAppTheme.surfaceLight,
            width: 1,
          ),
        ),
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: GcbAppTheme.surfaceLight,
              border: Border(
                bottom: BorderSide(
                  color: GcbAppTheme.surface,
                  width: 1,
                ),
              ),
            ),
            child: Row(
              children: [
                Text(
                  l10n.language,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
          
          // Language description
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Select the language you want to hear subtitles in:',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: GcbAppTheme.textSecondary,
              ),
            ),
          ),
          
          // Language options
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemCount: controller.availableLanguages.length,
              itemBuilder: (context, index) {
                final language = controller.availableLanguages[index];
                final isSelected = controller.selectedLanguage == language;
                final displayName = _getLanguageDisplayName(language, l10n);
                
                return ListTile(
                  title: Text(
                    displayName,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                    ),
                  ),
                  leading: _getLanguageFlag(language),
                  trailing: isSelected
                      ? Icon(
                          PhosphorIconsLight.check,
                          color: GcbAppTheme.primary,
                          size: 20,
                        )
                      : null,
                  onTap: () => controller.setSelectedLanguage(language),
                  tileColor: isSelected ? GcbAppTheme.primary.withOpacity(0.1) : null,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                )
                .animate()
                .fade(duration: const Duration(milliseconds: 300))
                .moveX(
                  begin: 20,
                  end: 0,
                  curve: Curves.easeOut,
                  duration: const Duration(milliseconds: 300),
                  delay: Duration(milliseconds: index * 50),
                );
              },
            ),
          ),
          
          // Note about subtitles
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: GcbAppTheme.info.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(
                  PhosphorIconsLight.info,
                  color: GcbAppTheme.info,
                  size: 20,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Subtitles are generated in real-time and may not be 100% accurate.',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: GcbAppTheme.info,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  String _getLanguageDisplayName(String code, AppLocalizations l10n) {
    switch (code) {
      case 'english': return l10n.english;
      case 'spanish': return l10n.spanish;
      case 'french': return l10n.french;
      case 'german': return l10n.german;
      case 'chinese': return l10n.chinese;
      case 'japanese': return l10n.japanese;
      case 'korean': return l10n.korean;
      case 'arabic': return l10n.arabic;
      case 'russian': return l10n.russian;
      default: return code.substring(0, 1).toUpperCase() + code.substring(1);
    }
  }
  
  Widget _getLanguageFlag(String code) {
    // Use emojis for flags
    String flagEmoji;
    switch (code) {
      case 'english': flagEmoji = '🇺🇸';
      break;
      case 'spanish': flagEmoji = '🇪🇸';
      break;
      case 'french': flagEmoji = '🇫🇷';
      break;
      case 'german': flagEmoji = '🇩🇪';
      break;
      case 'chinese': flagEmoji = '🇨🇳';
      break;
      case 'japanese': flagEmoji = '🇯🇵';
      break;
      case 'korean': flagEmoji = '🇰🇷';
      break;
      case 'arabic': flagEmoji = '🇸🇦';
      break;
      case 'russian': flagEmoji = '🇷🇺';
      break;
      default: flagEmoji = '🌐';
    }
    
    return SizedBox(
      width: 32,
      child: Center(
        child: Text(
          flagEmoji,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}