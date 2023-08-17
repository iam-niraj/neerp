// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neerp/utils/components/custom_form_button.dart';
import 'package:neerp/utils/components/custom_input_field.dart';
import 'package:neerp/utils/components/page_header.dart';
import 'package:neerp/utils/components/page_heading.dart';
import 'package:neerp/utils/config/services/api_service.dart';
import 'package:neerp/screens/Login/login_screen.dart';
import 'package:neerp/screens/Register/cubit/signup_cubit.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  static Route route() {
    return MaterialPageRoute(builder: (_) => RegisterScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffEEF1F3),
        body: Column(
          children: [
            const PageHeader(),
            BlocProvider<SignupCubit>(
              create: (context) => SignupCubit(context.read<APIService>()),
              child: RegisterForm(),
            ),
          ],
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
      child: Expanded(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const PageHeading(
                  title: 'Register',
                ),
                _FullnameInput(),
                SizedBox(
                  height: 16,
                ),
                _EmailInput(),
                SizedBox(
                  height: 16,
                ),
                _PhoneInput(),
                SizedBox(
                  height: 16,
                ),
                _UsernameInput(),
                SizedBox(
                  height: 16,
                ),
                _PasswordInput(),
                SizedBox(
                  height: 18,
                ),
                _SignUpButton(),
                const SizedBox(
                  height: 18,
                ),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account ? ',
                        style: TextStyle(
                            fontSize: 13,
                            color: Color(0xff939393),
                            fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () => {Navigator.pop(context)},
                        child: const Text(
                          'Log in',
                          style: TextStyle(
                              fontSize: 15,
                              color: Color(0xff748288),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
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
    return CustomInputField(
      labelText: "Fullname",
      prefix: Icon(Icons.person_outline_sharp),
      widget: BlocBuilder<SignupCubit, SignupState>(
        buildWhen: (previous, current) => previous.fullname != current.fullname,
        builder: (context, state) {
          // return TextField(
          //   onChanged: (fullname) {
          //     context.read<SignupCubit>().fullnameChanged(fullname);
          //   },
          //   decoration: const InputDecoration(labelText: "Fullname"),
          // );
          return TextField(
            decoration: const InputDecoration(
              hintText: "Enter your fullname",
              contentPadding: EdgeInsets.zero,
            ),
            onChanged: (fullname) {
              context.read<SignupCubit>().fullnameChanged(fullname);
            },
          );
        },
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      labelText: "Email",
      prefix: const Icon(Icons.alternate_email_rounded),
      widget: BlocBuilder<SignupCubit, SignupState>(
        buildWhen: (previous, current) => previous.email != current.email,
        builder: (context, state) {
          // return TextField(
          //   onChanged: (email) {
          //     context.read<SignupCubit>().emailChanged(email);
          //   },
          //   decoration: const InputDecoration(labelText: "Email"),
          // );
          return TextField(
            // obscureText: (widget.obscureText && _obscureText),
            decoration: const InputDecoration(
              hintText: "Enter your email",
              contentPadding: EdgeInsets.zero,
            ),
            onChanged: (email) {
              context.read<SignupCubit>().emailChanged(email);
            },
          );
        },
      ),
    );
  }
}

class _PhoneInput extends StatelessWidget {
  const _PhoneInput({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      labelText: "Phone no.",
      prefix: const Icon(Icons.phone_outlined),
      widget: BlocBuilder<SignupCubit, SignupState>(
        buildWhen: (previous, current) => previous.phone != current.phone,
        builder: (context, state) {
          //   return TextField(
          //     onChanged: (phone) {
          //       context.read<SignupCubit>().phoneChanged(phone);
          //     },
          //     decoration: const InputDecoration(labelText: "Phone"),
          //   );
          return TextField(
            // obscureText: (widget.obscureText && _obscureText),
            decoration: const InputDecoration(
              hintText: "Enter your phone number",
              contentPadding: EdgeInsets.zero,
            ),
            onChanged: (phone) {
              context.read<SignupCubit>().phoneChanged(phone);
            },
          );
        },
      ),
    );
  }
}

class _UsernameInput extends StatelessWidget {
  const _UsernameInput({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      labelText: "Username",
      prefix: const Icon(Icons.person_pin_outlined),
      widget: BlocBuilder<SignupCubit, SignupState>(
        buildWhen: (previous, current) => previous.username != current.username,
        builder: (context, state) {
          // return TextField(
          //   onChanged: (email) {
          //     context.read<LoginCubit>().emailChanged(email);
          //   },
          //   decoration: const InputDecoration(labelText: "Username"),
          // );
          return TextField(
            // obscureText: (widget.obscureText && _obscureText),
            decoration: const InputDecoration(
              hintText: "Enter your username",
              contentPadding: EdgeInsets.zero,
            ),
            onChanged: (username) {
              context.read<SignupCubit>().usernameChanged(username);
            },
          );
        },
      ),
    );
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      labelText: "Password",
      prefix: const Icon(Icons.lock_outline_rounded),
      widget: BlocBuilder<SignupCubit, SignupState>(
        buildWhen: (previous, current) => previous.password != current.password,
        builder: (context, state) {
          // return TextField(
          //   onChanged: (password) {
          //     context.read<LoginCubit>().passwordChanged(password);
          //   },
          //   decoration: const InputDecoration(labelText: "Password"),
          // );

          return TextField(
            obscureText: true,
            decoration: const InputDecoration(
              hintText: "Enter your password",
              contentPadding: EdgeInsets.zero,
            ),
            onChanged: (password) {
              context.read<SignupCubit>().passwordChanged(password);
            },
          );
        },
      ),
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
            : /* ElevatedButton(
                onPressed: () {
                  context.read<SignupCubit>().signUpFormSubmitted();
                },
                child: Text("Register"),
                style: ElevatedButton.styleFrom(fixedSize: const Size(200, 40)),
              ); */
            CustomFormButton(
                innerText: 'Register',
                onPressed: () {
                  // if (_loginFormKey.currentState!.validate()) {
                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //     const SnackBar(content: Text('Submitting data..')),
                  //   );
                  // }
                  context.read<SignupCubit>().signUpFormSubmitted();
                  Navigator.pop(context);
                },
              );
      },
    );
  }
}
