import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/login_screen_simple.dart';
import 'screens/chat_screen_simple.dart';
import 'services/auth_service_simple.dart';

void main() {
  runApp(const SeleneApp());
}

class SeleneApp extends StatelessWidget {
  const SeleneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthServiceSimple()),
      ],
      child: MaterialApp(
        title: 'Selene Chat',
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
        home: const AuthWrapper(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthServiceSimple>(
      builder: (context, authService, child) {
        if (authService.isLoading) {
          return const Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          );
        }
        
        if (authService.isLoggedIn) {
          return const ChatScreenSimple();
        }
        
        return const LoginScreenSimple();
      },
    );
  }
}

