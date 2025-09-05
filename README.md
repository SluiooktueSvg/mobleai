# Selene Chat - Aplicación de Chat con IA

Una aplicación de chat con inteligencia artificial para Android desarrollada con Flutter/Dart.

## 🎯 Características

- 🔐 **Autenticación con Google** - Login seguro y fácil
- 💬 **Chat en tiempo real** - Conversación fluida con IA
- 🌙 **Tema oscuro elegante** - Interfaz moderna y atractiva
- 📱 **Diseño responsive** - Optimizado para Android
- 🤖 **Integración con OpenAI** - Respuestas inteligentes de IA
- 💾 **Persistencia de datos** - Historial de conversaciones

## 🚀 Instalación y Configuración

### Requisitos Previos

1. **Flutter SDK** (versión 3.0.0 o superior)
   - Descarga desde [flutter.dev](https://flutter.dev)
   - Asegúrate de agregar Flutter al PATH

2. **Android Studio**
   - Para desarrollo y emulación
   - Instala el Android SDK

3. **Cuenta de Google**
   - Para configurar la autenticación

### Pasos de Instalación

1. **Clona o descarga el proyecto**:
   ```bash
   cd selene_chat
   ```

2. **Instala las dependencias**:
   ```bash
   flutter pub get
   ```

3. **Configura Firebase**:
   - Ve a [Firebase Console](https://console.firebase.google.com)
   - Crea un nuevo proyecto llamado "Selene Chat"
   - Habilita Authentication > Sign-in method > Google
   - Descarga el archivo `google-services.json`
   - Colócalo en `android/app/google-services.json`

4. **Configura Google Sign-In**:
   - Ve a [Google Cloud Console](https://console.cloud.google.com)
   - Crea credenciales OAuth 2.0 para Android
   - Agrega tu SHA-1 fingerprint (ver sección siguiente)

5. **Configura la API de OpenAI** (opcional):
   - Edita `lib/services/ai_service.dart`
   - Reemplaza `TU_API_KEY_AQUI` con tu API key de OpenAI
   - Si no tienes API key, la app usará respuestas simuladas

### Configuración de SHA-1 Fingerprint

Para obtener tu SHA-1 fingerprint:

```bash
# En Windows
keytool -list -v -keystore "%USERPROFILE%\.android\debug.keystore" -alias androiddebugkey -storepass android -keypass android

# En macOS/Linux
keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android
```

Copia el SHA-1 fingerprint y agrégalo en Google Cloud Console.

## 🏃‍♂️ Ejecutar la Aplicación

1. **Conecta un dispositivo Android** o inicia un emulador
2. **Ejecuta la aplicación**:
   ```bash
   flutter run
   ```

## 📁 Estructura del Proyecto

```
lib/
├── main.dart                 # Punto de entrada de la aplicación
├── models/
│   └── chat_message.dart    # Modelo de datos para mensajes
├── screens/
│   ├── login_screen.dart    # Pantalla de inicio de sesión
│   └── chat_screen.dart     # Pantalla principal del chat
└── services/
    ├── auth_service.dart    # Servicio de autenticación
    └── ai_service.dart      # Servicio de integración con IA
```

## 🔧 Dependencias Principales

- `google_sign_in: ^6.1.5` - Autenticación con Google
- `firebase_auth: ^4.15.3` - Autenticación de Firebase
- `firebase_core: ^2.24.2` - Core de Firebase
- `provider: ^6.1.1` - Gestión de estado
- `http: ^1.1.0` - Peticiones HTTP para IA
- `shared_preferences: ^2.2.2` - Almacenamiento local
- `intl: ^0.19.0` - Internacionalización

## 🎨 Personalización

### Cambiar el Logo
Reemplaza el icono de auriculares en `lib/screens/login_screen.dart`:

```dart
// Línea 233-245
Container(
  width: 80,
  height: 80,
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20),
  ),
  child: const Icon(
    Icons.headphones, // Cambia este icono
    size: 40,
    color: Colors.black,
  ),
),
```

### Modificar Colores
Los colores del tema se definen en `lib/main.dart`:

```dart
// Líneas 104-113
theme: ThemeData.dark().copyWith(
  scaffoldBackgroundColor: Colors.black,
  primaryColor: Colors.white,
  colorScheme: const ColorScheme.dark(
    primary: Colors.white,
    secondary: Colors.grey,
    surface: Colors.black,
    background: Colors.black,
  ),
),
```

### Integrar IA Real
Modifica `lib/services/ai_service.dart` para conectar con tu API de IA preferida:

```dart
static const String _apiKey = 'TU_API_KEY_AQUI';
static const String _apiUrl = 'https://api.openai.com/v1/chat/completions';
```

## 🐛 Solución de Problemas

### Error de Google Sign-In
- ✅ Verifica que el SHA-1 fingerprint esté configurado correctamente
- ✅ Asegúrate de que el archivo `google-services.json` esté en `android/app/`
- ✅ Verifica que Google Sign-In esté habilitado en Firebase Console

### Error de Firebase
- ✅ Verifica que Firebase esté configurado correctamente
- ✅ Asegúrate de que las dependencias estén actualizadas
- ✅ Verifica que el archivo `google-services.json` sea válido

### Error de Compilación
- ✅ Ejecuta `flutter clean` y luego `flutter pub get`
- ✅ Verifica que Flutter esté actualizado: `flutter upgrade`
- ✅ Asegúrate de que Android Studio esté actualizado

## 🚀 Próximas Mejoras

- [ ] Historial de conversaciones persistente
- [ ] Múltiples temas de color
- [ ] Soporte para imágenes y archivos
- [ ] Notificaciones push
- [ ] Modo offline
- [ ] Exportar conversaciones
- [ ] Configuración de personalidad de IA

## 📄 Licencia

Este proyecto está bajo la Licencia MIT - ver el archivo [LICENSE](LICENSE) para detalles.

## 🤝 Contribuir

1. Fork el proyecto
2. Crea una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

## 📞 Soporte

Si tienes problemas o preguntas:
- Abre un issue en GitHub
- Revisa la documentación de Flutter
- Consulta la documentación de Firebase

---

**¡Disfruta chateando con Selene! 🤖💬**


