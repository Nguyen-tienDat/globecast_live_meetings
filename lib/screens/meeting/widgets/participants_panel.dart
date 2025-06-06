import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';

import '../../../theme/app_theme.dart';
import '../controller.dart';

class ParticipantsPanel extends StatelessWidget {
  const ParticipantsPanel({Key? key}) : super(key: key);

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${l10n.participants} (${controller.participants.length})',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    PhosphorIconsLight.dotsThreeOutline,
                    color: GcbAppTheme.textSecondary,
                  ),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(
                    minWidth: 32,
                    minHeight: 32,
                  ),
                ),
              ],
            ),
          ),
          
          // Participants list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: controller.participants.length,
              itemBuilder: (context, index) {
                final participant = controller.participants[index];
                return ListTile(
                  leading: CircleAvatar(
                    radius: 16,
                    backgroundColor: GcbAppTheme.surfaceLight,
                    backgroundImage: participant.avatarUrl != null
                      ? NetworkImage(participant.avatarUrl!)
                      : null,
                    child: participant.avatarUrl == null
                        ? Text(
                            participant.name.isNotEmpty ? participant.name[0].toUpperCase() : '?',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: GcbAppTheme.textPrimary,
                            ),
                          )
                        : null,
                  ),
                  title: Row(
                    children: [
                      Expanded(
                        child: Text(
                          participant.name,
                          style: Theme.of(context).textTheme.bodyLarge,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (participant.isHost)
                        Container(
                          margin: const EdgeInsets.only(left: 4),
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: GcbAppTheme.primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            'Host',
                            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: GcbAppTheme.primary,
                            ),
                          ),
                        ),
                    ],
                  ),
                  subtitle: Row(
                    children: [
                      if (participant.isSpeaking)
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              PhosphorIconsLight.suitcase,
                              color: GcbAppTheme.speaking,
                              size: 12,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Speaking',
                              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                color: GcbAppTheme.speaking,
                              ),
                            ),
                          ],
                        )
                      else if (participant.isMuted)
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              PhosphorIconsLight.microphoneSlash,
                              color: GcbAppTheme.muted,
                              size: 12,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Muted',
                              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                color: GcbAppTheme.muted,
                              ),
                            ),
                          ],
                        ),
                      if (participant.isHandRaised)
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                PhosphorIconsLight.hand,
                                color: GcbAppTheme.warning,
                                size: 12,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'Hand raised',
                                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                  color: GcbAppTheme.warning,
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      PhosphorIconsLight.dotsThree,
                      color: GcbAppTheme.textSecondary,
                    ),
                    onPressed: () => _showParticipantOptions(context, participant),
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
          
          // Invite button
          Container(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(
                PhosphorIconsLight.userPlus,
                size: 20,
                color: GcbAppTheme.textPrimary,
              ),
              label: Text(
                l10n.inviteParticipants,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: GcbAppTheme.textPrimary,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: GcbAppTheme.primary,
                foregroundColor: GcbAppTheme.textPrimary,
                padding: const EdgeInsets.symmetric(vertical: 12),
                minimumSize: const Size(double.infinity, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  void _showParticipantOptions(BuildContext context, dynamic participant) {
    final l10n = AppLocalizations.of(context)!;
    
    showModalBottomSheet(
      context: context,
      backgroundColor: GcbAppTheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: const Icon(PhosphorIconsRegular.megaphone),
                  title: Text(l10n.makeModerator),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(PhosphorIconsRegular.microphone),
                  title: Text(l10n.allowToUnmute),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(
                    PhosphorIconsRegular.prohibit,
                    color: GcbAppTheme.error,
                  ),
                  title: Text(
                    l10n.removeMember,
                    style: TextStyle(color: GcbAppTheme.error),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}