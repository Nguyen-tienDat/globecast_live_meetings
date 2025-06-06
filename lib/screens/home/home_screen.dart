import 'package:auto_route/auto_route.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';

import '../../components/gcb_primary_button.dart';
import '../../components/gcb_secondary_button.dart';
import '../../router/app_router.dart';
import '../../services/meeting_service.dart';
import '../../theme/app_theme.dart';
import 'controller.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeController(
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
    final controller = context.watch<HomeController>();
    final l10n = AppLocalizations.of(context)!;
    
    return Scaffold(
      backgroundColor: GcbAppTheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Gap(32),
              // App logo and title
              Center(
                child: Column(
                  children: [
                    Icon(
                      PhosphorIconsFill.globeHemisphereEast,
                      size: 64,
                      color: GcbAppTheme.primary,
                    ),
                    const Gap(16),
                    Text(
                      l10n.appName,
                      style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        color: GcbAppTheme.textPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Gap(8),
                    Text(
                      l10n.welcomeToGlobeCast,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: GcbAppTheme.textSecondary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )
              .animate()
              .fadeIn(duration: const Duration(milliseconds: 600))
              .move(begin: const Offset(0, 20), curve: Curves.easeOutQuad),
              
              const Gap(48),
              
              // Action buttons
              GcbPrimaryButton(
                text: l10n.joinMeeting,
                icon: PhosphorIconsRegular.userPlus,
                onPressed: () => context.router.push(const JoinMeetingRoute()),
              )
              .animate()
              .fadeIn(delay: const Duration(milliseconds: 200))
              .move(begin: const Offset(0, 20), curve: Curves.easeOutQuad),
              
              const Gap(16),
              
              GcbPrimaryButton(
                text: l10n.createMeeting,
                icon: PhosphorIconsRegular.videoCamera,
                onPressed: () => context.router.push(const CreateMeetingRoute()),
              )
              .animate()
              .fadeIn(delay: const Duration(milliseconds: 300))
              .move(begin: const Offset(0, 20), curve: Curves.easeOutQuad),
              
              const Gap(16),
              
              GcbSecondaryButton(
                text: l10n.scheduleMeeting,
                icon: PhosphorIconsRegular.calendar,
                onPressed: () {},
              )
              .animate()
              .fadeIn(delay: const Duration(milliseconds: 400))
              .move(begin: const Offset(0, 20), curve: Curves.easeOutQuad),
              
              if (controller.myMeetings.isNotEmpty) ...[
                const Gap(48),
                
                // Recent meetings
                Text(
                  l10n.myMeetings,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: GcbAppTheme.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                )
                .animate()
                .fadeIn(delay: const Duration(milliseconds: 500)),
                
                const Gap(16),
                
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.myMeetings.length,
                    itemBuilder: (context, index) {
                      final meeting = controller.myMeetings[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          leading: Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: GcbAppTheme.primary.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Icon(
                                PhosphorIconsFill.videoCamera,
                                color: GcbAppTheme.primary,
                                size: 24,
                              ),
                            ),
                          ),
                          title: Text(
                            meeting.topic,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          subtitle: Text(
                            meeting.code,
                            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                              color: GcbAppTheme.textSecondary,
                            ),
                          ),
                          trailing: OutlinedButton(
                            onPressed: () {
                              context.read<GcbMeetingService>().joinMeeting(meeting.code);
                              context.router.push(MeetingRoute(code: meeting.code));
                            },
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                              minimumSize: const Size(80, 36),
                              side: const BorderSide(color: GcbAppTheme.primary),
                            ),
                            child: Text(l10n.joinNow),
                          ),
                        ),
                      )
                      .animate()
                      .fadeIn(delay: Duration(milliseconds: 600 + (index * 100)))
                      .move(begin: const Offset(0, 20), curve: Curves.easeOutQuad);
                    },
                  ),
                ),
              ] else ...[
                const Expanded(child: SizedBox()),
              ],
            ],
          ),
        ),
      ),
    );
  }
}