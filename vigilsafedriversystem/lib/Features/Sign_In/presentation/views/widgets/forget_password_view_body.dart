import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vigilsafedriversystem/core/widgets/show_toast.dart';

class ForgetPasswordViewBody extends StatefulWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  State<ForgetPasswordViewBody> createState() => _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody> {
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned.fill(
          child: Opacity(
            opacity: 0.3,
            child: Image.asset(
              'assets/cars_background.jpeg', // Background pattern image
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                controller: email,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    try {
                      assert(email.text
                          .contains(RegExp(r'\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,6}')));
                      FirebaseAuth.instance
                          .sendPasswordResetEmail(email: email.text)
                          .then((value) {
                        showToast(context, 'Done Send', Colors.green);
                        Navigator.pop(context);
                      });
                    } catch (e) {
                      showToast(context, 'this no\'t E-Mail', Colors.redAccent);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.blue,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                  child: const Text('Reset Password'),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
