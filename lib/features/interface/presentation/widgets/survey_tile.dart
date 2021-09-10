import 'package:capimobile/core/language/language_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class SurveyTile extends ListTile {
  SurveyTile(
      {@required String name,
      GestureTapCallback onTap,
      GestureTapCallback onEdit,
      GestureTapCallback onDelete,
      Timestamp date})
      : super(
            title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(d.formatTimeStampToDate(date),
                style: TextStyle(fontFamily: 'SourceSansPro')),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(icon: Icon(Icons.edit), onPressed: onEdit),
                IconButton(icon: Icon(Icons.delete), onPressed: onDelete)
              ],
            ),
            onTap: onTap);
}
