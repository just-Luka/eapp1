import 'package:eapp1/domain/cubit/auth/login_cubit.dart';
import 'package:eapp1/presentation/widgets/buttons/btn1_button.dart';
import 'package:eapp1/presentation/widgets/frames/home_center_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  final _email = TextEditingController();
  final _passsword = TextEditingController();

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeCenterFrame(
        child: SingleChildScrollView(
          child: BlocProvider(
              create: (BuildContext context) => LoginCubit(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 55,
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Text(
                    'Login',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  TextFormField(
                    controller: _email,
                    decoration: const InputDecoration(
                      hintText: "Enter Your Email",
                    ),
                    autocorrect: false,
                  ),
                  BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      if (state is LoginValidationError) {
                        return state.errorMessage['email'] == null
                            ? const SizedBox()
                            : Text(
                                state.errorMessage['email']!,
                                style: GoogleFonts.poppins(
                                  color: const Color.fromARGB(255, 223, 5, 5),
                                  height: 2.5,
                                ),
                              );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: _passsword,
                    decoration: const InputDecoration(
                      hintText: "Enter Your Password",
                    ),
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                  ),
                  BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      if (state is LoginValidationError) {
                        return state.errorMessage['password'] == null
                            ? const SizedBox()
                            : Text(
                                state.errorMessage['password']!,
                                style: GoogleFonts.poppins(
                                  color: const Color.fromARGB(255, 223, 5, 5),
                                  height: 2.5,
                                ),
                              );
                      } else if (state is LoginCredentialsError) {
                        return Text(
                          state.errorMessage,
                          style: GoogleFonts.poppins(
                            color: const Color.fromARGB(255, 223, 5, 5),
                            height: 2.5,
                          ),
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      print('reset password!');
                    },
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        'Reset password',
                        style: GoogleFonts.poppins(
                          color: Color.fromARGB(255, 37, 55, 221),
                          height: 3,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 160,
                  ),
                  BlocListener<LoginCubit, LoginState>(
                    listener: (context, state) {
                      if (state is LoginSuccessfully) {
                        Navigator.pop(context);
                      }
                    },
                    child: Builder(builder: (context) {
                      return SizedBox(
                        width: 120,
                        height: 50,
                        child: Btn1Button(
                          text: "Submit",
                          callback: () {
                            BlocProvider.of<LoginCubit>(context)
                                .userLogIn(_email.text, _passsword.text);
                          },
                        ),
                      );
                    }),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
