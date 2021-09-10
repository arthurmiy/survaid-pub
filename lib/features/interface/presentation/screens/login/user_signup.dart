import 'package:capimobile/core/constants.dart';
import 'package:capimobile/core/language/language_list.dart';
import 'package:capimobile/features/interface/presentation/screens/login/user_login.dart';
import 'package:capimobile/features/interface/presentation/widgets/SectionTitle.dart';
import 'package:capimobile/features/interface/presentation/widgets/web_app_bar.dart';
import 'package:capimobile/features/repository/presentation/cubit/login/login_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignupForm extends StatefulWidget {
  static const String rout = '/signup';

  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  TextEditingController email, password, name;
  String errorPassword;
  String errorEmail;
  String errorName;

  @override
  void initState() {
    super.initState();
    email = TextEditingController();
    password = TextEditingController();
    name = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => (!kIsWeb)
          ? true
          : Navigator.push(
              context,
              MaterialPageRoute(
                  settings: RouteSettings(name: UserLogInForm.rout),
                  builder: (context) => UserLogInForm())),
      child: Scaffold(
          appBar: MediaQuery.of(context).size.width > PAGE_WIDTH_SWITCH_APP_BAR
              ? WebAppBar(context, () {
                  setState(() {});
                })
              : AppBar(
                  title: Text(d.SignUp),
                ),
          body: Scrollbar(
            child: BlocListener<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is RegisterSuccess) {
                  final snackBar = SnackBar(content: Text(d.SigUpRequested));

// Find the Scaffold in the widget tree and use it to show a SnackBar.
                  Scaffold.of(context).showSnackBar(snackBar);
                } else if (state is RegisterFailure) {
                  final snackBar = SnackBar(content: Text(state.error));

// Find the Scaffold in the widget tree and use it to show a SnackBar.
                  Scaffold.of(context).showSnackBar(snackBar);
                }
              },
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
                                icon: FaIcon(FontAwesomeIcons.userCircle),
                                labelText: d.Name,
                                errorText: errorName,
                                labelStyle:
                                    TextStyle(fontFamily: 'SourceSansPro'),
                                suffixStyle:
                                    TextStyle(fontFamily: 'SourceSansPro'),
                              ),
                              controller: name,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                icon: FaIcon(FontAwesomeIcons.envelope),
                                labelText: d.Email,
                                errorText: errorEmail,
                                labelStyle:
                                    TextStyle(fontFamily: 'SourceSansPro'),
                                suffixStyle:
                                    TextStyle(fontFamily: 'SourceSansPro'),
                              ),
                              controller: email,
                              keyboardType: TextInputType.emailAddress,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                icon: FaIcon(FontAwesomeIcons.key),
                                labelText: d.Password,
                                errorText: errorPassword,
                                labelStyle:
                                    TextStyle(fontFamily: 'SourceSansPro'),
                                suffixStyle:
                                    TextStyle(fontFamily: 'SourceSansPro'),
                              ),
                              enableSuggestions: false,
                              autocorrect: false,
                              obscureText: true,
                              controller: password,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            OutlineButton(
                              onPressed: () {
                                _signUp(context);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Icon(Icons.login_rounded),
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
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }

  void _signUp(BuildContext cont) {
    setState(() {
      if (email.text.isEmpty) {
        errorEmail = d.Required;
      }
      if (password.text.isEmpty) {
        errorPassword = d.Required;
      }
      if (password.text.length < 8) {
        errorPassword = d.PASSWORD_SIZE_ERROR;
      }
      if (name.text.isEmpty) {
        errorName = d.Required;
      }
    });

    if (!email.text.isEmpty &&
        !password.text.isEmpty &&
        !name.text.isEmpty &&
        password.text.length >= 8) {
      errorPassword = null;
      errorEmail = null;
      errorName = null;
      BlocProvider.of<LoginCubit>(context).signUp(
          email: email.text, password: password.text, userName: name.text);
    }
  }
}
