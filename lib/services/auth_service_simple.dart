import 'package:flutter/material.dart';

class AuthServiceSimple extends ChangeNotifier {
  bool _isLoggedIn = false;
  bool _isLoading = false;
  String _userName = '';

  bool get isLoggedIn => _isLoggedIn;
  bool get isLoading => _isLoading;
  String get userName => _userName;

  Future<void> signInWithGoogle() async {
    try {
      _isLoading = true;
      notifyListeners();

      // Simular delay de autenticación
      await Future.delayed(const Duration(seconds: 2));
      
      _isLoggedIn = true;
      _userName = 'Usuario Demo';
    } catch (e) {
      debugPrint('Error signing in: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signOut() async {
    _isLoggedIn = false;
    _userName = '';
    notifyListeners();
  }
}

