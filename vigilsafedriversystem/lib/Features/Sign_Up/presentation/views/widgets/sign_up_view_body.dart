import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vigilsafedriversystem/Features/Sign_In/presentation/views/sign_in_view.dart';
import 'package:vigilsafedriversystem/Features/Sign_Up/presentation/view_model/sign_up_cubit/sign_up_cubit.dart';
import 'package:vigilsafedriversystem/core/models/user_model/user_info.dart';
import 'package:vigilsafedriversystem/core/widgets/show_toast.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  String? selectedValue;

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _nationalIDController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) async {
        if (state is SignUpLoading) {
          return showToast(context, 'Wait the Verification', Colors.yellow);
        } else if (state is SignUpSuccess) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SignInView(),
              ));
          return showToast(
              context, 'Done Send Email Verification', Colors.lightGreen);
        } else if (state is SignUpFailure) {
          return showToast(context, state.errorMessage.toString(), Colors.red);
        }
      },
      builder: (context, state) {
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
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    const Text('Sign Up',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Pacifico',
                            fontSize: 30)),
                    const SizedBox(
                      height: 50,
                    ),
                    TextFormField(
                      controller: _firstNameController,
                      decoration: const InputDecoration(
                        labelText: 'First Name',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      controller: _lastNameController,
                      decoration: const InputDecoration(
                        labelText: 'Last Name',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      controller: _phoneNumberController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Phone Number',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      controller: _nationalIDController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'National ID',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(15),
                          child: Text('Gender :'),
                        ),
                        DropdownButton(
                          value: selectedValue,
                          hint: const Text('Select Options'),
                          icon: const Icon(Icons.arrow_downward),
                          items: const [
                            DropdownMenuItem(
                                value: 'Male', child: Text('Male')),
                            DropdownMenuItem(
                                value: 'Female', child: Text('Female')),
                          ],
                          onChanged: (value) {
                            setState(() => selectedValue = value);
                          },
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      controller: _confirmPasswordController,
                      decoration: const InputDecoration(
                        labelText: 'Confirm Password',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 230,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_firstNameController.text.isEmpty ||
                              _lastNameController.text.isEmpty ||
                              _nationalIDController.text.isEmpty ||
                              _emailController.text.isEmpty ||
                              _phoneNumberController.text.isEmpty ||
                              _passwordController.text.isEmpty ||
                              _confirmPasswordController.text.isEmpty) {
                            showToast(context, 'Empty Fields!',
                                Colors.yellow.shade700);
                            return;
                          }
                          if (_passwordController.text !=
                              _confirmPasswordController.text) {
                            showToast(
                                context,
                                'Re-Password doesn\'t match Password!',
                                Colors.redAccent);
                            return;
                          }
                          BlocProvider.of<SignUpCubit>(context).registration(
                              UserDetails(
                                  email: _emailController.text,
                                  firstName: _firstNameController.text,
                                  lastName: _lastNameController.text,
                                  nationalID: _nationalIDController.text,
                                  phoneNumber: _phoneNumberController.text),
                              _passwordController.text,
                              context);
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.blue,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ),
                        child: const Text('Sign Up'),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ]),
        );
      },
    );
  }
}
