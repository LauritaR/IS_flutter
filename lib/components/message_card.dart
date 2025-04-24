import 'package:flutter/material.dart';


class MessageCard extends StatefulWidget {
  final String senderName;
  final String messageSnippet;
  final String fullMessage;
  final String time;
  final bool isUnread;


  const MessageCard({
    super.key,
    required this.senderName,
    required this.messageSnippet,
    required this.fullMessage,
    required this.time,
    this.isUnread = false
});

  @override
  State<MessageCard> createState() => _MessageCardState();
}

class _MessageCardState extends State<MessageCard> {
  bool _isExpanded = false;
  late bool _isUnread;

  @override
  void initState(){
    super.initState();
    _isUnread = widget.isUnread;
  }

  void _toggleCard() {
    setState(() {
      _isExpanded  = !_isExpanded;
      if(_isUnread){
        _isUnread=false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleCard,
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _isUnread ? const Color(0xFF958989) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.senderName,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: _isUnread ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
                Text(
                  widget.time,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 8),

            AnimatedCrossFade(
              firstChild: Text(
                widget.messageSnippet,
                style: const TextStyle(fontSize: 14),
                overflow: TextOverflow.ellipsis,
              ),
              secondChild: Text(
                widget.fullMessage,
                style: const TextStyle(fontSize: 14),
              ),
              crossFadeState: _isExpanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 300),
            ),
          ],
        ),
      ),
    );
  }
}
