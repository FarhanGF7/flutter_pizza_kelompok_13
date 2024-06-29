import 'package:flutter/material.dart';
import 'package:uts_app/components/register_textfield.dart';
import 'package:uts_app/components/signup_button.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

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
            SignUpButton(
              text: "Buat Akun",
              onTap: () {},
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
