import 'package:capimobile/core/constants.dart';
import 'package:capimobile/core/language/language_list.dart';
import 'package:capimobile/features/interface/presentation/screens/login/user_login.dart';
import 'package:capimobile/features/interface/presentation/widgets/SectionTitle.dart';
import 'package:capimobile/features/interface/presentation/widgets/web_app_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ForgotPasswordForm extends StatefulWidget {
  static const String route = '/recoverpassword';

  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  TextEditingController email;

  @override
  void initState() {
    super.initState();
    email = TextEditingController();
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
                title: Text(d.RecoverPassword),
              ),
        body: Scrollbar(
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
                          controller: email,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            icon: FaIcon(FontAwesomeIcons.envelope),
                            labelText: d.Email,
                            labelStyle: TextStyle(fontFamily: 'SourceSansPro'),
                            suffixStyle: TextStyle(fontFamily: 'SourceSansPro'),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        OutlineButton(
                          onPressed: () {
                            _recoverPassword();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(Icons.check),
                                Expanded(
                                  child: Text(
                                    d.RecoverPassword,
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
      ),
    );
  }

  void _recoverPassword() {
    FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);
    Navigator.pop(context);
  }
}
