import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vigilsafedriversystem/Features/Selection_View/presentation/views/selection_view.dart';
import 'package:vigilsafedriversystem/Features/Sign_In/presentation/view_model/sign_in_cubit/sign_in_cubit.dart';
import 'package:vigilsafedriversystem/Features/Sign_In/presentation/views/forget_password_view.dart';
import 'package:vigilsafedriversystem/core/models/user_model/user_detail.dart';
import 'package:vigilsafedriversystem/core/widgets/custom_loading_indicator.dart';
import 'package:vigilsafedriversystem/core/widgets/show_toast.dart';

class SignInViewBody extends StatelessWidget {
  SignInViewBody({super.key});
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInCubit, SignInState>(
        listener: (context, state) {
          if (state is SignInLoading) {
            const CustomLoadingIndicator();
          } else if (state is SignInSuccess) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => SelectionView(
                          userUid: state.userUid,
                          userDetails: UserDetails(
                              email: state.userDetails.email,
                              firstName: state.userDetails.firstName,
                              lastName: state.userDetails.lastName,
                              nationalID: state.userDetails.nationalID,
                              phoneNumber: state.userDetails.phoneNumber),
                        )));
            showToast(context, 'Done Login...', Colors.green);
          } else if (state is SignInFailure) {
            showToast(context, state.errorMessage, Colors.redAccent);
          }
        },
        child: Scaffold(
          body: Stack(children: [
            Image.asset(
              'assets/cars_background.jpeg', // Background pattern image
              opacity: const AlwaysStoppedAnimation(.2),
              fit: BoxFit.cover,
              height: double.infinity,
            ),
            SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 100,
                        ),
                        const Text('Sign In',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Pacifico',
                                fontSize: 30)),
                        const SizedBox(
                          height: 100,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                          controller: _emailController,
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                          obscureText: true,
                          controller: _passwordController,
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const ForgetPasswordView(),
                                ));
                          },
                          child: const Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'Forgot your password?',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<SignInCubit>(context)
                                  .loginWithEmailAndPassword(
                                _emailController.text,
                                _passwordController.text,
                              );
                              print(
                                  '########${_emailController.text}#########');
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black,
                              backgroundColor: Colors.blue,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                            ),
                            child: const Text(
                              'Sign In',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                      ])),
            ),
          ]),
        ));
  }
}
