# Configuración de OpenAI para Selene Chat

## Pasos para configurar OpenAI API

### 1. Crear cuenta en OpenAI

1. Ve a [OpenAI Platform](https://platform.openai.com)
2. Crea una cuenta o inicia sesión
3. Verifica tu email si es necesario

### 2. Obtener API Key

1. Ve a [API Keys](https://platform.openai.com/api-keys)
2. Haz clic en "Create new secret key"
3. Nombra la key "Selene Chat"
4. Copia la API key (se muestra solo una vez)

### 3. Configurar la API Key en la app

1. Abre `lib/services/ai_service.dart`
2. Reemplaza `TU_API_KEY_AQUI` con tu API key:

```dart
static const String _apiKey = 'sk-tu-api-key-aqui';
```

### 4. Configurar facturación (opcional)

1. Ve a [Billing](https://platform.openai.com/account/billing)
2. Agrega un método de pago
3. Establece un límite de gasto si lo deseas

### 5. Probar la integración

1. Ejecuta la aplicación
2. Inicia sesión con Google
3. Envía un mensaje en el chat
4. Verifica que recibas una respuesta de IA

## Configuración avanzada

### Personalizar el modelo de IA

En `lib/services/ai_service.dart`, puedes cambiar el modelo:

```dart
'model': 'gpt-4', // Modelo más avanzado (más caro)
// o
'model': 'gpt-3.5-turbo', // Modelo más económico
```

### Ajustar parámetros de respuesta

```dart
'max_tokens': 1000, // Respuestas más largas
'temperature': 0.9, // Respuestas más creativas (0.0-1.0)
'top_p': 0.9, // Diversidad de respuestas
```

### Personalizar el prompt del sistema

```dart
{
  'role': 'system',
  'content': 'Eres Selene, un asistente de IA especializado en [tu dominio]. Responde de manera [tu estilo].'
}
```

## Costos aproximados

- **GPT-3.5-turbo**: ~$0.002 por 1K tokens
- **GPT-4**: ~$0.03 por 1K tokens
- Una conversación típica: $0.01-0.10

## Modo de respuestas simuladas

Si no quieres usar OpenAI, la app automáticamente usará respuestas simuladas cuando:
- No hay API key configurada
- Hay error de conexión
- La API key es inválida

## Solución de problemas

### Error: "Invalid API key"
- Verifica que la API key esté correctamente copiada
- Asegúrate de que no haya espacios extra
- Verifica que la key esté activa en OpenAI

### Error: "Insufficient quota"
- Verifica tu facturación en OpenAI
- Asegúrate de tener créditos disponibles
- Revisa los límites de uso

### Error: "Rate limit exceeded"
- Espera unos minutos antes de enviar más mensajes
- Considera implementar un delay entre mensajes
- Verifica los límites de tu plan

### Respuestas en inglés en lugar de español
- Verifica que el prompt del sistema esté en español
- Ajusta el parámetro `temperature` para mayor consistencia
- Considera agregar más contexto en el prompt


