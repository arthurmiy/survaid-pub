import 'package:capimobile/core/language/language_list.dart';
import 'package:capimobile/features/interface/presentation/widgets/qrImage/qr_image.dart';
import 'package:capimobile/features/interface/presentation/widgets/qrImage/qr_versions.dart';
import 'package:flutter/material.dart';

class QrDisplay extends StatelessWidget {
  static const String route = '/qrcode';
  final String data;

  QrDisplay(this.data);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(d.QRCodeExport),
      ),
      body: Scrollbar(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:
                  EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 10),
              child: Text(
                d.QR_CODE_INSTRUCTIONS,
                style: TextStyle(fontFamily: 'SourceSansPro', fontSize: 18),
                textAlign: TextAlign.justify,
              ),
            ),
            Expanded(
                child: Center(
                    child: QrImage(
              data: data,
              version: QrVersions.auto,
              size: 320,
              gapless: false,
              foregroundColor: Theme.of(context).textTheme.bodyText1.color,
            )))
          ],
        ),
      ),
    );
  }
}
