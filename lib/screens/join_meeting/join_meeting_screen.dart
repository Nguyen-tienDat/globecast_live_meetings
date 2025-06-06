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
class JoinMeetingScreen extends StatelessWidget {
  const JoinMeetingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => JoinMeetingController(
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
    final controller = context.watch<JoinMeetingController>();
    final l10n = AppLocalizations.of(context)!;
    
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: GcbAppTheme.background,
        appBar: GcbAppBar(
          title: l10n.joinMeeting,
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Meeting code input
                  Text(
                    l10n.meetingCode,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: GcbAppTheme.textPrimary,
                    ),
                  )
                  .animate()
                  .fadeIn(),
                  
                  const Gap(8),
                  
                  TextField(
                    controller: controller.codeController,
                    decoration: InputDecoration(
                      hintText: l10n.enterMeetingCode,
                      prefixIcon: Icon(
                        PhosphorIconsLight.handTap,
                        color: GcbAppTheme.textSecondary,
                      ),
                    ),
                    style: Theme.of(context).textTheme.bodyLarge,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                  )
                  .animate()
                  .fadeIn(delay: const Duration(milliseconds: 100)),
                  
                  const Gap(24),
                  
                  // Password input (optional)
                  Text(
                    'Password (optional)',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: GcbAppTheme.textPrimary,
                    ),
                  )
                  .animate()
                  .fadeIn(delay: const Duration(milliseconds: 200)),
                  
                  const Gap(8),
                  
                  TextField(
                    controller: controller.passwordController,
                    decoration: InputDecoration(
                      hintText: 'Enter meeting password if required',
                      prefixIcon: Icon(
                        PhosphorIconsLight.lock,
                        color: GcbAppTheme.textSecondary,
                      ),
                    ),
                    style: Theme.of(context).textTheme.bodyLarge,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                  )
                  .animate()
                  .fadeIn(delay: const Duration(milliseconds: 300)),
                  
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
                  
                  // Join button
                  GcbPrimaryButton(
                    text: l10n.joinNow,
                    isLoading: controller.isLoading,
                    onPressed: () => controller.joinMeeting(context),
                  )
                  .animate()
                  .fadeIn(delay: const Duration(milliseconds: 400)),
                  
                  const Gap(16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}