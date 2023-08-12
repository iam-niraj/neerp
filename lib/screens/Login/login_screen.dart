import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neerp/utils/config/services/api_service.dart';
import 'package:neerp/screens/Login/cubit/login_cubit.dart';
import 'package:neerp/screens/Register/register_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => LoginScreen());
  }

  bool isPasswordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: BlocProvider(
          create: (context) => LoginCubit(context.read<APIService>()),
          child: const LoginForm(),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.status == LoginStatus.error) {}
        },
        child: const Column(
          children: [
            _UsernameInput(),
            SizedBox(
              height: 50,
            ),
            _PasswordInput(),
            SizedBox(
              height: 50,
            ),
            _LoginButton(),
            SizedBox(
              height: 50,
            ),
            _SignUpButton(),
          ],
        )

        /* Scaffold(
        /*  appBar: AppBar(
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
          ), */
        body: SafeArea(
          child: CustomScrollView(
            reverse: true,
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        fit: FlexFit.loose,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Welcome back.",
                              style: kHeadline,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            const Text(
                              "You've been missed!",
                              style: kBodyText2,
                            ),
                            SizedBox(
                              height: 60.h,
                            ),
                            const MyTextField(
                              labelText: "Username",
                              icon: Icons.person_pin_rounded,
                              obscureText: false,
                              keyboardType: TextInputType.text,
                            ),
                            const MyTextField(
                              labelText: "Password",
                              icon: Icons.lock,
                              obscureText: true,
                              keyboardType: TextInputType.text,
                            ),
                            // MyPasswordField(
                            //   isPasswordVisible: isPasswordVisible,
                            //   onTap: () {
                            //     setState(() {
                            //       isPasswordVisible = !isPasswordVisible;
                            //     });
                            //   },
                            // ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Dont't have an account? ",
                            style: kBodyText,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => RegisterScreen(),
                                ),
                              );
                            },
                            child: Text(
                              'Register',
                              style: kBodyText.copyWith(
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      MyTextButton(
                        buttonName: 'Sign In',
                        onTap: () {},
                        bgColor: kPrimaryColor,
                        textColor: white,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ), */
        );
  }
},

class _UsernameInput extends StatelessWidget {
  const _UsernameInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return TextField(
          onChanged: (email) {
            context.read<LoginCubit>().emailChanged(email);
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
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          onChanged: (password) {
            context.read<LoginCubit>().passwordChanged(password);
          },
          decoration: const InputDecoration(labelText: "Password"),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status == LoginStatus.submitting
            ? const CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () {
                  context.read<LoginCubit>().loginWithCredentials();
                },
                child: const Text("Submit"),
                style: ElevatedButton.styleFrom(fixedSize: const Size(200, 40)),
              );
      },
    );
  }
}

class _SignUpButton extends StatelessWidget {
  const _SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Navigator.of(context).push<void>(RegisterScreen.route()),
      style: ElevatedButton.styleFrom(fixedSize: const Size(200, 40)),
      child: const Text("Signup"),
    );
  }
}
