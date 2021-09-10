import 'package:capimobile/core/constants.dart';
import 'package:capimobile/core/language/language_list.dart';
import 'package:capimobile/features/interface/presentation/screens/login/forgot_password.dart';
import 'package:capimobile/features/interface/presentation/screens/login/logged_user.dart';
import 'package:capimobile/features/interface/presentation/screens/login/user_signup.dart';
import 'package:capimobile/features/interface/presentation/widgets/SectionTitle.dart';
import 'package:capimobile/features/interface/presentation/widgets/web_app_bar.dart';
import 'package:capimobile/features/repository/presentation/cubit/login/login_cubit.dart';
import 'package:capimobile/features/repository/presentation/cubit/user/user_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../home_web.dart';

class UserLogInForm extends StatefulWidget {
  static const String rout = '/userlogin';
  @override
  _UserLogInState createState() => _UserLogInState();
}

class _UserLogInState extends State<UserLogInForm> {
  TextEditingController email, password;
  String errorEmail, errorPassword;

  @override
  void initState() {
    super.initState();
    email = TextEditingController();
    password = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MediaQuery.of(context).size.width > PAGE_WIDTH_SWITCH_APP_BAR
            ? WebAppBar(context, () {
                setState(() {});
              })
            : AppBar(
                title: Text(d.LogIn),
              ),
        body: Scrollbar(
          child: MultiBlocListener(
            listeners: [
              BlocListener<UserCubit, UserState>(
                listener: (context, state) {
                  if (state is UserLoaded) {
                    if (state.user.email != null &&
                        state.user.email != 'verify' &&
                        FirebaseAuth.instance.currentUser.emailVerified) {
                      Navigator.popAndPushNamed(context, UserInfos.rout);
                    }
                  }
                },
              ),
              BlocListener<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state is LoginFailure) {
                    if (state.error == d.EmailNotVerified) {
                      //todo resend email confirmation
                      _showEmailConfirmationDialog();
//                     final snackBar =
//                         SnackBar(content: Text(d.EmailNotVerified));
//
// // Find the Scaffold in the widget tree and use it to show a SnackBar.
//                     Scaffold.of(context).showSnackBar(snackBar);
                    } else {
                      final snackBar = SnackBar(content: Text(state.error));

// Find the Scaffold in the widget tree and use it to show a SnackBar.
                      Scaffold.of(context).showSnackBar(snackBar);
                    }
                  }
                },
              ),
            ],
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                constraints: BoxConstraints(maxWidth: 800),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: IntrinsicHeight(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          SectionTitle('SurvAid'),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              icon: FaIcon(FontAwesomeIcons.envelope),
                              labelText: d.Email,
                              labelStyle:
                                  TextStyle(fontFamily: 'SourceSansPro'),
                              suffixStyle:
                                  TextStyle(fontFamily: 'SourceSansPro'),
                              errorText: errorEmail,
                            ),
                            keyboardType: TextInputType.emailAddress,
                            controller: email,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            decoration: InputDecoration(
                                icon: FaIcon(FontAwesomeIcons.key),
                                labelText: d.Password,
                                labelStyle:
                                    TextStyle(fontFamily: 'SourceSansPro'),
                                suffixStyle:
                                    TextStyle(fontFamily: 'SourceSansPro'),
                                errorText: errorPassword),
                            enableSuggestions: false,
                            autocorrect: false,
                            obscureText: true,
                            onSubmitted: (s) {
                              _login();
                            },
                            controller: password,
                          ),
                          Row(
                            children: [
                              Expanded(child: Container()),
                              FlatButton(
                                  onPressed: () {
                                    _forgotPassword();
                                  },
                                  child: Text(
                                    d.ForgotPassword,
                                    style:
                                        TextStyle(fontFamily: 'SourceSansPro'),
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          OutlineButton(
                            onPressed: () {
                              _login();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(Icons.login_rounded),
                                  Expanded(
                                    child: Text(
                                      d.LogIn,
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          OutlineButton(
                            onPressed: () {
                              _signUp();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  FaIcon(FontAwesomeIcons.addressCard),
                                  Expanded(
                                    child: Text(
                                      d.SignUp,
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Divider(),
                          OutlineButton(
                            onPressed: () {
                              _loginGoogle();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  FaIcon(FontAwesomeIcons.google),
                                  Expanded(
                                    child: Text(
                                      d.LoginViaGoogle,
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  void _forgotPassword() {
    Navigator.pushNamed(context, ForgotPasswordForm.route);
  }

  void _login() {
    //login using email

    //todo email validation basic format
    setState(() {
      if (email.text.isEmpty) {
        errorEmail = d.Required;
      }
      if (password.text.isEmpty) {
        errorPassword = d.Required;
      }
    });

    if (!email.text.isEmpty && !password.text.isEmpty) {
      errorPassword = null;
      errorEmail = null;
      BlocProvider.of<LoginCubit>(context)
          .signIn(email: email.text, password: password.text, method: 'email');
    }
  }

  void _loginGoogle() {
    BlocProvider.of<LoginCubit>(context)
        .signIn(email: email.text, password: password.text, method: 'google');
  }

  void _signUp() {
    Navigator.of(context).pushNamed(SignupForm.rout);
  }

  Future<void> _showEmailConfirmationDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        String errorMsg;
        TextEditingController tmp = TextEditingController();
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text(d.EmailNotVerified),
              content: Text(d.Resend_confirmation_email),
              actions: <Widget>[
                TextButton(
                  child: Text(d.Ok),
                  onPressed: () {
                    //resend confirmation email
                    BlocProvider.of<LoginCubit>(context)
                        .resendConfirmationEmail(email.text, password.text);
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text(d.Cancel),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}
