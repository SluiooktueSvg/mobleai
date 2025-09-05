# 🚀 Instalación Rápida - Selene Chat

## ⚡ Pasos Rápidos (5 minutos)

### 1. Instalar Flutter
```bash
# Descarga Flutter desde https://flutter.dev
# Agrega Flutter al PATH de tu sistema
flutter doctor
```

### 2. Configurar el proyecto
```bash
cd selene_chat
flutter pub get
```

### 3. Configurar Firebase (2 minutos)
1. Ve a [Firebase Console](https://console.firebase.google.com)
2. Crea proyecto "Selene Chat"
3. Agrega app Android con package: `com.selene.chat`
4. Descarga `google-services.json` → colócalo en `android/app/`
5. Habilita Google Sign-In en Authentication

### 4. Obtener SHA-1 (30 segundos)
```bash
# Windows
keytool -list -v -keystore "%USERPROFILE%\.android\debug.keystore" -alias androiddebugkey -storepass android -keypass android

# macOS/Linux  
keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android
```

### 5. Agregar SHA-1 a Firebase
1. Firebase Console → Configuración → General
2. Selecciona tu app Android
3. Agrega huella digital SHA-1
4. Descarga nuevo `google-services.json`

### 6. Ejecutar la app
```bash
flutter run
```

## 🎯 ¡Listo! 

Tu app de chat con IA está funcionando. 

### Opcional: Configurar OpenAI
1. Ve a [OpenAI Platform](https://platform.openai.com)
2. Crea API key
3. Edita `lib/services/ai_service.dart`
4. Reemplaza `TU_API_KEY_AQUI` con tu key

## 🆘 Si algo falla

### Error de Google Sign-In
- ✅ Verifica SHA-1 en Firebase
- ✅ Verifica `google-services.json` en `android/app/`

### Error de compilación
- ✅ `flutter clean && flutter pub get`
- ✅ Verifica que Flutter esté actualizado

### Error de Firebase
- ✅ Verifica que Google Sign-In esté habilitado
- ✅ Verifica package name en `android/app/build.gradle`

## 📱 Probar la app

1. **Login**: Toca "Sign In with Google"
2. **Chat**: Escribe un mensaje
3. **IA**: Recibe respuesta de Selene

¡Disfruta chateando con Selene! 🤖💬


