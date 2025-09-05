import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/chat_message.dart';

class StorageService {
  static const String _messagesKey = 'chat_messages';

  // Guardar mensajes en el almacenamiento local
  static Future<void> saveMessages(List<ChatMessage> messages) async {
    final prefs = await SharedPreferences.getInstance();
    final messagesJson = messages.map((msg) => msg.toJson()).toList();
    await prefs.setString(_messagesKey, jsonEncode(messagesJson));
  }

  // Cargar mensajes desde el almacenamiento local
  static Future<List<ChatMessage>> loadMessages() async {
    final prefs = await SharedPreferences.getInstance();
    final messagesString = prefs.getString(_messagesKey);
    
    if (messagesString == null) return [];
    
    try {
      final List<dynamic> messagesJson = jsonDecode(messagesString);
      return messagesJson.map((json) => ChatMessage.fromJson(json)).toList();
    } catch (e) {
      return [];
    }
  }

  // Limpiar todos los mensajes
  static Future<void> clearMessages() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_messagesKey);
  }
}


