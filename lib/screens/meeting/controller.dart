import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../models/participant_model.dart';
import '../../models/subtitle_model.dart';
import '../../router/app_router.dart';
import '../../services/meeting_service.dart';

class MeetingController extends ChangeNotifier {
  final GcbMeetingService _meetingService;
  Timer? _meetingTimer;
  Duration _elapsedTime = Duration.zero;
  String _selectedLanguage = 'english';
  bool _isChatVisible = false;
  bool _isParticipantsListVisible = false;
  bool _isLanguageMenuVisible = false;
  bool _isFullScreenMode = false;
  GcbParticipantModel? _focusedParticipant;
  
  MeetingController(this._meetingService) {
    initialize();
  }
  
  // Getters
  bool get isMicOn => _meetingService.isMicOn;
  bool get isCameraOn => _meetingService.isCameraOn;
  bool get isScreenSharing => _meetingService.isScreenSharing;
  bool get isHandRaised => _meetingService.isHandRaised;
  bool get areSubtitlesVisible => _meetingService.areSubtitlesVisible;
  bool get isRecording => _meetingService.currentMeeting?.isRecording ?? false;
  Duration get elapsedTime => _elapsedTime;
  String get selectedLanguage => _selectedLanguage;
  bool get isChatVisible => _isChatVisible;
  bool get isParticipantsListVisible => _isParticipantsListVisible;
  bool get isLanguageMenuVisible => _isLanguageMenuVisible;
  bool get isFullScreenMode => _isFullScreenMode;
  
  List<GcbParticipantModel> get participants => _meetingService.participants;
  List<GcbSubtitleModel> get subtitles => _meetingService.subtitles;
  String get meetingCode => _meetingService.currentMeeting?.code ?? '';
  String get meetingTopic => _meetingService.currentMeeting?.topic ?? '';
  GcbParticipantModel? get focusedParticipant => _focusedParticipant;
  List<String> get availableLanguages => 
    [_meetingService.currentMeeting?.primaryLanguage ?? 'english']
      ..addAll(_meetingService.currentMeeting?.translationLanguages ?? []);
  
  void initialize() {
    _selectedLanguage = _meetingService.currentMeeting?.primaryLanguage ?? 'english';
    _startMeetingTimer();
    
    // If someone is screen sharing, focus on them
    final screenSharingParticipant = participants.firstWhere(
      (p) => p.isScreenSharing,
      orElse: () => participants.first,
    );
    _focusedParticipant = screenSharingParticipant;
  }
  
  void _startMeetingTimer() {
    _meetingTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _elapsedTime = Duration(seconds: _elapsedTime.inSeconds + 1);
      notifyListeners();
    });
  }
  
  void toggleMicrophone() {
    _meetingService.toggleMicrophone();
    notifyListeners();
  }
  
  void toggleCamera() {
    _meetingService.toggleCamera();
    notifyListeners();
  }
  
  void toggleScreenSharing() {
    _meetingService.toggleScreenSharing();
    
    // When screen sharing is toggled, focus on the local participant
    if (_meetingService.isScreenSharing) {
      _focusedParticipant = participants.firstWhere(
        (p) => p.id == _meetingService.localParticipantId,
        orElse: () => participants.first,
      );
    } else {
      _focusedParticipant = null;
    }
    
    notifyListeners();
  }
  
  void toggleHandRaised() {
    _meetingService.toggleHandRaised();
    notifyListeners();
  }
  
  void toggleSubtitlesVisibility() {
    _meetingService.toggleSubtitlesVisibility();
    notifyListeners();
  }
  
  void toggleRecording() {
    _meetingService.toggleRecording();
    notifyListeners();
  }
  
  void toggleChat() {
    _isChatVisible = !_isChatVisible;
    
    // Close other panels if open
    if (_isChatVisible) {
      _isParticipantsListVisible = false;
      _isLanguageMenuVisible = false;
    }
    
    notifyListeners();
  }
  
  void toggleParticipantsList() {
    _isParticipantsListVisible = !_isParticipantsListVisible;
    
    // Close other panels if open
    if (_isParticipantsListVisible) {
      _isChatVisible = false;
      _isLanguageMenuVisible = false;
    }
    
    notifyListeners();
  }
  
  void toggleLanguageMenu() {
    _isLanguageMenuVisible = !_isLanguageMenuVisible;
    
    // Close other panels if open
    if (_isLanguageMenuVisible) {
      _isChatVisible = false;
      _isParticipantsListVisible = false;
    }
    
    notifyListeners();
  }
  
  void toggleFullScreenMode() {
    _isFullScreenMode = !_isFullScreenMode;
    notifyListeners();
  }
  
  void setSelectedLanguage(String language) {
    _selectedLanguage = language;
    _isLanguageMenuVisible = false;
    notifyListeners();
  }
  
  void setFocusedParticipant(GcbParticipantModel? participant) {
    _focusedParticipant = participant;
    notifyListeners();
  }
  
  void leaveMeeting(BuildContext context) {
    _meetingTimer?.cancel();
    _meetingService.leaveMeeting();
    context.router.replace(const HomeRoute());
  }
  
  void endMeeting(BuildContext context) {
    _meetingTimer?.cancel();
    _meetingService.leaveMeeting();
    context.router.replace(const HomeRoute());
  }
  
  @override
  void dispose() {
    _meetingTimer?.cancel();
    super.dispose();
  }
}