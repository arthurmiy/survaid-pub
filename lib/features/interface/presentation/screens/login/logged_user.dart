//displays user data

import 'package:capimobile/core/constants.dart';
import 'package:capimobile/core/language/language_list.dart';
import 'package:capimobile/features/interface/presentation/screens/login/user_login.dart';
import 'package:capimobile/features/interface/presentation/widgets/login/user_info_line.dart';
import 'package:capimobile/features/interface/presentation/widgets/user_indicator.dart';
import 'package:capimobile/features/interface/presentation/widgets/web_app_bar.dart';
import 'package:capimobile/features/repository/presentation/cubit/login/login_cubit.dart';
import 'package:capimobile/features/repository/presentation/cubit/survey/survey_cubit.dart';
import 'package:capimobile/features/repository/presentation/cubit/user/user_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home_web.dart';

class UserInfos extends StatefulWidget {
  static const String rout = '/userinfos';

  @override
  _UserInfosState createState() => _UserInfosState();
}

class _UserInfosState extends State<UserInfos> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SurveyCubit>(context).getSurveys();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MediaQuery.of(context).size.width > PAGE_WIDTH_SWITCH_APP_BAR
            ? WebAppBar(context, () {
                setState(() {});
              })
            : AppBar(
                title: Text(d.UserProfile),
                actions: [
                  IconButton(
                      icon: Icon(Icons.logout),
                      onPressed: () {
                        _logOut(context);
                      })
                ],
              ),
        body: Scrollbar(
          child: BlocListener<UserCubit, UserState>(listener: (context, state) {
            if (state is UserLoaded) {
              if (state.user.email == null) {
                Navigator.popAndPushNamed(context, UserLogInForm.rout);
              }
            }
          }, child: BlocBuilder<UserCubit, UserState>(builder: (_, state) {
            if (state is UserLoaded) {
              return Align(
                alignment: Alignment.topCenter,
                child: Container(
                  constraints: BoxConstraints(maxWidth: 800),
                  child: SingleChildScrollView(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            CircleAvatar(
                              radius: 80,
                              backgroundColor: Colors.transparent,
                              backgroundImage:
                                  getAvatarImageProvider(state.user.imageUrl),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            UserInfoLine(d.Name, state.user.name ?? ''),
                            SizedBox(
                              height: 10,
                            ),
                            UserInfoLine(d.Email, state.user.email ?? ''),
                            SizedBox(
                              height: 10,
                            ),
                            BlocBuilder<SurveyCubit, SurveyState>(
                                builder: (_, sur) {
                              if (sur is SurveyLoaded) {
                                return UserInfoLine(
                                    d.Surveys, sur.survey.length.toString());
                              } else {
                                return UserInfoLine(d.Surveys, '0');
                              }
                            }),
                            SizedBox(
                              height: 40,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return CircularProgressIndicator();
            }
          })),
        ));
  }

  void _logOut(BuildContext context) {
    BlocProvider.of<LoginCubit>(context).signOut();
  }
}
