import 'dart:convert';
import 'package:http/http.dart' as http;

class AIService {
  // Reemplaza con tu API key de OpenAI
  static const String _apiKey = 'TU_API_KEY_AQUI';
  static const String _apiUrl = 'https://api.openai.com/v1/chat/completions';

  static Future<String> getAIResponse(String userMessage) async {
    try {
      final response = await http.post(
        Uri.parse(_apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_apiKey',
        },
        body: jsonEncode({
          'model': 'gpt-3.5-turbo',
          'messages': [
            {
              'role': 'system',
              'content': 'Eres Selene, un asistente de IA amigable y útil. Responde en español de manera conversacional y natural.'
            },
            {
              'role': 'user',
              'content': userMessage
            }
          ],
          'max_tokens': 500,
          'temperature': 0.7,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['choices'][0]['message']['content'].trim();
      } else {
        throw Exception('Error en la API: ${response.statusCode}');
      }
    } catch (e) {
      // Si hay error con la API real, usar respuestas simuladas
      return _getSimulatedResponse(userMessage);
    }
  }

  static String _getSimulatedResponse(String userMessage) {
    final responses = [
      "Interesante pregunta. ¿Podrías darme más detalles sobre eso?",
      "Entiendo lo que me dices. ¿Qué opinas sobre esta situación?",
      "Esa es una perspectiva muy interesante. ¿Has considerado otras opciones?",
      "Me parece que estás pensando de manera muy lógica. ¿Qué más te gustaría saber?",
      "Excelente punto. ¿Te gustaría explorar esto más a fondo?",
      "Gracias por compartir eso conmigo. ¿Hay algo específico en lo que pueda ayudarte?",
      "Eso suena fascinante. ¿Podrías contarme más sobre tu experiencia?",
      "Comprendo tu punto de vista. ¿Qué te gustaría hacer al respecto?",
    ];
    
    // Usar el hash del mensaje para seleccionar una respuesta consistente
    final hash = userMessage.hashCode;
    return responses[hash.abs() % responses.length];
  }
}


