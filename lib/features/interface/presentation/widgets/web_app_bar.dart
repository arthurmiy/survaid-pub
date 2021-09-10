import 'package:capimobile/core/constants.dart';
import 'package:capimobile/core/language/dictionary_selector.dart';
import 'package:capimobile/core/language/language_list.dart';
import 'package:capimobile/features/interface/presentation/screens/about.dart';
import 'package:capimobile/features/interface/presentation/screens/about_metashape.dart';
import 'package:capimobile/features/interface/presentation/screens/best_practices_home.dart';
import 'package:capimobile/features/interface/presentation/screens/login/logged_user.dart';
import 'package:capimobile/features/interface/presentation/screens/login/user_login.dart';
import 'package:capimobile/features/interface/presentation/screens/surveys_web.dart';
import 'package:capimobile/features/interface/presentation/widgets/user_indicator.dart';
import 'package:capimobile/features/repository/presentation/cubit/login/login_cubit.dart';
import 'package:capimobile/features/repository/presentation/cubit/user/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data_getters/languageSelector.dart';
import 'link_button.dart';

class WebAppBar extends PreferredSize {
  WebAppBar(BuildContext context, GestureTapCallback refresh)
      : super(
            preferredSize: Size.fromHeight(50.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  // List button used as  Language Selector
                  child: LanguageSelector(currentLanguage, (value) {
                    currentLanguage = value;
                    saveLang(SHARED_PREF_LANGUAGE_KEY, currentLanguage);
                    d = DictionarySelector.getDictionaryByLanguage(
                        currentLanguage);
                    refresh();
                  }),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      constraints: BoxConstraints(maxWidth: 800),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          LinkButton('Home', onTap: () {
                            Navigator.of(context).pushNamed('/');
                          }),
                          LinkButton(d.Surveys, onTap: () {
                            Navigator.of(context).pushNamed(Surveys.rout);
                          }),
                          LinkButton(d.Best_Practices, onTap: () {
                            Navigator.of(context)
                                .pushNamed(BestPracticesHome.rout);
                          }),
                          LinkButton(d.AboutMetashape, onTap: () {
                            Navigator.of(context)
                                .pushNamed(AboutMetashape.route);
                          }),
                          LinkButton(d.About, onTap: () {
                            Navigator.of(context).pushNamed(About.route);
                          }),
                        ],
                      ),
                    ),
                  ),
                ),
                //Display user name or login option and redirect either to the login page or user infos page
                BlocBuilder<UserCubit, UserState>(builder: (_, state) {
                  if (state is UserLoaded) {
                    if (state.user.email == '' || state.user.email == null) {
                      return UserIndicator(
                          name: d.Login,
                          onTap: () {
                            Navigator.pushNamed(context, UserLogInForm.rout);
                          });
                    } else {
                      return Row(
                        children: [
                          UserIndicator(
                              name: state.user.name ?? d.Login,
                              url: state.user.imageUrl ?? '',
                              onTap: () {
                                Navigator.pushNamed(context, UserInfos.rout);
                              }),
                          IconButton(
                              icon: Icon(Icons.logout),
                              onPressed: () {
                                BlocProvider.of<LoginCubit>(context).signOut();
                              }),
                        ],
                      );
                    }
                  } else {
                    return LinearProgressIndicator(
                      minHeight: 40,
                    );
                  }
                }),
              ],
            ));
}
