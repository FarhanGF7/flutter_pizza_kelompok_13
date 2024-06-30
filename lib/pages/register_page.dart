// ignore_for_file: use_build_context_synchronously, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:uts_app/components/button.dart';
import 'package:uts_app/components/register_textfield.dart';
import 'package:uts_app/services/auth/auth_services.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // register user
  void registerUser() async {
    // get auth service
    final _authService = AuthService();

    // cek if password and konfirmasi password sama
    if (passwordController.text == confirmPasswordController.text) {
      // creating user pakai try
      try {
        await _authService.signUpWithEmailPassword(
          emailController.text,
          passwordController.text,
        );
      }

      // tangkap semua error
      catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    }

    // cek if password dan konfirmasi password beda
    else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Password tidak sama"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Icon(
              Icons.local_pizza_outlined,
              size: 100,
              color: Theme.of(context).colorScheme.tertiary,
            ),
            const SizedBox(height: 20),

            // pesan app
            Text(
              'Daftar Akun',
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),

            const SizedBox(height: 20),

            // email form
            RegisterTextField(
              controller: emailController,
              hintText: "Email",
              obscureText: false,
            ),

            const SizedBox(height: 10),

            // password form
            RegisterTextField(
              controller: passwordController,
              hintText: "Password",
              obscureText: true,
            ),

            const SizedBox(height: 10),

            RegisterTextField(
              controller: confirmPasswordController,
              hintText: "Konfirmasi Password",
              obscureText: true,
            ),

            const SizedBox(height: 25),

            // sign un button
            MyButton(
              text: "Buat Akun",
              onTap: registerUser,
            ),

            const SizedBox(height: 25),

            // akun sudah terdaftar? Masuk ke sini
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Akun sudah terdaftar? ",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Masuk ke sini!",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
