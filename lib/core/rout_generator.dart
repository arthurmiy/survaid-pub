import 'package:capimobile/features/interface/presentation/screens/about.dart';
import 'package:capimobile/features/interface/presentation/screens/about_metashape.dart';
import 'package:capimobile/features/interface/presentation/screens/best_practices/big_picture.dart';
import 'package:capimobile/features/interface/presentation/screens/best_practices/fast_n_furious.dart';
import 'package:capimobile/features/interface/presentation/screens/best_practices/fixed_point.dart';
import 'package:capimobile/features/interface/presentation/screens/best_practices/know_thy_enemy.dart';
import 'package:capimobile/features/interface/presentation/screens/best_practices/let_there_be_light.dart';
import 'package:capimobile/features/interface/presentation/screens/best_practices/power_to_the_people.dart';
import 'package:capimobile/features/interface/presentation/screens/best_practices/rome_wasnt_build.dart';
import 'package:capimobile/features/interface/presentation/screens/camera_register.dart';
import 'package:capimobile/features/interface/presentation/screens/edit_survey.dart';
import 'package:capimobile/features/interface/presentation/screens/help_me/help_dimensions.dart';
import 'package:capimobile/features/interface/presentation/screens/help_me/help_general.dart';
import 'package:capimobile/features/interface/presentation/screens/home_web.dart';
// if (dart.library.io) 'package:capimobile/features/interface/presentation/screens/home.dart';

import 'package:capimobile/features/interface/presentation/screens/license_show.dart';
import 'package:capimobile/features/interface/presentation/screens/login/forgot_password.dart';
import 'package:capimobile/features/interface/presentation/screens/login/logged_user.dart';
import 'package:capimobile/features/interface/presentation/screens/login/user_login.dart';
import 'package:capimobile/features/interface/presentation/screens/login/user_signup.dart';
import 'package:capimobile/features/interface/presentation/screens/qr_Code.dart';
import 'package:capimobile/features/interface/presentation/screens/surveys_web.dart'
    if (dart.library.io) 'package:capimobile/features/interface/presentation/screens/surveys.dart';
import 'package:capimobile/features/interface/presentation/screens/view_survey.dart';
import 'package:capimobile/features/interface/presentation/screens/best_practices_home.dart';
import 'package:capimobile/features/interface/presentation/widgets/data_getters/camera_selector.dart';

import 'package:flutter/material.dart';

class RoutGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (context) => HomeScreen(),
            settings: RouteSettings(name: '/'));
      case HelpDimensions.route:
        return MaterialPageRoute(
            builder: (context) => HelpDimensions(),
            settings: RouteSettings(name: HelpDimensions.route));
      case HelpGeneral.route:
        return MaterialPageRoute(
            builder: (context) => HelpGeneral(),
            settings: RouteSettings(name: HelpGeneral.route));
      case Surveys.rout:
        return MaterialPageRoute(
            builder: (context) => Surveys(),
            settings: RouteSettings(name: Surveys.rout));

      case EditSurvey.route:
        return MaterialPageRoute(
          builder: (context) =>
              EditSurvey(settings?.arguments as EditSurveyArguments),
        );
      case ViewSurvey.route:
        return MaterialPageRoute(
            builder: (context) => ViewSurvey(),
            settings: RouteSettings(name: ViewSurvey.route));

      case BestPracticesHome.rout:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => BestPracticesHome(),
            transitionDuration: Duration(milliseconds: 500),
            reverseTransitionDuration: Duration(milliseconds: 500),
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c),
            settings: RouteSettings(name: BestPracticesHome.rout));
      case BigPicture.rout:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => BigPicture(),
            transitionDuration: Duration(milliseconds: 500),
            reverseTransitionDuration: Duration(milliseconds: 500),
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c),
            settings: RouteSettings(name: BigPicture.rout));
      case FastNFurious.rout:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => FastNFurious(),
            transitionDuration: Duration(milliseconds: 500),
            reverseTransitionDuration: Duration(milliseconds: 500),
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c),
            settings: RouteSettings(name: FastNFurious.rout));
      case FixedPoint.rout:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => FixedPoint(),
            transitionDuration: Duration(milliseconds: 500),
            reverseTransitionDuration: Duration(milliseconds: 500),
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c),
            settings: RouteSettings(name: FixedPoint.rout));
      case KnowThyEnemy.rout:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => KnowThyEnemy(),
            transitionDuration: Duration(milliseconds: 500),
            reverseTransitionDuration: Duration(milliseconds: 500),
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c),
            settings: RouteSettings(name: KnowThyEnemy.rout));
      case LetThereBeLight.rout:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => LetThereBeLight(),
            transitionDuration: Duration(milliseconds: 500),
            reverseTransitionDuration: Duration(milliseconds: 500),
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c),
            settings: RouteSettings(name: LetThereBeLight.rout));
      case PowerToThePeople.rout:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => PowerToThePeople(),
            transitionDuration: Duration(milliseconds: 500),
            reverseTransitionDuration: Duration(milliseconds: 500),
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c),
            settings: RouteSettings(name: PowerToThePeople.rout));
      case RomeWasntBuild.rout:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => RomeWasntBuild(),
            transitionDuration: Duration(milliseconds: 500),
            reverseTransitionDuration: Duration(milliseconds: 500),
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c),
            settings: RouteSettings(name: RomeWasntBuild.rout));
      case AboutMetashape.route:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => AboutMetashape(),
            transitionDuration: Duration(milliseconds: 500),
            reverseTransitionDuration: Duration(milliseconds: 500),
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c),
            settings: RouteSettings(name: AboutMetashape.route));
      case About.route:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => About(),
            transitionDuration: Duration(milliseconds: 500),
            reverseTransitionDuration: Duration(milliseconds: 500),
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c),
            settings: RouteSettings(name: About.route));
      case UserLogInForm.rout:
        return MaterialPageRoute(
            builder: (context) => UserLogInForm(),
            settings: RouteSettings(name: UserLogInForm.rout));
      case SignupForm.rout:
        return MaterialPageRoute(
            builder: (context) => SignupForm(),
            settings: RouteSettings(name: SignupForm.rout));
      case UserInfos.rout:
        return MaterialPageRoute(
            builder: (context) => UserInfos(),
            settings: RouteSettings(name: UserInfos.rout));
      case ForgotPasswordForm.route:
        return MaterialPageRoute(
            builder: (context) => ForgotPasswordForm(),
            settings: RouteSettings(name: ForgotPasswordForm.route));
      case QrDisplay.route:
        return MaterialPageRoute(
            builder: (context) => QrDisplay(args),
            settings: RouteSettings(name: QrDisplay.route));
      case LicenseShow.route:
        return MaterialPageRoute(
            builder: (context) => LicenseShow(args),
            settings: RouteSettings(name: LicenseShow.route));
      case CameraRegister.route:
        return MaterialPageRoute(
            builder: (context) {
              if (args == null) {
                return CameraRegister(CameraSelector.DEFAULT);
              } else {
                return CameraRegister(args);
              }
            },
            settings: RouteSettings(name: CameraRegister.route));
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
          centerTitle: true,
        ),
        body: Center(
          child: Text('Page not found!'),
        ),
      );
    });
  }
}
