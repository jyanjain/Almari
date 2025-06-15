import 'dart:typed_data';

enum ChatItemType { text, image }

class ChatItem {
  final String content;
  final bool isSentByUser;
  final ChatItemType type;
  final Uint8List? imageBytes;
  final String? caption;

  ChatItem({
    required this.content,
    required this.isSentByUser,
    required this.type,
    this.imageBytes,
    this.caption,
  });
}
