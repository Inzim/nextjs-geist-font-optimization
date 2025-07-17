import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  bool _isAuthenticated = false;
  String _userName = '';
  String _userRole = '';
  bool _isLoading = false;

  bool get isAuthenticated => _isAuthenticated;
  String get userName => _userName;
  String get userRole => _userRole;
  bool get isLoading => _isLoading;

  AuthProvider() {
    _loadAuthState();
  }

  Future<void> _loadAuthState() async {
    final prefs = await SharedPreferences.getInstance();
    _isAuthenticated = prefs.getBool('isAuthenticated') ?? false;
    _userName = prefs.getString('userName') ?? '';
    _userRole = prefs.getString('userRole') ?? '';
    notifyListeners();
  }

  Future<bool> login(String username, String password) async {
    _isLoading = true;
    notifyListeners();

    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    // Mock authentication - in real app, this would be an API call
    if (username.isNotEmpty && password.isNotEmpty) {
      _isAuthenticated = true;
      _userName = 'Imran Zarkoon';
      _userRole = 'Secretary Finance';

      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isAuthenticated', true);
      await prefs.setString('userName', _userName);
      await prefs.setString('userRole', _userRole);

      _isLoading = false;
      notifyListeners();
      return true;
    }

    _isLoading = false;
    notifyListeners();
    return false;
  }

  Future<void> logout() async {
    _isAuthenticated = false;
    _userName = '';
    _userRole = '';

    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    notifyListeners();
  }

  Future<bool> changePassword(String currentPassword, String newPassword) async {
    _isLoading = true;
    notifyListeners();

    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));

    // Mock password change - in real app, this would be an API call
    _isLoading = false;
    notifyListeners();
    return true;
  }
}
