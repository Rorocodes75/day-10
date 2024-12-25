import 'package:flutteer_day10/constant/spacing.dart';
import 'package:flutteer_day10/extension/nav.dart';
import 'package:flutteer_day10/pages/list_pages.dart';
import 'package:flutteer_day10/pages/signup.dart';
import 'package:flutteer_day10/service/database.dart';
import 'package:flutteer_day10/widgets/textfeild_widget.dart';
import 'package:flutter/material.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 10, 31, 190),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "Log-in",
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            height24,
            TextFieldWidget(
              controller: emailController,
              text: "enter email here",
            ),
            height24,
            TextFieldWidget(
              controller: passwordController,
              text: "enter password here",
              
              
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("If you do not have an account:"),
                TextButton(
                  onPressed: () {
                    context.pushAndRemove(
                      const Signup(),
                    );
                  },
                  child: const Text(
                    "Signup",
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  await Database().login(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                  if (context.mounted) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ListPages()),
                    );
                  }
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(e.toString())),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 45, 180, 193),
              ),
              child: const Text(
                "Log-in",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
