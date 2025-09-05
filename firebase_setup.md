# Configuración de Firebase para Selene Chat

## Pasos para configurar Firebase

### 1. Crear proyecto en Firebase Console

1. Ve a [Firebase Console](https://console.firebase.google.com)
2. Haz clic en "Crear un proyecto"
3. Nombra el proyecto "Selene Chat"
4. Habilita Google Analytics (opcional)
5. Selecciona tu cuenta de Google Analytics

### 2. Agregar aplicación Android

1. En el dashboard de Firebase, haz clic en "Agregar app" > Android
2. Ingresa el package name: `com.selene.chat`
3. Ingresa el nickname: "Selene Chat Android"
4. Descarga el archivo `google-services.json`
5. Coloca el archivo en `android/app/google-services.json`

### 3. Configurar Authentication

1. En el menú lateral, ve a "Authentication"
2. Haz clic en "Comenzar"
3. Ve a la pestaña "Sign-in method"
4. Habilita "Google"
5. Configura el email de soporte del proyecto
6. Guarda los cambios

### 4. Obtener SHA-1 Fingerprint

Ejecuta este comando en tu terminal:

```bash
# Windows
keytool -list -v -keystore "%USERPROFILE%\.android\debug.keystore" -alias androiddebugkey -storepass android -keypass android

# macOS/Linux
keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android
```

### 5. Agregar SHA-1 a Firebase

1. En Firebase Console, ve a "Configuración del proyecto"
2. Ve a la pestaña "General"
3. En "Tus aplicaciones", selecciona tu app Android
4. Haz clic en "Agregar huella digital"
5. Pega el SHA-1 fingerprint que obtuviste
6. Descarga el nuevo `google-services.json`
7. Reemplaza el archivo anterior

### 6. Verificar configuración

1. Asegúrate de que `google-services.json` esté en `android/app/`
2. Verifica que el package name coincida
3. Ejecuta `flutter clean` y `flutter pub get`
4. Prueba la aplicación

## Solución de problemas comunes

### Error: "Google Sign-In failed"
- Verifica que el SHA-1 esté correctamente configurado
- Asegúrate de que Google Sign-In esté habilitado en Firebase
- Verifica que el archivo `google-services.json` sea válido

### Error: "Firebase not initialized"
- Verifica que `firebase_core` esté en las dependencias
- Asegúrate de que `google-services.json` esté en la ubicación correcta
- Ejecuta `flutter clean` y `flutter pub get`

### Error: "Package name mismatch"
- Verifica que el package name en `android/app/build.gradle` coincida con Firebase
- Asegúrate de que el `google-services.json` sea para la app correcta


