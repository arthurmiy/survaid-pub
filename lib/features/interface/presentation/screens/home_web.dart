import 'dart:io';

import 'package:capimobile/core/constants.dart';
import 'package:capimobile/core/language/dictionary_selector.dart';
import 'package:capimobile/core/language/language_list.dart';
import 'package:capimobile/features/interface/presentation/screens/about.dart';
import 'package:capimobile/features/interface/presentation/screens/about_metashape.dart';
import 'package:capimobile/features/interface/presentation/screens/login/user_login.dart';

import 'package:capimobile/features/interface/presentation/screens/best_practices_home.dart';
import 'package:capimobile/features/interface/presentation/screens/surveys_web.dart';

import 'package:capimobile/features/interface/presentation/widgets/data_getters/languageSelector.dart';
import 'package:capimobile/features/interface/presentation/widgets/user_indicator.dart';
import 'package:capimobile/features/interface/presentation/widgets/web_app_bar.dart';
import 'package:capimobile/features/repository/presentation/cubit/user/user_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tinycolor/tinycolor.dart';

import 'login/logged_user.dart';

class HomeScreen extends StatefulWidget {
  static const String rout = "/";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<UserCubit>(context).appStart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MediaQuery.of(context).size.width > PAGE_WIDTH_SWITCH_APP_BAR
            ? WebAppBar(context, () {
                setState(() {});
              })
            : PreferredSize(
                preferredSize: Size.fromHeight(50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      // List button used as  Language Selector
                      child: LanguageSelector(currentLanguage, (value) {
                        setState(() {
                          currentLanguage = value;
                          saveLang(SHARED_PREF_LANGUAGE_KEY, currentLanguage);
                          d = DictionarySelector.getDictionaryByLanguage(
                              currentLanguage);
                        });
                      }),
                    ),

                    //Display user name or login option and redirect either to the login page or user infos page
                    BlocBuilder<UserCubit, UserState>(builder: (_, state) {
                      if (state is UserLoaded) {
                        if (state.user.email == '' ||
                            state.user.email == null) {
                          return UserIndicator(
                              name: d.Login,
                              onTap: () {
                                Navigator.pushNamed(
                                    context, UserLogInForm.rout);
                              });
                        } else {
                          return UserIndicator(
                              name: state.user.name ?? d.Login,
                              url: state.user.imageUrl ?? '',
                              onTap: () {
                                Navigator.pushNamed(context, UserInfos.rout);
                              });
                        }
                      } else {
                        return LinearProgressIndicator(
                          minHeight: 40,
                        );
                      }
                    }),
                  ],
                ),
              ),
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          int count = 1;
          double heightToCalc =
              constraints.maxHeight > 500 ? constraints.maxHeight : 500;
          double aR = constraints.maxWidth / ((heightToCalc - 200) / 2);
          if (constraints.maxWidth > 700) {
            count = 2;
            aR = constraints.maxWidth / ((heightToCalc - 200) * 2);
          }
          return Scrollbar(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: count,
                    childAspectRatio: aR,
                    children: [
                      Image.asset(
                        'images/logo.png',
                        fit: BoxFit.contain,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          constraints:
                              BoxConstraints(maxWidth: 400, maxHeight: 400),
                          child: MediaQuery.of(context).size.width >
                                  PAGE_WIDTH_SWITCH_APP_BAR
                              ? Column(
                                  children: [
                                    Text(
                                      d.APPNAME,
                                      style:
                                          Theme.of(context).textTheme.headline2,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        kIsWeb
                                            ? d.ABOUT_INTRO_WEB
                                            : d.ABOUT_INTRO,
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                            fontFamily: 'SourceSansPro',
                                            fontSize: 18),
                                      ),
                                    ),
                                  ],
                                )
                              : Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20),
                                      //Button - access to the surveys page
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, Surveys.rout);
                                        },
                                        style: TextButton.styleFrom(
                                                backgroundColor:
                                                    Theme.of(context)
                                                        .colorScheme
                                                        .primary
                                                        .lighten(20))
                                            .copyWith(
                                                foregroundColor:
                                                    MaterialStateProperty.all<
                                                            Color>(
                                                        Theme.of(context)
                                                            .colorScheme
                                                            .onPrimary)),
                                        child: Text(
                                          d.Surveys,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    // Button - access to the best practices page
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20),
                                      child: FlatButton(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, BestPracticesHome.rout);
                                        },
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary
                                            .lighten(25),
                                        textColor: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                        child: Text(
                                          d.Best_Practices,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20),
                                      child: FlatButton(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, AboutMetashape.route);
                                        },
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary
                                            .lighten(30),
                                        textColor: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                        child: Text(
                                          d.AboutMetashape,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20),
                                      child: FlatButton(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, About.route);
                                        },
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary
                                            .lighten(35),
                                        textColor: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                        child: Text(
                                          d.About,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
