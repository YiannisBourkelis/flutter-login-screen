/// Author: Yiannis Bourkelis
/// Talk:
/// live coding Σχεδιασμός cross platform login screen με το flutter Part 1/2
/// https://www.youtube.com/watch?v=-XO0l9H40Ic
///
/// live coding Σχεδιασμός cross platform login screen με το flutter Part 2/2
/// https://www.youtube.com/watch?v=CSYz0s0C6Eo

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var obscurePasswordText = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final shortestSide = MediaQuery.of(context).size.shortestSide;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 39, 39, 39),
      body: Align(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
                maxWidth: shortestSide > 430 ? 400 : shortestSide - 30),
            child: Column(
              children: [
                const Image(
                    image: AssetImage('assets/images/flutter_logo.png'),
                    alignment: Alignment.center),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Welcome to Super-Duper App!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 27, color: Colors.white70),
                ),
                const SizedBox(
                  height: 30,
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the email';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.email_rounded),
                            label: const Text('Email'),
                            labelStyle: const TextStyle(
                              color: Color.fromARGB(255, 81, 210, 242),
                            ),
                            fillColor: const Color.fromARGB(255, 4, 55, 97),
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the password';
                            }
                            return null;
                          },
                          obscureText: obscurePasswordText,
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock_clock_rounded),
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    obscurePasswordText = !obscurePasswordText;
                                  });
                                },
                                child: Icon(obscurePasswordText
                                    ? Icons.remove_red_eye_outlined
                                    : Icons.remove_red_eye)),
                            label: const Text('Password'),
                            labelStyle: const TextStyle(
                              color: Color.fromARGB(255, 81, 210, 242),
                            ),
                            fillColor: const Color.fromARGB(255, 4, 55, 97),
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)),
                          ),
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.green[800]!),
                            foregroundColor:
                                const MaterialStatePropertyAll(Colors.white)),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Login...')),
                            );
                          }
                        },
                        child: const Text('Login'))),
                TextButton(
                  onPressed: () async {
                    final Uri supportUrl = Uri.parse('https://google.com');
                    await launchUrl(supportUrl).then((value) {
                      if (value == false) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Could not launch url')));
                      }
                    });
                  },
                  child: const Text('Forgot your password?'),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Divider(
                        indent: 9,
                        endIndent: 15,
                      ),
                    ),
                    Text(
                      'OR',
                      style: TextStyle(color: Colors.white),
                    ),
                    Expanded(
                        child: Divider(
                      indent: 15,
                      endIndent: 9,
                    )),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromARGB(255, 40, 76, 154)),
                          foregroundColor:
                              MaterialStatePropertyAll(Colors.white)),
                      onPressed: () async {
                        final Uri supportUrl = Uri.parse('https://google.com');
                        await launchUrl(supportUrl).then((value) {
                          if (value == false) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Could not launch url')));
                          }
                        });
                      },
                      child: const Text('Create account')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
