// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neerp/utils/config/services/api_service.dart';
import 'package:neerp/screens/Login/login_screen.dart';
import 'package:neerp/screens/Register/cubit/signup_cubit.dart';
import 'package:neerp/utils/colors.dart';
import 'package:neerp/utils/components/textButton.dart';
import 'package:neerp/utils/components/text_field.dart';
import 'package:neerp/utils/constants.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  static Route route() {
    return MaterialPageRoute(builder: (_) => RegisterScreen());
  }

  bool passwordVisibility = true;
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocProvider<SignupCubit>(
        create: (context) => SignupCubit(context.read<APIService>()),
        child: RegisterForm(),
      ),
    ));
  }
}

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state.status == SignUpStatus.error) {}
      },
      child: Column(
        children: const [
          _FullnameInput(),
          SizedBox(
            height: 50,
          ),
          _EmailInput(),
          SizedBox(
            height: 50,
          ),
          _PhoneInput(),
          SizedBox(
            height: 50,
          ),
          _UsernameInput(),
          SizedBox(
            height: 50,
          ),
          _PasswordInput(),
          SizedBox(
            height: 50,
          ),
          _SignUpButton(),
        ],
      ),
    );

    /* Scaffold(
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(
            'assets/images/back_arrow.svg',
            width: 24.w,
            color: black,
          ),
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                ),
                child: Column(
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Register",
                            style: kHeadline,
                          ),
                          Text(
                            "Create new account to get started.",
                            style: kBodyText2,
                          ),
                          SizedBox(
                            height: 50.h,
                          ),
                          MyTextField(
                              labelText: "Full name",
                              icon: Icons.person,
                              obscureText: false,
                              keyboardType: TextInputType.text),
                          MyTextField(
                            controller: _emailController,
                            labelText: "Email",
                            icon: Icons.email,
                            obscureText: false,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          MyTextField(
                            labelText: "Phone number",
                            icon: Icons.phone,
                            obscureText: false,
                            keyboardType: TextInputType.number,
                          ),
                          MyTextField(
                            labelText: "Username",
                            icon: Icons.person_pin_rounded,
                            obscureText: false,
                            keyboardType: TextInputType.text,
                          ),
                          MyTextField(
                            labelText: "Password",
                            icon: Icons.lock,
                            obscureText: true,
                            keyboardType: TextInputType.text,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: kBodyText,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Log In",
                            style: kBodyText.copyWith(
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MyTextButton(
                      buttonName: 'Register',
                      onTap: () {},
                      bgColor: kPrimaryColor,
                      textColor: white,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ); */
  }
}

class _FullnameInput extends StatelessWidget {
  const _FullnameInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) => previous.fullname != current.fullname,
      builder: (context, state) {
        return TextField(
          onChanged: (fullname) {
            context.read<SignupCubit>().fullnameChanged(fullname);
          },
          decoration: const InputDecoration(labelText: "Fullname"),
        );
      },
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          onChanged: (email) {
            context.read<SignupCubit>().emailChanged(email);
          },
          decoration: const InputDecoration(labelText: "Email"),
        );
      },
    );
  }
}

class _PhoneInput extends StatelessWidget {
  const _PhoneInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) => previous.phone != current.phone,
      builder: (context, state) {
        return TextField(
          onChanged: (phone) {
            context.read<SignupCubit>().phoneChanged(phone);
          },
          decoration: const InputDecoration(labelText: "Phone"),
        );
      },
    );
  }
}

class _UsernameInput extends StatelessWidget {
  const _UsernameInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return TextField(
          onChanged: (username) {
            context.read<SignupCubit>().usernameChanged(username);
          },
          decoration: const InputDecoration(labelText: "Username"),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          onChanged: (password) {
            context.read<SignupCubit>().passwordChanged(password);
          },
          decoration: const InputDecoration(labelText: "Password"),
        );
      },
    );
  }
}

class _SignUpButton extends StatelessWidget {
  const _SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return state.status == SignUpStatus.submitting
            ? CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () {
                  context.read<SignupCubit>().signUpFormSubmitted();
                },
                child: Text("Register"),
                style: ElevatedButton.styleFrom(fixedSize: const Size(200, 40)),
              );
      },
    );
  }
}
