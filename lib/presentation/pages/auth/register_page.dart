import 'package:eapp1/presentation/widgets/buttons/btn1_button.dart';
import 'package:eapp1/presentation/widgets/frames/home_center_frame.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeCenterFrame(
        child: SingleChildScrollView(
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
              Padding(
                padding: const EdgeInsets.only(left: 0.0),
                child: Text(
                  'Register',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Enter Your Name",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Name field is required";
                  }
                },
                autocorrect: false,
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Enter Your Username",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Username field is required";
                  }
                },
                autocorrect: false,
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Enter Your Email",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email field is required";
                  }
                },
                autocorrect: false,
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Enter Your Password",
                ),
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Re-Enter Your Password",
                ),
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
              ),
              const SizedBox(
                height: 70,
              ),
              SizedBox(
                width: 120,
                height: 50,
                child: Btn1Button(
                  text: "Submit",
                  callback: () => {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
