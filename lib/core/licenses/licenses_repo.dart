import 'license_infos_struct.dart';

/*

  shared_preferences
  equatable
  cloud_firestore
  firebase_core
  firebase_auth
  google_sign_in
  flutter_svg
  font_awesome_flutter
  wave_slider
  flutter_switch
  toggle_switch
  flutter_bloc
  get_it
  pdf
  open_file
  path_provider
  printing
  qr_flutter
  majascan
  floating_action_bubble
  simple_animated_icon
  url_launcher
 */

final List<LicenseInfo> licenses = [
  LicenseInfo(
      packageName: 'country_icons',
      licenseText: 'licenses/country_icons.txt',
      packageVersion: '1.1.1',
      licenseType: 'BSD',
      packageDescription: 'Provides icons of flags',
      pageLink: 'https://github.com/bytepark/country_icons',
      author: 'bytepark'),
  LicenseInfo(
      packageName: 'shared_preferences',
      licenseText: 'licenses/shared_preferences.txt',
      packageVersion: '0.5.3',
      packageDescription: 'Gives access to local storage in a key-value way',
      author: 'The Chromium Authors',
      licenseType: 'BSD',
      pageLink:
          'https://github.com/flutter/plugins/tree/master/packages/shared_preferences/shared_preferences'),
  LicenseInfo(
      packageName: 'equatable',
      licenseText: 'licenses/equatable.txt',
      packageVersion: '1.2.5',
      pageLink: 'https://github.com/felangel/equatable',
      licenseType: 'MIT',
      author: 'Felix Angelov',
      packageDescription: 'Simplify equality comparisons'),
  LicenseInfo(
      packageName: 'cloud_firestore',
      licenseText: 'licenses/cloud_firestore.txt',
      packageVersion: '0.14',
      licenseType: 'BSD',
      author: 'The Chromium Authors',
      packageDescription: 'Plugin to use Cloud Firestore API',
      pageLink: 'https://github.com/FirebaseExtended/flutterfire'),
  LicenseInfo(
      packageName: 'firebase_core',
      licenseText: 'licenses/firebase_core.txt',
      packageVersion: '0.5.3',
      licenseType: 'BSD',
      author: 'The Chromium Authors',
      packageDescription: 'Enables connecting Firebase apps',
      pageLink: 'https://github.com/FirebaseExtended/flutterfire'),
  LicenseInfo(
      packageName: 'firebase_auth',
      licenseText: 'licenses/firebase_auth.txt',
      packageVersion: '0.18.4',
      licenseType: 'BSD',
      author: 'The Chromium Authors',
      packageDescription: 'Plugin to use the Firebase Authentication API',
      pageLink: 'https://github.com/FirebaseExtended/flutterfire'),
  LicenseInfo(
      packageName: 'google_sign_in',
      licenseText: 'licenses/google_sign_in.txt',
      packageVersion: '4.5.9',
      licenseType: 'BSD',
      author: 'The Flutter pjt. Authors',
      packageDescription: 'Plugin to use the Google Sign In',
      pageLink: 'https://github.com/flutter/plugins'),
  LicenseInfo(
    packageName: 'flutter_svg',
    licenseText: 'licenses/flutter_svg.txt',
    packageVersion: '0.18.1',
    licenseType: 'MIT',
    packageDescription: 'Draws SVG in a widget',
    author: 'Dan Field',
    pageLink: 'https://github.com/dnfield/flutter_svg',
  ),
  LicenseInfo(
      packageName: 'font_awesome_flutter',
      licenseText: 'licenses/font_awesome_flutter.txt',
      packageVersion: '8.11.0',
      licenseType: 'MIT',
      author: 'Brian Egan',
      packageDescription: 'Icon Pack',
      pageLink: 'https://github.com/fluttercommunity/font_awesome_flutter'),
  LicenseInfo(
      packageName: 'wave_slider',
      licenseText: 'licenses/wave_slider.txt',
      packageVersion: '0.2.0',
      author: 'Fun with Flutter',
      packageDescription: 'Slider',
      licenseType: 'BSD',
      pageLink: 'https://github.com/funwithflutter/wave-slider'),
  LicenseInfo(
      packageName: 'flutter_switch',
      licenseText: 'licenses/flutter_switch.txt',
      packageVersion: '0.2.0',
      licenseType: 'BSD',
      packageDescription: 'Custom switch package',
      author: 'Nichole John Romero',
      pageLink: 'https://github.com/boringdeveloper/FlutterSwitch'),
  LicenseInfo(
      packageName: 'toggle_switch',
      licenseText: 'licenses/toggle_switch.txt',
      packageVersion: '0.1.8',
      licenseType: 'MIT',
      author: 'Pramod Joshi',
      packageDescription: 'Toggle switch',
      pageLink: 'https://github.com/PramodJoshi/toggle_switch'),
  LicenseInfo(
      packageName: 'flutter_bloc',
      licenseText: 'licenses/flutter_bloc.txt',
      packageVersion: '6.1.1',
      author: 'Felix Angelov',
      licenseType: 'MIT',
      packageDescription: 'Library to implement bloc and cubit patterns',
      pageLink: 'https://bloclibrary.dev/#/'),
  LicenseInfo(
      packageName: 'get_it',
      licenseText: 'licenses/get_it.txt',
      packageVersion: '5.0.3',
      licenseType: 'MIT',
      author: 'Thomas Burkhart',
      packageDescription: 'Service Locator',
      pageLink: 'https://github.com/fluttercommunity/get_it'),
  LicenseInfo(
      packageName: 'pdf',
      licenseText: 'licenses/pdf.txt',
      packageVersion: '2.0.0',
      licenseType: 'Apache 2.0',
      author: 'David PHAM-VAN',
      packageDescription: 'Pdf tool for flutter',
      pageLink: 'https://github.com/DavBfr/dart_pdf/tree/master/pdf'),
  LicenseInfo(
      packageName: 'open_file',
      licenseText: 'licenses/open_file.txt',
      packageVersion: '3.0.3',
      author: 'crazecoder',
      licenseType: 'BSD',
      packageDescription: 'Open files with native app',
      pageLink: 'https://github.com/crazecoder/open_file'),
  LicenseInfo(
      packageName: 'path_provider',
      licenseText: 'licenses/path_provider.txt',
      packageVersion: '1.6.27',
      licenseType: 'BSD',
      author: 'The Flutter Pjt. Authors',
      packageDescription: 'Provides paths easily',
      pageLink:
          'https://github.com/flutter/plugins/tree/master/packages/path_provider/path_provider'),
  LicenseInfo(
      packageName: 'printing',
      licenseText: 'licenses/printing.txt',
      packageVersion: '4.0.0',
      licenseType: 'Apache 2.0',
      author: 'David PHAM-VAN',
      packageDescription: 'Print tool for flutter',
      pageLink: 'https://github.com/DavBfr/dart_pdf/tree/master/printing'),
  LicenseInfo(
      packageName: 'qr_flutter',
      licenseText: 'licenses/qr_flutter.txt',
      packageVersion: '3.2.0',
      author: 'Luke Freeman',
      licenseType: 'BSD',
      packageDescription: 'Qr code generator',
      pageLink: 'https://github.com/theyakka/qr.flutter'),
  LicenseInfo(
      packageName: 'majascan',
      licenseText: 'licenses/majascan.txt',
      packageVersion: '0.3.7',
      packageDescription: 'QR Code Reader',
      licenseType: 'MIT',
      pageLink: 'https://maja0270558.github.io/majascan_flutter/'),
  LicenseInfo(
      packageName: 'floating_action_bubble',
      licenseText: 'licenses/floating_action_bubble.txt',
      packageVersion: '1.1.2',
      licenseType: 'MIT',
      author: 'darshan',
      packageDescription: 'Animated FAB with options',
      pageLink: 'https://github.com/Darshan0/floating_action_bubble'),
  LicenseInfo(
      packageName: 'simple_animated_icon',
      licenseText: 'licenses/simple_animated_icon.txt',
      packageVersion: '1.0.0',
      licenseType: 'MIT',
      author: 'Charlee Li',
      packageDescription: 'Animated icon widget',
      pageLink: 'https://github.com/charlee/simple_animated_icon'),
  LicenseInfo(
      packageName: 'url_launcher',
      licenseText: 'licenses/url_launcher.txt',
      packageVersion: '5.7.10',
      author: 'The Chromium Authors',
      licenseType: 'BSD',
      packageDescription: 'Link invocation',
      pageLink:
          'https://github.com/flutter/plugins/tree/master/packages/url_launcher/url_launcher'),
  LicenseInfo(
      packageName: 'tinycolor',
      licenseText: 'licenses/tinycolor.txt',
      packageDescription: 'Additional Color Function',
      licenseType: 'MIT',
      author: 'Foo Studio',
      packageVersion: '1.0.3',
      pageLink: 'https://github.com/FooStudio/tinycolor')
];
