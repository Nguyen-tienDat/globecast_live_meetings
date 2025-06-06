import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../models/meeting_model.dart';
import '../models/participant_model.dart';
import '../models/subtitle_model.dart';

class GcbMeetingService extends ChangeNotifier {
  List<GcbMeetingModel> _myMeetings = [];
  GcbMeetingModel? _currentMeeting;
  List<GcbParticipantModel> _participants = [];
  List<GcbSubtitleModel> _subtitles = [];
  bool _isMicOn = true;
  bool _isCameraOn = true;
  bool _isScreenSharing = false;
  bool _isHandRaised = false;
  bool _areSubtitlesVisible = true;
  bool _isLoading = false;
  String _localParticipantId = "";
  
  // Getters
  List<GcbMeetingModel> get myMeetings => _myMeetings;
  GcbMeetingModel? get currentMeeting => _currentMeeting;
  List<GcbParticipantModel> get participants => _participants;
  List<GcbSubtitleModel> get subtitles => _subtitles;
  bool get isMicOn => _isMicOn;
  bool get isCameraOn => _isCameraOn;
  bool get isScreenSharing => _isScreenSharing;
  bool get isHandRaised => _isHandRaised;
  bool get areSubtitlesVisible => _areSubtitlesVisible;
  bool get isLoading => _isLoading;
  String get localParticipantId => _localParticipantId;
  
  GcbMeetingService() {
    _loadMockData();
  }
  
  void _loadMockData() {
    // Generate a local participant ID
    _localParticipantId = const Uuid().v4();
    
    // Mock meeting data
    _myMeetings = [
      GcbMeetingModel(
        id: '1',
        code: 'GCM-123-456-789',
        topic: 'Weekly Team Standup',
        startTime: DateTime.now(),
        durationMinutes: 60,
        hostId: _localParticipantId,
        hostName: 'You',
        participantIds: ['1', '2', '3', '4'],
        isRecording: false,
        primaryLanguage: 'english',
        translationLanguages: ['spanish', 'french', 'german'],
        description: 'Weekly team meeting to discuss progress and roadblocks.',
      ),
      GcbMeetingModel(
        id: '2',
        code: 'GCM-987-654-321',
        topic: 'Project Kickoff',
        startTime: DateTime.now().add(const Duration(days: 1)),
        durationMinutes: 90,
        hostId: _localParticipantId,
        hostName: 'You',
        participantIds: ['1', '2', '5', '6'],
        isRecording: false,
        primaryLanguage: 'english',
        translationLanguages: ['chinese', 'japanese', 'korean'],
        description: 'Project kickoff meeting with international team members.',
      ),
    ];

    // Mock participants
    _participants = [
      GcbParticipantModel(
        id: _localParticipantId,
        name: 'You',
        isHost: true,
        isModerator: true,
        isMuted: !_isMicOn,
        isVideoOn: _isCameraOn,
        isScreenSharing: _isScreenSharing,
        isHandRaised: _isHandRaised,
        isSpeaking: false,
        avatarUrl: null,
      ),
      GcbParticipantModel(
        id: '1',
        name: 'Alex Chen',
        isHost: false,
        isModerator: false,
        isMuted: true,
        isVideoOn: true,
        isScreenSharing: false,
        isHandRaised: false,
        isSpeaking: false,
        avatarUrl: 'https://randomuser.me/api/portraits/men/32.jpg',
      ),
      GcbParticipantModel(
        id: '2',
        name: 'Sofia Rodriguez',
        isHost: false,
        isModerator: false,
        isMuted: false,
        isVideoOn: true,
        isScreenSharing: false,
        isHandRaised: false,
        isSpeaking: true,
        avatarUrl: 'https://randomuser.me/api/portraits/women/44.jpg',
      ),
      GcbParticipantModel(
        id: '3',
        name: 'Raj Patel',
        isHost: false,
        isModerator: false,
        isMuted: false,
        isVideoOn: false,
        isScreenSharing: false,
        isHandRaised: true,
        isSpeaking: false,
        avatarUrl: 'https://randomuser.me/api/portraits/men/22.jpg',
      ),
      GcbParticipantModel(
        id: '4',
        name: 'Emma Johnson',
        isHost: false,
        isModerator: false,
        isMuted: true,
        isVideoOn: false,
        isScreenSharing: false,
        isHandRaised: false,
        isSpeaking: false,
        avatarUrl: 'https://randomuser.me/api/portraits/women/33.jpg',
      ),
    ];

    // Mock subtitles
    _subtitles = [
      GcbSubtitleModel(
        id: '1',
        participantId: '2',
        participantName: 'Sofia Rodriguez',
        text: "I've completed the design for the new feature we discussed last week.",
        language: 'english',
        timestamp: DateTime.now().subtract(const Duration(seconds: 5)),
        duration: const Duration(seconds: 5),
      ),
    ];
  }

  // Create a new meeting
  Future<GcbMeetingModel> createMeeting({
    required String topic,
    required int durationMinutes,
    required DateTime startTime,
    required String primaryLanguage,
    required List<String> translationLanguages,
    String? description,
    String? password,
  }) async {
    _setLoading(true);

    try {
      // Generate a unique meeting ID and code
      final id = const Uuid().v4();
      final code = 'GCM-${id.substring(0, 3)}-${id.substring(3, 6)}-${id.substring(6, 9)}';
      
      final newMeeting = GcbMeetingModel(
        id: id,
        code: code,
        topic: topic,
        startTime: startTime,
        durationMinutes: durationMinutes,
        hostId: _localParticipantId,
        hostName: 'You',
        participantIds: [_localParticipantId],
        isRecording: false,
        primaryLanguage: primaryLanguage,
        translationLanguages: translationLanguages,
        description: description,
        password: password,
      );
      
      // In a real app, this would call an API
      // For now, just add to the list
      _myMeetings.add(newMeeting);
      notifyListeners();
      return newMeeting;
      
    } finally {
      _setLoading(false);
    }
  }
  
  // Join a meeting by code
  Future<bool> joinMeeting(String code, [String? password]) async {
    _setLoading(true);
    
    try {
      // In a real app, this would verify the code with an API
      final meeting = _myMeetings.firstWhere(
        (m) => m.code == code,
        orElse: () => _myMeetings.first, // For demo purposes, just join the first meeting
      );
      
      if (meeting.password != null && meeting.password != password) {
        return false;
      }
      
      _currentMeeting = meeting;
      notifyListeners();
      return true;
      
    } finally {
      _setLoading(false);
    }
  }
  
  // Leave the current meeting
  void leaveMeeting() {
    _currentMeeting = null;
    notifyListeners();
  }
  
  // Toggle microphone state
  void toggleMicrophone() {
    _isMicOn = !_isMicOn;
    
    // Update local participant
    final index = _participants.indexWhere((p) => p.id == _localParticipantId);
    if (index >= 0) {
      _participants[index] = _participants[index].copyWith(isMuted: !_isMicOn);
    }
    
    notifyListeners();
  }
  
  // Toggle camera state
  void toggleCamera() {
    _isCameraOn = !_isCameraOn;
    
    // Update local participant
    final index = _participants.indexWhere((p) => p.id == _localParticipantId);
    if (index >= 0) {
      _participants[index] = _participants[index].copyWith(isVideoOn: _isCameraOn);
    }
    
    notifyListeners();
  }
  
  // Toggle screen sharing state
  void toggleScreenSharing() {
    _isScreenSharing = !_isScreenSharing;
    
    // Update local participant
    final index = _participants.indexWhere((p) => p.id == _localParticipantId);
    if (index >= 0) {
      _participants[index] = _participants[index].copyWith(isScreenSharing: _isScreenSharing);
    }
    
    notifyListeners();
  }
  
  // Toggle hand raised state
  void toggleHandRaised() {
    _isHandRaised = !_isHandRaised;
    
    // Update local participant
    final index = _participants.indexWhere((p) => p.id == _localParticipantId);
    if (index >= 0) {
      _participants[index] = _participants[index].copyWith(isHandRaised: _isHandRaised);
    }
    
    notifyListeners();
  }
  
  // Toggle subtitles visibility
  void toggleSubtitlesVisibility() {
    _areSubtitlesVisible = !_areSubtitlesVisible;
    notifyListeners();
  }
  
  // Start or stop recording the meeting
  void toggleRecording() {
    if (_currentMeeting != null) {
      _currentMeeting = _currentMeeting!.copyWith(
        isRecording: !_currentMeeting!.isRecording);
      notifyListeners();
    }
  }

  // Set loading state
  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }
}