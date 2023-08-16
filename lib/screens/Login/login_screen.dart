import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neerp/utils/components/custom_form_button.dart';
import 'package:neerp/utils/components/custom_input_field.dart';
import 'package:neerp/utils/components/page_header.dart';
import 'package:neerp/utils/components/page_heading.dart';
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
      backgroundColor: const Color(0xffEEF1F3),
      body: Column(
        children: [
          const PageHeader(),
          BlocProvider(
            create: (context) => LoginCubit(context.read<APIService>()),
            child: LoginForm(),
          ),
        ],
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  LoginForm({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status == LoginStatus.error) {}
      },
      // child: const Column(
      //   children: [
      //     _UsernameInput(),
      //     SizedBox(
      //       height: 50,
      //     ),
      //     _PasswordInput(),
      //     SizedBox(
      //       height: 50,
      //     ),
      //     _LoginButton(),
      //     SizedBox(
      //       height: 50,
      //     ),
      //     _SignUpButton(),
      //   ],
      // )
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
                  title: 'Log in',
                ),
                _UsernameInput(),
                // CustomInputField(
                //   labelText: 'Username',
                //   hintText: 'Enter your username',
                //   prefix: const Icon(Icons.person_pin_outlined),
                //   validator: (textValue) {
                //     if (textValue == null || textValue.isEmpty) {
                //       return 'Username is required !!!';
                //     }
                //     return null;
                //   },
                // ),
                const SizedBox(
                  height: 16,
                ),
                // CustomInputField(
                //   labelText: 'Password',
                //   hintText: 'Enter your password',
                //   obscureText: true,
                //   suffixIcon: true,
                //   prefix: const Icon(Icons.lock_outline_rounded),
                //   validator: (textValue) {
                //     if (textValue == null || textValue.isEmpty) {
                //       return 'Password is required !!!';
                //     }
                //     return null;
                //   },
                // ),
                _PasswordInput(),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.80,
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () => {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) =>
                      //             const ForgetPasswordPage()))
                    },
                    child: const Text(
                      'Forget password?',
                      style: TextStyle(
                        color: Color(0xff939393),
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                _LoginButton(),
                const SizedBox(
                  height: 18,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have an account ? ',
                        style: TextStyle(
                            fontSize: 13,
                            color: Color(0xff939393),
                            fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () => {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //             const SignupPage()))
                        },
                        child: const Text(
                          'Sign up',
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
                  height: 20,
                ),
              ],
            ),
          ),
        ),
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
      widget: BlocBuilder<LoginCubit, LoginState>(
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
            onChanged: (email) {
              context.read<LoginCubit>().emailChanged(email);
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
      widget: BlocBuilder<LoginCubit, LoginState>(
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
              context.read<LoginCubit>().passwordChanged(password);
            },
          );
        },
      ),
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
            : /* ElevatedButton(
                onPressed: () {
                  context.read<LoginCubit>().loginWithCredentials();
                },
                child: const Text("Submit"),
                style: ElevatedButton.styleFrom(fixedSize: const Size(200, 40)),
              ); */
            CustomFormButton(
                innerText: 'Login',
                onPressed: () {
                  // if (_loginFormKey.currentState!.validate()) {
                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //     const SnackBar(content: Text('Submitting data..')),
                  //   );
                  // }
                  context.read<LoginCubit>().loginWithCredentials();
                },
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
