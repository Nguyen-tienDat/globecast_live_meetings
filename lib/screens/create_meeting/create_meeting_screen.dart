import 'package:auto_route/auto_route.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';

import '../../components/gcb_app_bar.dart';
import '../../components/gcb_primary_button.dart';
import '../../services/meeting_service.dart';
import '../../theme/app_theme.dart';
import 'controller.dart';

@RoutePage()
class CreateMeetingScreen extends StatelessWidget {
  const CreateMeetingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CreateMeetingController(
        context.read<GcbMeetingService>(),
      ),
      child: const _Content(),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<CreateMeetingController>();
    final l10n = AppLocalizations.of(context)!;
    
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: GcbAppTheme.background,
        appBar: GcbAppBar(
          title: l10n.createMeeting,
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Meeting topic input
                  Text(
                    l10n.meetingTopic,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: GcbAppTheme.textPrimary,
                    ),
                  ),
                  
                  const Gap(8),
                  
                  TextField(
                    controller: controller.topicController,
                    decoration: InputDecoration(
                      hintText: 'Enter meeting topic',
                      prefixIcon: Icon(
                        PhosphorIconsLight.textT,
                        color: GcbAppTheme.textSecondary,
                      ),
                    ),
                    style: Theme.of(context).textTheme.bodyLarge,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                  ),
                  
                  const Gap(24),
                  
                  // Meeting duration
                  Text(
                    l10n.meetingDuration,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: GcbAppTheme.textPrimary,
                    ),
                  ),
                  
                  const Gap(8),
                  
                  Container(
                    height: 48,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: GcbAppTheme.surfaceLight,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<int>(
                        value: controller.durationMinutes,
                        isExpanded: true,
                        dropdownColor: GcbAppTheme.surface,
                        style: Theme.of(context).textTheme.bodyLarge,
                        icon: Icon(
                          PhosphorIconsLight.caretDown,
                          color: GcbAppTheme.textSecondary,
                        ),
                        items: controller.durationOptions.map((int duration) {
                          return DropdownMenuItem<int>(
                            value: duration,
                            child: Text(
                              '$duration ${duration == 60 ? l10n.hour : l10n.minutes}',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          );
                        }).toList(),
                        onChanged: (int? value) {
                          if (value != null) {
                            controller.updateDuration(value);
                          }
                        },
                      ),
                    ),
                  ),
                  
                  const Gap(24),
                  
                  // Meeting language
                  Text(
                    l10n.speakingLanguage,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: GcbAppTheme.textPrimary,
                    ),
                  ),
                  
                  const Gap(8),
                  
                  Container(
                    height: 48,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: GcbAppTheme.surfaceLight,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: controller.primaryLanguage,
                        isExpanded: true,
                        dropdownColor: GcbAppTheme.surface,
                        style: Theme.of(context).textTheme.bodyLarge,
                        icon: Icon(
                          PhosphorIconsLight.caretDown,
                          color: GcbAppTheme.textSecondary,
                        ),
                        items: controller.languageOptions.map((String language) {
                          return DropdownMenuItem<String>(
                            value: language,
                            child: Text(
                              language.substring(0, 1).toUpperCase() + language.substring(1),
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          if (value != null) {
                            controller.updatePrimaryLanguage(value);
                          }
                        },
                      ),
                    ),
                  ),
                  
                  const Gap(24),
                  
                  // Translation languages
                  Text(
                    l10n.translationLanguages,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: GcbAppTheme.textPrimary,
                    ),
                  ),
                  
                  const Gap(8),
                  
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      ...controller.translationLanguages.map((language) {
                        return Chip(
                          label: Text(
                            language.substring(0, 1).toUpperCase() + language.substring(1),
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          deleteIcon: Icon(
                            PhosphorIconsLight.x,
                            size: 14,
                            color: GcbAppTheme.textPrimary,
                          ),
                          onDeleted: () => controller.removeTranslationLanguage(language),
                        );
                      }),
                      ActionChip(
                        label: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              PhosphorIconsLight.plus,
                              size: 14,
                              color: GcbAppTheme.primary,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              l10n.addLanguage,
                              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                color: GcbAppTheme.primary,
                              ),
                            ),
                          ],
                        ),
                        onPressed: () => _showLanguagePickerDialog(context, controller),
                      ),
                    ],
                  ),
                  
                  const Gap(24),
                  
                  // Password input (optional)
                  Text(
                    'Password (optional)',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: GcbAppTheme.textPrimary,
                    ),
                  ),
                  
                  const Gap(8),
                  
                  TextField(
                    controller: controller.passwordController,
                    decoration: InputDecoration(
                      hintText: 'Set meeting password',
                      prefixIcon: Icon(
                        PhosphorIconsLight.lock,
                        color: GcbAppTheme.textSecondary,
                      ),
                    ),
                    style: Theme.of(context).textTheme.bodyLarge,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                  ),
                  
                  // Error message
                  if (controller.errorMessage != null) ...[
                    const Gap(16),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: GcbAppTheme.error.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        controller.errorMessage!,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: GcbAppTheme.error,
                        ),
                      ),
                    ),
                  ],
                  
                  const Gap(48),
                  
                  // Create button
                  GcbPrimaryButton(
                    text: l10n.create,
                    isLoading: controller.isLoading,
                    onPressed: () => controller.createMeeting(context),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showLanguagePickerDialog(BuildContext context, CreateMeetingController controller) {
    final availableLanguages = controller.languageOptions.where(
      (lang) => lang != controller.primaryLanguage && !controller.translationLanguages.contains(lang)
    ).toList();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: GcbAppTheme.surface,
          title: Text(
            AppLocalizations.of(context)!.addLanguage,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: availableLanguages.length,
              itemBuilder: (context, index) {
                final language = availableLanguages[index];
                return ListTile(
                  title: Text(
                    language.substring(0, 1).toUpperCase() + language.substring(1),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  onTap: () {
                    controller.addTranslationLanguage(language);
                    Navigator.of(context).pop();
                  },
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                AppLocalizations.of(context)!.cancel,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: GcbAppTheme.primary,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}