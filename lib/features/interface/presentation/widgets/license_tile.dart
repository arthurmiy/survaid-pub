import 'package:capimobile/core/language/language_list.dart';
import 'package:flutter/material.dart';

class LicenseTile extends ListTile {
  LicenseTile({
    @required String licenseName,
    String version,
    String type,
    String author,
    GestureTapCallback onTap,
  }) : super(
            title: Row(
              children: [
                Icon((Icons.arrow_right)),
                Expanded(
                  child: Text(
                    licenseName ?? '',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(left: 25, top: 8, bottom: 8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  version != null
                      ? Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '${d.Version}: ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Expanded(
                                  child: Text(
                                version,
                                style: TextStyle(fontFamily: 'SourceSansPro'),
                              ))
                            ],
                          ),
                        )
                      : Container(),
                  author != null
                      ? Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '${d.Author}: ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Expanded(
                                  child: Text(author,
                                      style: TextStyle(
                                          fontFamily: 'SourceSansPro')))
                            ],
                          ),
                        )
                      : Container(),
                  type != null
                      ? Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '${d.LicenseType}: ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Expanded(
                                  child: Text(type,
                                      style: TextStyle(
                                          fontFamily: 'SourceSansPro')))
                            ],
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
            onTap: onTap);
}
