import 'package:flutter/material.dart';

class AuthController {
  // Method for login
  void login(BuildContext context, String email, String password) {
    // Authentication logic
    if (email == "arya@gmail.com" && password == "12345") {
      Navigator.pushReplacementNamed(context, '/welcome');
    } else {
      // Show error message when login fails
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Login gagal. Email atau password salah.')),
      );
    }
  }

  // Method for register
  void register(BuildContext context, String email, String password) {
    // Register logic
    if (email == "arya@gmail.com" && password == "12345") {
      // Assuming registration is successful
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Registrasi berhasil! Silahkan login.')),
      );

      // Navigate to the login page after successful registration
      Navigator.pushReplacementNamed(context, '/login');
    } else {
      // Show error message when registration fails
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
                'Email dan Password harus sama dengan yang sudah ditentukan.')),
      );
    }
  }
}
