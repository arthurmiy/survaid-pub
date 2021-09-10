import 'package:meta/meta.dart';

class LicenseInfo {
  String packageName;
  String packageVersion;
  String packageDescription;
  String author;
  String pageLink;
  String licenseText;
  String licenseType;

  LicenseInfo({
    @required this.packageName,
    this.packageVersion,
    this.packageDescription,
    this.author,
    this.pageLink,
    @required this.licenseText,
    this.licenseType,
  });
}
