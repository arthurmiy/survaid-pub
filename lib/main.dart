import 'package:capimobile/core/constants.dart';
import 'package:capimobile/core/language/dictionary_selector.dart';
import 'package:capimobile/core/language/language_list.dart';
import 'package:capimobile/core/rout_generator.dart';
import 'package:capimobile/features/repository/presentation/cubit/camera/camera_cubit.dart';
import 'package:capimobile/features/repository/presentation/cubit/login/login_cubit.dart';
import 'package:capimobile/features/repository/presentation/cubit/survey/survey_cubit.dart';
import 'package:capimobile/features/repository/presentation/cubit/user/user_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_strategy/url_strategy.dart';
import 'injetion_container.dart' as di;

var routes;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  currentLanguage = await retrieveSavedLang(SHARED_PREF_LANGUAGE_KEY);
  DisplayInfo tmp = LanguageList.languageDisplayInfo[currentLanguage];
  if (tmp == null) {
    currentLanguage = 'en';
    saveLang(SHARED_PREF_LANGUAGE_KEY, 'en');
  }
  d = DictionarySelector.getDictionaryByLanguage(currentLanguage);
  di.init();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserCubit>(create: (_) => di.sl<UserCubit>()..appStart()),
        BlocProvider<CameraCubit>(create: (_) => di.sl<CameraCubit>()),
        BlocProvider<LoginCubit>(create: (_) => di.sl<LoginCubit>()),
        BlocProvider<SurveyCubit>(create: (_) => di.sl<SurveyCubit>()),
      ],
      child: MaterialApp(
          title: 'SurvAid',
          darkTheme: ThemeData.dark(),
          theme: ThemeData(
            primarySwatch: MaterialColor(0xFF0B0B0B, {
              50: Color.fromRGBO(239, 240, 241, .9),
              100: Color.fromRGBO(239, 240, 241, 1),
              200: Color.fromRGBO(190, 193, 197, .9),
              300: Color.fromRGBO(190, 193, 197, 1),
              400: Color.fromRGBO(127, 127, 128, .9),
              500: Color.fromRGBO(127, 127, 128, 1),
              600: Color.fromRGBO(97, 97, 97, .9),
              700: Color.fromRGBO(97, 97, 97, 1),
              800: Color.fromRGBO(11, 11, 11, .9),
              900: Color.fromRGBO(11, 11, 11, 1),
            }),
            visualDensity: VisualDensity.adaptivePlatformDensity,
            fontFamily: 'Montserrat',
            scaffoldBackgroundColor: Color.fromRGBO(239, 240, 241, 1),
          ),
          initialRoute: '/',
          onGenerateRoute: (settings) {
            return RoutGenerator.generateRoute(settings);
          }),
    );
  }
}
