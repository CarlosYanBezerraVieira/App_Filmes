import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin MessagsMixin on GetxController {
  void messageListener(Rxn<MessageModel> message) {
    ever<MessageModel?>(message, (model) {
      if (model != null) {
        Get.snackbar(
          model.title,
          model.message,
          backgroundColor: model.type.color(),
        );
      }
    });
  }
}

class MessageModel {
  final String title;
  final String message;
  final MessageType type;
  MessageModel({
    required this.title,
    required this.message,
    required this.type,
  });
  MessageModel.error({
    required this.title,
    required this.message,
  }) : type = MessageType.erro;
  MessageModel.info({
    required this.title,
    required this.message,
  }) : type = MessageType.info;
}

enum MessageType { erro, info }

extension MessageTypeExtension on MessageType {
  Color color() {
    switch (this) {
      case MessageType.erro:
        return Colors.red[600] ?? Colors.red;
      case MessageType.info:
        return Colors.blue[200] ?? Colors.blue;
    }
  }
}
