import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble(
      {super.key, required this.message, required this.isUserMessage});
  final String message;
  final bool isUserMessage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isUserMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
            width: 180,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: isUserMessage
                  ? const Color.fromARGB(255, 31, 106, 247)
                  : const Color.fromARGB(255, 17, 114, 57),
            ),
            child: Text(
              message,
              style: TextStyle(),
            ))
      ],
    );
  }
}
