import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../theme/app_theme.dart';

class ChatPanel extends StatefulWidget {
  const ChatPanel({Key? key}) : super(key: key);

  @override
  State<ChatPanel> createState() => _ChatPanelState();
}

class _ChatPanelState extends State<ChatPanel> {
  final TextEditingController _messageController = TextEditingController();
  final List<_ChatMessage> _messages = [
    _ChatMessage(
      senderId: '1',
      senderName: 'Alex Chen',
      text: 'Hello everyone! Let\'s start the meeting.',
      timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
      isMe: false,
    ),
    _ChatMessage(
      senderId: '2',
      senderName: 'Sofia Rodriguez',
      text: 'I have some updates about the project progress.',
      timestamp: DateTime.now().subtract(const Duration(minutes: 3)),
      isMe: false,
    ),
    _ChatMessage(
      senderId: 'local',
      senderName: 'You',
      text: 'Great! Let\'s hear it.',
      timestamp: DateTime.now().subtract(const Duration(minutes: 2)),
      isMe: true,
    ),
  ];
  
  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          // Chat header
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
                  l10n.chat,
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
          
          // Messages list
          Expanded(
            child: ListView.builder(
              reverse: true,
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[_messages.length - 1 - index];
                return _ChatBubble(message: message)
                    .animate()
                    .fade(duration: const Duration(milliseconds: 300))
                    .scale(
                      duration: const Duration(milliseconds: 300),
                      begin: const Offset(0.95, 0.95),
                      end: const Offset(1, 1),
                    );
              },
            ),
          ),
          
          // Message input
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: GcbAppTheme.surfaceLight,
              border: Border(
                top: BorderSide(
                  color: GcbAppTheme.surface,
                  width: 1,
                ),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                      hintStyle: TextStyle(color: GcbAppTheme.textSecondary),
                      filled: true,
                      fillColor: GcbAppTheme.surface,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                    ),
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 3,
                    minLines: 1,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: GcbAppTheme.primary,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: _sendMessage,
                    icon: Icon(
                      PhosphorIconsLight.paperPlaneTilt,
                      color: GcbAppTheme.textPrimary,
                      size: 20,
                    ),
                    padding: EdgeInsets.zero,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;
    
    setState(() {
      _messages.add(_ChatMessage(
        senderId: 'local',
        senderName: 'You',
        text: _messageController.text.trim(),
        timestamp: DateTime.now(),
        isMe: true,
      ));
      _messageController.clear();
    });
  }
}

class _ChatBubble extends StatelessWidget {
  final _ChatMessage message;
  
  const _ChatBubble({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16, left: 8, right: 8),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.2,
        ),
        child: Column(
          crossAxisAlignment: message.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            if (!message.isMe)
              Padding(
                padding: const EdgeInsets.only(left: 12, bottom: 4),
                child: Text(
                  message.senderName,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: GcbAppTheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: message.isMe ? GcbAppTheme.primary : GcbAppTheme.surfaceLight,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                message.text,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: message.isMe ? Colors.white : GcbAppTheme.textPrimary,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, top: 4, right: 12),
              child: Text(
                _formatTime(message.timestamp),
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: GcbAppTheme.textSecondary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  String _formatTime(DateTime time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }
}

class _ChatMessage {
  final String senderId;
  final String senderName;
  final String text;
  final DateTime timestamp;
  final bool isMe;
  
  _ChatMessage({
    required this.senderId,
    required this.senderName,
    required this.text,
    required this.timestamp,
    required this.isMe,
  });
}