import 'package:capimobile/core/constants.dart';
import 'package:capimobile/core/language/language_list.dart';
import 'package:capimobile/core/licenses/licenses_repo.dart';
import 'package:capimobile/features/interface/presentation/widgets/simple_info_display.dart';
import 'package:capimobile/features/interface/presentation/widgets/web_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LicenseShow extends StatelessWidget {
  static const String route = '/licenseShow';
  final int licenseIndex;

  LicenseShow(this.licenseIndex);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MediaQuery.of(context).size.width > PAGE_WIDTH_SWITCH_APP_BAR
          ? WebAppBar(context, () {
              Navigator.popAndPushNamed(context, route);
            })
          : AppBar(
              title: Text(licenses[licenseIndex].packageName),
            ),
      body: Scrollbar(
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            constraints: BoxConstraints(maxWidth: 1000),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  licenses[licenseIndex].packageDescription != null
                      ? SimpleInfoDisplay(d.Description,
                          licenses[licenseIndex].packageDescription)
                      : Container(),
                  licenses[licenseIndex].packageVersion != null
                      ? SimpleInfoDisplay(
                          d.Version, licenses[licenseIndex].packageVersion)
                      : Container(),
                  licenses[licenseIndex].licenseType != null
                      ? SimpleInfoDisplay(
                          d.LicenseType, licenses[licenseIndex].licenseType)
                      : Container(),
                  licenses[licenseIndex].author != null
                      ? SimpleInfoDisplay(
                          d.Author, licenses[licenseIndex].author)
                      : Container(),
                  SizedBox(
                    height: 10,
                  ),
                  StreamBuilder(
                    stream: getFileData(licenses[licenseIndex].licenseText)
                        .asStream(),
                    builder: (context, data) {
                      if (!data.hasData) {
                        return CircularProgressIndicator();
                      } else {
                        return SingleChildScrollView(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            data.data,
                            style: TextStyle(fontFamily: 'SourceSansPro'),
                          ),
                        ));
                      }
                    },
                  ),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<String> getFileData(String path) async {
    return await rootBundle.loadString(path);
  }
}
