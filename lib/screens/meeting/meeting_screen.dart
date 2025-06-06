import 'package:auto_route/auto_route.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';
import 'package:scabld_safe_area_insets/scabld_safe_area_insets.dart';

import '../../components/gcb_meeting_control_button.dart';
import '../../components/gcb_meeting_info_bar.dart';
import '../../components/gcb_participant_tile.dart';
import '../../components/gcb_subtitle_display.dart';
import '../../services/meeting_service.dart';
import '../../theme/app_theme.dart';
import 'controller.dart';
import 'widgets/chat_panel.dart';
import 'widgets/language_selection_panel.dart';
import 'widgets/participants_panel.dart';

@RoutePage()
class MeetingScreen extends StatelessWidget {
  final String code;
  
  const MeetingScreen({
    Key? key,
    @PathParam('code') required this.code,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MeetingController(
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
    final controller = context.watch<MeetingController>();
    final l10n = AppLocalizations.of(context)!;
    final safeAreaInsets = MediaQuery.of(context).padding;
    
    // Set system UI overlay style
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: GcbAppTheme.background,
      systemNavigationBarIconBrightness: Brightness.light,
    ));
    
    return WillPopScope(
      onWillPop: () async {
        _showLeaveMeetingDialog(context);
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          fit: StackFit.expand,
          children: [
            // Meeting content
            Column(
              children: [
                // Top info bar
                Padding(
                  padding: EdgeInsets.only(
                    top: safeAreaInsets.top,
                  ),
                  child: GcbMeetingInfoBar(
                    meetingCode: controller.meetingCode,
                    isRecording: controller.isRecording,
                    elapsedTime: controller.elapsedTime,
                    onCopyCode: () {
                      Clipboard.setData(ClipboardData(text: controller.meetingCode));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(l10n.linkCopied),
                          behavior: SnackBarBehavior.floating,
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    },
                  ),
                ),
                
                // Video grid
                Expanded(
                  child: _buildVideoGrid(context, controller),
                ),
                
                // Bottom meeting controls
                if (!controller.isFullScreenMode)
                  Container(
                    padding: EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: 16,
                      bottom: safeAreaInsets.bottom + 16,
                    ),
                    decoration: const BoxDecoration(
                      color: GcbAppTheme.background,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Recording indicator
                        if (controller.isRecording)
                          Container(
                            margin: const EdgeInsets.only(bottom: 16),
                            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                            decoration: BoxDecoration(
                              color: GcbAppTheme.recording.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  PhosphorIconsFill.record,
                                  color: GcbAppTheme.recording,
                                  size: 16,
                                ),
                                const Gap(8),
                                Text(
                                  l10n.meetingIsBeingRecorded,
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: GcbAppTheme.recording,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        
                        // Meeting controls
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // Mute/Unmute
                              GcbMeetingControlButton(
                                icon: controller.isMicOn 
                                    ? PhosphorIconsFill.microphone
                                    : PhosphorIconsFill.microphoneSlash,
                                label: controller.isMicOn ? l10n.mute : l10n.unmute,
                                onPressed: controller.toggleMicrophone,
                                isActive: controller.isMicOn,
                                inactiveColor: GcbAppTheme.muted,
                              ),
                              
                              const Gap(8),
                              
                              // Camera
                              GcbMeetingControlButton(
                                icon: controller.isCameraOn 
                                    ? PhosphorIconsFill.videoCamera
                                    : PhosphorIconsFill.videoCameraSlash,
                                label: controller.isCameraOn ? l10n.cameraOn : l10n.cameraOff,
                                onPressed: controller.toggleCamera,
                                isActive: controller.isCameraOn,
                                inactiveColor: GcbAppTheme.muted,
                              ),
                              
                              const Gap(8),
                              
                              // Screen share
                              GcbMeetingControlButton(
                                icon: PhosphorIconsFill.monitorPlay,
                                label: controller.isScreenSharing ? l10n.stopSharing : l10n.shareScreen,
                                onPressed: controller.toggleScreenSharing,
                                isActive: true,
                                isHighlighted: controller.isScreenSharing,
                              ),
                              
                              const Gap(8),
                              
                              // Chat
                              GcbMeetingControlButton(
                                icon: PhosphorIconsFill.chatText,
                                label: l10n.chat,
                                onPressed: controller.toggleChat,
                                isActive: true,
                                isHighlighted: controller.isChatVisible,
                              ),
                              
                              const Gap(8),
                              
                              // Participants
                              GcbMeetingControlButton(
                                icon: PhosphorIconsFill.users,
                                label: l10n.participants,
                                onPressed: controller.toggleParticipantsList,
                                isActive: true,
                                isHighlighted: controller.isParticipantsListVisible,
                              ),
                              
                              const Gap(8),
                              
                              // Hand raise
                              GcbMeetingControlButton(
                                icon: PhosphorIconsFill.hand,
                                label: controller.isHandRaised ? l10n.lowerHand : l10n.raiseHand,
                                onPressed: controller.toggleHandRaised,
                                isActive: true,
                                isHighlighted: controller.isHandRaised,
                              ),
                              
                              const Gap(8),
                              
                              // Subtitles
                              GcbMeetingControlButton(
                                icon: PhosphorIconsFill.option,
                                label: controller.areSubtitlesVisible ? l10n.hideSubtitles : l10n.showSubtitles,
                                onPressed: controller.toggleSubtitlesVisibility,
                                isActive: true,
                                isHighlighted: controller.areSubtitlesVisible,
                              ),
                              
                              const Gap(8),
                              
                              // Language
                              GcbMeetingControlButton(
                                icon: PhosphorIconsFill.translate,
                                label: l10n.language,
                                onPressed: controller.toggleLanguageMenu,
                                isActive: true,
                                isHighlighted: controller.isLanguageMenuVisible,
                              ),
                              
                              const Gap(8),
                              
                              // Record
                              GcbMeetingControlButton(
                                icon: PhosphorIconsFill.record,
                                label: controller.isRecording ? l10n.stopRecording : l10n.recordMeeting,
                                onPressed: controller.toggleRecording,
                                isActive: true,
                                isHighlighted: controller.isRecording,
                                activeColor: controller.isRecording ? GcbAppTheme.recording.withOpacity(0.2) : null,
                              ),
                              
                              const Gap(8),
                              
                              // End call
                              GcbMeetingControlButton(
                                icon: PhosphorIconsFill.phoneDisconnect,
                                label: l10n.leaveMeeting,
                                onPressed: () => _showLeaveMeetingDialog(context),
                                isActive: true,
                                activeColor: GcbAppTheme.error.withOpacity(0.2),
                                inactiveColor: GcbAppTheme.error,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
            
            // Subtitles overlay - positioned near the bottom of the screen
            if (controller.areSubtitlesVisible && !controller.isFullScreenMode && controller.subtitles.isNotEmpty)
              Positioned(
                left: 16,
                right: 16,
                bottom: 140 + safeAreaInsets.bottom,
                child: GcbSubtitleDisplay(
                  subtitles: controller.subtitles,
                  selectedLanguage: controller.selectedLanguage,
                ),
              ),
            
            // Side panels
            if (controller.isChatVisible)
              Positioned(
                top: safeAreaInsets.top + 56,
                right: 0,
                bottom: 140 + safeAreaInsets.bottom,
                width: MediaQuery.of(context).size.width * 0.3,
                child: const ChatPanel(),
              ),
              
            if (controller.isParticipantsListVisible)
              Positioned(
                top: safeAreaInsets.top + 56,
                right: 0,
                bottom: 140 + safeAreaInsets.bottom,
                width: MediaQuery.of(context).size.width * 0.3,
                child: const ParticipantsPanel(),
              ),
              
            if (controller.isLanguageMenuVisible)
              Positioned(
                top: safeAreaInsets.top + 56,
                right: 0,
                bottom: 140 + safeAreaInsets.bottom,
                width: MediaQuery.of(context).size.width * 0.3,
                child: const LanguageSelectionPanel(),
              ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildVideoGrid(BuildContext context, MeetingController controller) {
    final participants = controller.participants;
    
    // If we have a focused participant, show them in a large view
    if (controller.focusedParticipant != null) {
      final otherParticipants = participants
          .where((p) => p.id != controller.focusedParticipant!.id)
          .toList();
      
      return Column(
        children: [
          // Main focused view
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: GcbParticipantTile(
                participant: controller.focusedParticipant!,
                isScreenSharing: controller.focusedParticipant!.isScreenSharing,
                isLarge: true,
              ),
            ),
          ),
          
          // Bottom row of other participants
          if (otherParticipants.isNotEmpty)
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(4),
                itemCount: otherParticipants.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 4),
                    width: 160,
                    child: GcbParticipantTile(
                      participant: otherParticipants[index],
                    ),
                  );
                },
              ),
            ),
        ],
      );
    }
    
    // Grid view of participants when no one is focused
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _getCrossAxisCount(participants.length),
        childAspectRatio: 4/3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: participants.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => controller.setFocusedParticipant(participants[index]),
          child: GcbParticipantTile(
            participant: participants[index],
            isScreenSharing: participants[index].isScreenSharing,
          ),
        );
      },
    );
  }
  
  int _getCrossAxisCount(int participantsCount) {
    if (participantsCount <= 1) return 1;
    if (participantsCount <= 4) return 2;
    return 3;
  }
  
  void _showLeaveMeetingDialog(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final controller = Provider.of<MeetingController>(context, listen: false);
    
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          backgroundColor: GcbAppTheme.surface,
          title: Text(
            l10n.leaveMeeting,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          content: Text(
            'Are you sure you want to leave this meeting?',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                l10n.cancel,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: GcbAppTheme.primary,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                controller.leaveMeeting(context);
              },
              child: Text(
                l10n.leaveMeeting,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: GcbAppTheme.error,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}