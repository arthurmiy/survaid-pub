/*
 * Copyright (C) 2017, David PHAM-VAN <dev.nfet.net@gmail.com>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import 'dart:async';
import 'dart:math';
import 'dart:typed_data';

import 'package:capimobile/core/language/language_list.dart';
import 'package:capimobile/features/calculator/functions/fotos_per_spot_calculator.dart';
import 'package:capimobile/features/calculator/functions/images_number_per_line_calculator.dart';
import 'package:capimobile/features/calculator/functions/number_of_lines_calculator.dart';
import 'package:capimobile/features/calculator/functions/photo_spacing_calculator.dart';
import 'package:capimobile/features/calculator/helper/stringfy.dart';
import 'package:capimobile/features/interface/presentation/screens/view_survey.dart';
import 'package:capimobile/features/interface/presentation/widgets/data_getters/photo_orientation_select.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

const PdfColor gray = PdfColor.fromInt(0xffd0d0d0);
const PdfColor greyVariation = PdfColor.fromInt(0xfff0f0f0);
const PdfColor grayDark = PdfColor.fromInt(0xff707070);
const PdfColor red = PdfColor.fromInt(0xffff7070);

const sep = 120.0;

Future<Uint8List> generateResume(PdfPageFormat format) async {
  final doc = pw.Document(title: 'CapiMobile-PDF', author: 'SurvAid');

  // final profileImage = pw.MemoryImage(
  //   (await rootBundle.load('images/capturar.png')).buffer.asUint8List(),
  // );

  final pageTheme = await _myPageTheme(format);
  final pageTheme2 = await _myPageTheme2(format);

  doc.addPage(
    pw.MultiPage(
      pageTheme: pageTheme,
      footer: (pw.Context context) {
        return pw.Container(
            decoration: pw.BoxDecoration(
                border: pw.Border(top: pw.BorderSide(color: gray, width: 2))),
            alignment: pw.Alignment.centerRight,
            margin: const pw.EdgeInsets.only(top: 1.0 * PdfPageFormat.cm),
            child: pw.Text('${context.pageNumber}/${context.pagesCount}',
                style: pw.Theme.of(context)
                    .defaultTextStyle
                    .copyWith(color: PdfColors.black)));
      },
      build: (pw.Context context) => [
        pw.Partitions(
          children: [
            pw.Partition(
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.stretch,
                children: <pw.Widget>[
                  //////////////////////////cabeçalho
                  pw.Container(
                    padding: const pw.EdgeInsets.only(bottom: 20),
                    child: pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: <pw.Widget>[
                          pw.Text(d.APPNAME.toUpperCase(),
                              textScaleFactor: 2,
                              style: pw.Theme.of(context)
                                  .defaultTextStyle
                                  .copyWith(fontWeight: pw.FontWeight.bold)),
                          pw.Padding(padding: const pw.EdgeInsets.only(top: 5)),
                          pw.Text(
                              '${d.SurveyOverview} - ${d.formatTimeStampToDate(pdfDataSrc.time)}',
                              textScaleFactor: 1.2,
                              style: pw.Theme.of(context)
                                  .defaultTextStyle
                                  .copyWith(
                                    fontWeight: pw.FontWeight.bold,
                                    color: grayDark,
                                  )),
                        ]),
                  ),
                  /////////////////////////////provided data
                  pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Header(
                            level: 0,
                            title: d.ProvidedData,
                            child: pw.Row(
                                mainAxisAlignment:
                                    pw.MainAxisAlignment.spaceBetween,
                                children: <pw.Widget>[
                                  pw.Text(d.ProvidedData,
                                      textScaleFactor: 2,
                                      style: pw.TextStyle(
                                          fontWeight: pw.FontWeight.bold)),
                                ])),
                        pw.Container(
                            decoration: const pw.BoxDecoration(
                              color: greyVariation,
                              borderRadius:
                                  pw.BorderRadius.all(pw.Radius.circular(6)),
                            ),
                            margin:
                                const pw.EdgeInsets.only(bottom: 10, top: 0),
                            padding: const pw.EdgeInsets.fromLTRB(10, 7, 10, 4),
                            child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  _Category(pw.IconData(0x0061),
                                      title: d.OutcropData),
                                  pw.Row(
                                      mainAxisAlignment:
                                          pw.MainAxisAlignment.spaceBetween,
                                      children: [
                                        pw.Column(
                                            mainAxisAlignment:
                                                pw.MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                pw.CrossAxisAlignment.start,
                                            children: [
                                              _Block(
                                                  title: d.OutcropWidth,
                                                  icon:
                                                      const pw.IconData(0xe530),
                                                  value: sfy.outcropWidth),
                                              _Block(
                                                  title: d.OutcropHeight,
                                                  icon:
                                                      const pw.IconData(0xe530),
                                                  value: sfy.outcropHeigth),
                                              _Block(
                                                  title: d.OutcropDistance,
                                                  icon:
                                                      const pw.IconData(0xe530),
                                                  value: sfy.outcropDist),
                                            ]),
                                        pw.Column(
                                            crossAxisAlignment:
                                                pw.CrossAxisAlignment.start,
                                            children: [
                                              _Block(
                                                  title: d.Gsd,
                                                  icon:
                                                      const pw.IconData(0xe530),
                                                  value: sfy.gsd),
                                              _Block(
                                                  title: d.VerticalStructures,
                                                  icon:
                                                      const pw.IconData(0xe530),
                                                  value: (pdfDataSrc
                                                          .verticalStructures)
                                                      ? d.Yes
                                                      : d.No),
                                              _Block(
                                                  title: d.HorizontalStructures,
                                                  icon:
                                                      const pw.IconData(0xe530),
                                                  value: (pdfDataSrc
                                                          .horizontalStructures)
                                                      ? d.Yes
                                                      : d.No),
                                            ]),
                                      ])
                                ])),
                      ]),
                  pw.Container(width: 20),
                  pw.Container(
                      decoration: const pw.BoxDecoration(
                        color: greyVariation,
                        borderRadius:
                            pw.BorderRadius.all(pw.Radius.circular(6)),
                      ),
                      margin: const pw.EdgeInsets.only(bottom: 10, top: 0),
                      padding: const pw.EdgeInsets.fromLTRB(10, 7, 10, 4),
                      child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            _Category(pw.IconData(0x0065), title: d.CameraData),
                            pw.Row(
                                mainAxisAlignment:
                                    pw.MainAxisAlignment.spaceBetween,
                                children: [
                                  pw.Column(
                                      mainAxisAlignment:
                                          pw.MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          pw.CrossAxisAlignment.start,
                                      children: [
                                        _Block(
                                            title: d.SensorWidthMm,
                                            icon: const pw.IconData(0xe530),
                                            value: sfy.sensorWidthMm),
                                        _Block(
                                            title: d.SensorHeightMm,
                                            icon: const pw.IconData(0xe530),
                                            value: sfy.sensorHeightMm),
                                        _Block(
                                            title: d.SersorWidthPx,
                                            icon: const pw.IconData(0xe530),
                                            value: sfy.sensorWidthPx),
                                      ]),
                                  pw.Column(
                                      crossAxisAlignment:
                                          pw.CrossAxisAlignment.start,
                                      children: [
                                        _Block(
                                            title: d.SensorHeightPx,
                                            icon: const pw.IconData(0xe530),
                                            value: sfy.sensorHeightPx),
                                        _Block(
                                            title: d.FocalLength,
                                            icon: const pw.IconData(0xe530),
                                            value: sfy.focalLength),
                                        _Block(
                                            title: d.PhotoOrientation,
                                            icon: const pw.IconData(0xe530),
                                            value:
                                                (pdfDataSrc.photoOrientation ==
                                                        PhotoOrientationSelector
                                                            .LANDSCAPE
                                                            .toString())
                                                    ? d.Landscape
                                                    : d.Portrait),
                                      ]),
                                ])
                          ])),
                  pw.Header(
                      level: 0,
                      title: d.OverlapConfiguration,
                      child: pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: <pw.Widget>[
                            pw.Text(d.OverlapConfiguration, textScaleFactor: 2),
                          ])),
                  pw.Container(
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.stretch,
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: <pw.Widget>[
                        pw.Row(
                            mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                            children: <pw.Widget>[
                              _Percent(
                                  size: 60,
                                  value:
                                      pdfDataSrc.frontOverlap.toDouble() / 100,
                                  title: pw.Text(d.FrontOverlap)),
                              _Percent(
                                  size: 60,
                                  value:
                                      pdfDataSrc.sideOverlap.toDouble() / 100,
                                  title: pw.Text(d.SideOverlap)),
                            ]),
                      ],
                    ),
                  ),

                  /////////////////////Results
                  pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Header(
                            level: 0,
                            title: d.Results,
                            child: pw.Row(
                                mainAxisAlignment:
                                    pw.MainAxisAlignment.spaceBetween,
                                children: <pw.Widget>[
                                  pw.Text(d.Results,
                                      textScaleFactor: 2,
                                      style: pw.TextStyle(
                                          fontWeight: pw.FontWeight.bold)),
                                ])),
                        pw.Container(
                            decoration: const pw.BoxDecoration(
                              color: greyVariation,
                              borderRadius:
                                  pw.BorderRadius.all(pw.Radius.circular(6)),
                            ),
                            margin:
                                const pw.EdgeInsets.only(bottom: 10, top: 0),
                            padding: const pw.EdgeInsets.fromLTRB(10, 7, 10, 4),
                            child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  _Category(pw.IconData(0x0066),
                                      title: d.FootPrint),
                                  pw.Row(
                                      mainAxisAlignment:
                                          pw.MainAxisAlignment.spaceBetween,
                                      children: [
                                        pw.Column(
                                            mainAxisAlignment:
                                                pw.MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                pw.CrossAxisAlignment.start,
                                            children: [
                                              _Block(
                                                  title: d.FootprintWidth,
                                                  icon:
                                                      const pw.IconData(0xe530),
                                                  value: sfy.footprintWidth),
                                              _Block(
                                                  title: d.FootPrintHeight,
                                                  icon:
                                                      const pw.IconData(0xe530),
                                                  value: sfy.footprintHeight),
                                            ]),
                                      ])
                                ])),
                      ]),
                  pw.Container(width: 20),
                  pw.Container(
                      decoration: const pw.BoxDecoration(
                        color: greyVariation,
                        borderRadius:
                            pw.BorderRadius.all(pw.Radius.circular(6)),
                      ),
                      margin: const pw.EdgeInsets.only(bottom: 10, top: 0),
                      padding: const pw.EdgeInsets.fromLTRB(10, 7, 10, 4),
                      child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            _Category(pw.IconData(0x0066),
                                title: d.CaptureAndProcessing),
                            pw.Row(
                                mainAxisAlignment:
                                    pw.MainAxisAlignment.spaceBetween,
                                children: [
                                  pw.Column(
                                      mainAxisAlignment:
                                          pw.MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          pw.CrossAxisAlignment.start,
                                      children: [
                                        _Block(
                                            title: d.AmountOfPhotos,
                                            icon: const pw.IconData(0xe530),
                                            value: sfy.photosAmount),
                                        _Block(
                                            title: d.NumberOfLines,
                                            icon: const pw.IconData(0xe530),
                                            value: sfy.linesAmount),
                                        _Block(
                                            title: d.PhotosPerSpot,
                                            icon: const pw.IconData(0xe530),
                                            value: sfy.photosPerSpot),
                                      ]),
                                  pw.Column(
                                      crossAxisAlignment:
                                          pw.CrossAxisAlignment.start,
                                      children: [
                                        _Block(
                                            title: d.SpaceBetweenPhotos,
                                            icon: const pw.IconData(0xe530),
                                            value: sfy.photoSpacing),
                                        _Block(
                                            title: d.SpaceBetweenLines,
                                            icon: const pw.IconData(0xe530),
                                            value: sfy.lineSpacing),
                                        // _Block(
                                        //     title: d.EstimatedProcessTime,
                                        //     icon: const pw.IconData(0xe530),
                                        //     value: sfy.processTime),
                                      ]),
                                ])
                          ])),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
  doc.addPage(pw.MultiPage(
      pageTheme: pageTheme2,
      footer: (pw.Context context) {
        return pw.Container(
            decoration: pw.BoxDecoration(
                border: pw.Border(top: pw.BorderSide(color: gray, width: 2))),
            alignment: pw.Alignment.centerRight,
            margin: const pw.EdgeInsets.only(top: 1.0 * PdfPageFormat.cm),
            child: pw.Text('${context.pageNumber}/${context.pagesCount}',
                style: pw.Theme.of(context)
                    .defaultTextStyle
                    .copyWith(color: PdfColors.black)));
      },
      build: (pw.Context context) => [
            pw.Partitions(children: [
              pw.Partition(child: pw.Column(children: [pw.Container()]))
            ])
          ]));
  return doc.save();
}

Future<pw.PageTheme> _myPageTheme(PdfPageFormat format) async {
  final bgShape = await rootBundle.loadString('images/res.svg');

  format = format.applyMargin(
      left: 2.0 * PdfPageFormat.cm,
      top: 4.0 * PdfPageFormat.cm,
      right: 2.0 * PdfPageFormat.cm,
      bottom: 2.0 * PdfPageFormat.cm);
  return pw.PageTheme(
    pageFormat: format,
    theme: pw.ThemeData.withFont(
      base:
          pw.Font.ttf(await rootBundle.load('fonts/SourceSansPro-Regular.ttf')),
      bold: pw.Font.ttf(await rootBundle.load('fonts/Montserrat-Bold.ttf')),
      icons: pw.Font.ttf(await rootBundle.load('fonts/icons.ttf')),
    ),
    buildBackground: (pw.Context context) {
      return pw.FullPage(
        ignoreMargins: true,
        child: pw.Stack(
          children: [
            pw.Positioned(
              child: pw.SvgImage(svg: bgShape),
              left: 0,
              top: 0,
            ),
            pw.Positioned(
              child: pw.Transform.rotate(
                  angle: pi, child: pw.SvgImage(svg: bgShape)),
              right: 0,
              bottom: 0,
            ),
          ],
        ),
      );
    },
  );
}

Future<pw.PageTheme> _myPageTheme2(PdfPageFormat format) async {
  final bgShape = await rootBundle.loadString('images/background.svg');
  final drawCameraSide = await rootBundle.loadString('images/camera.svg');
  final drawCameraTop = await rootBundle.loadString('images/camera_top.svg');
  final drawCameraDist = await rootBundle.loadString('images/camera_dist.svg');
  final drawLineDist = await rootBundle.loadString('images/line_dist.svg');
  final drawEllipsisHor = await rootBundle.loadString('images/reticencias.svg');
  final drawEllipsisVer =
      await rootBundle.loadString('images/reticencias_vertical.svg');
  final drawArrowsVHor =
      await rootBundle.loadString('images/seta_horizontal.svg');
  final drawSingleArrowHor =
      await rootBundle.loadString('images/seta_horizontal_unica.svg');
  final drawSingleArrowVer =
      await rootBundle.loadString('images/seta_vertical_unica.svg');
  final drawArrowsVVer =
      await rootBundle.loadString('images/seta_vertical.svg');
  final drawArrowsEnd =
      await rootBundle.loadString('images/seta_horizontal_dupla.svg');

  format = format.applyMargin(
      left: 2.0 * PdfPageFormat.cm,
      top: 4.0 * PdfPageFormat.cm,
      right: 2.0 * PdfPageFormat.cm,
      bottom: 2.0 * PdfPageFormat.cm);
  return pw.PageTheme(
    pageFormat: format,
    theme: pw.ThemeData.withFont(
      base:
          pw.Font.ttf(await rootBundle.load('fonts/SourceSansPro-Regular.ttf')),
      bold: pw.Font.ttf(await rootBundle.load('fonts/Montserrat-Bold.ttf')),
      icons: pw.Font.ttf(await rootBundle.load('fonts/icons.ttf')),
    ),
    buildBackground: (pw.Context context) {
      List<pw.Widget> tempList = [
        pw.Positioned(
          child: pw.SvgImage(svg: bgShape),
          left: 0,
          top: 0,
        ),
        pw.Positioned(
          //index1
          child: pw.Text(sfy.outcropHeigth, textAlign: pw.TextAlign.left),
          left: 90 - (sfy.outcropHeigth.length * 4).toDouble(),
          top: 150,
        ),
        pw.Positioned(
          //index1
          child: pw.Text(sfy.outcropDist, textAlign: pw.TextAlign.center),
          left: 372.5,
          top: 299,
        ),
        pw.Positioned(
          //index1
          child: pw.Text(sfy.lineSpacing, textAlign: pw.TextAlign.center),
          left: 480,
          top: 236,
        ),
        pw.Positioned(
          //index n
          child: pw.Text(sfy.outcropWidth, textAlign: pw.TextAlign.center),
          left: 332,
          top: 391,
        ),
        pw.Positioned(
          //index n
          child: pw.Text(sfy.outcropDist, textAlign: pw.TextAlign.center),
          left: 92 - (sfy.outcropHeigth.length * 4).toDouble(),
          top: 598,
        ),
      ];

      /*
      cenários:
        -1 linha
        -2 linhas
        -3 linhas ou mais
        -estrutura horizontal   ok

        -1 coluna
        -2 colunas
        -3 colunas ou mais
        -estrutura vertical       ok

       */
      double camX = 450;
      double camY = 195;

      pw.Widget arrowHorizontal = (pdfDataSrc.verticalStructures)
          ? pw.SvgImage(svg: drawArrowsVHor)
          : pw.SvgImage(svg: drawSingleArrowHor);
      pw.Widget arrowVertical = (pdfDataSrc.horizontalStructures)
          ? pw.SvgImage(svg: drawArrowsVVer)
          : pw.SvgImage(svg: drawSingleArrowVer);
      // pw.Widget arrowHorizontalLast = pw.SvgImage(svg: drawArrowsEnd);

      ////////////Vertical
      if (getLineAmountInt() == 1) {
        tempList.addAll(
            getVertBaseWithOffset(0, arrowHorizontal, drawCameraSide, '1'));
      } else if (getLineAmountInt() == 2) {
        tempList.addAll(
            getVertBaseWithOffset(0, arrowHorizontal, drawCameraSide, '1'));
        tempList.add(pw.Positioned(
          //index n
          child: pw.SvgImage(svg: drawLineDist),
          left: 464,
          top: 155,
        ));
        tempList.addAll(
            getVertBaseWithOffset(65, arrowHorizontal, drawCameraSide, '2'));
      } else if (getLineAmountInt() == 3) {
        tempList.addAll(
            getVertBaseWithOffset(0, arrowHorizontal, drawCameraSide, '1'));
        tempList.add(pw.Positioned(
          //index n
          child: pw.SvgImage(svg: drawLineDist),
          left: 464,
          top: 155,
        ));
        tempList.addAll(
            getVertBaseWithOffset(65, arrowHorizontal, drawCameraSide, '2'));
        tempList.add(pw.Positioned(
          //index n
          child: pw.SvgImage(svg: drawLineDist),
          left: 464,
          top: 90,
        ));
        tempList.addAll(getVertBaseWithOffset(
            125, arrowHorizontal, drawCameraSide, sfy.linesAmount));
      } else if (getLineAmountInt() != null) {
        tempList.addAll(
            getVertBaseWithOffset(0, arrowHorizontal, drawCameraSide, '1'));
        tempList.add(pw.Positioned(
          //index n
          child: pw.SvgImage(svg: drawLineDist),
          left: 464,
          top: 155,
        ));
        tempList.addAll(
            getVertBaseWithOffset(65, arrowHorizontal, drawCameraSide, '2'));
        tempList.add(pw.Positioned(
          //index n
          child: pw.SvgImage(svg: drawEllipsisVer),
          left: 464,
          top: 100,
        ));
        tempList.addAll(getVertBaseWithOffset(
            125, arrowHorizontal, drawCameraSide, sfy.linesAmount));
      }

      //////Horizontal
      if (getImagesPerLineAmountInt() == 1) {
        tempList.addAll(
            getHorBaseWithOffset(200, arrowVertical, drawCameraTop, '1'));
      } else if (getImagesPerLineAmountInt() == 2) {
        tempList.addAll(
            getHorBaseWithOffset(100, arrowVertical, drawCameraTop, '1'));
        tempList.add(pw.Positioned(
          //index n
          child: pw.SvgImage(svg: drawCameraDist),
          left: 330,
          top: 646,
        ));
        tempList.addAll(
            getHorBaseWithOffset(300, arrowVertical, drawCameraTop, '2'));
        tempList.add(pw.Positioned(
          //index n
          child: pw.Text(getPhotoSpacing()),
          left: 330,
          top: 630,
        ));
      } else if (getImagesPerLineAmountInt() == 3) {
        tempList
            .addAll(getHorBaseWithOffset(0, arrowVertical, drawCameraTop, '1'));
        tempList.add(pw.Positioned(
          //index n
          child: pw.SvgImage(svg: drawCameraDist),
          left: 220,
          top: 646,
        ));
        tempList.addAll(
            getHorBaseWithOffset(180, arrowVertical, drawCameraTop, '2'));
        tempList.add(pw.Positioned(
          //index n
          child: pw.SvgImage(svg: drawCameraDist),
          left: 400,
          top: 646,
        ));
        tempList.add(pw.Positioned(
          //index n
          child: pw.Text(getPhotoSpacing()),
          left: 410,
          top: 630,
        ));
        tempList.add(pw.Positioned(
          //index n
          child: pw.Text(getPhotoSpacing()),
          left: 230,
          top: 630,
        ));
        tempList.addAll(getHorBaseWithOffset(
            360, arrowVertical, drawCameraTop, getImagesPerLineAmount()));
      } else if (getImagesPerLineAmountInt() != null) {
        tempList
            .addAll(getHorBaseWithOffset(0, arrowVertical, drawCameraTop, '1'));
        tempList.add(pw.Positioned(
          //index n
          child: pw.SvgImage(svg: drawCameraDist),
          left: 220,
          top: 646,
        ));
        tempList.addAll(
            getHorBaseWithOffset(180, arrowVertical, drawCameraTop, '2'));
        tempList.add(pw.Positioned(
          //index n
          child: pw.SvgImage(svg: drawEllipsisHor),
          left: 410,
          top: 646,
        ));
        tempList.add(pw.Positioned(
          //index n
          child: pw.Text(getPhotoSpacing()),
          left: 230,
          top: 630,
        ));
        tempList.addAll(getHorBaseWithOffset(
            360, arrowVertical, drawCameraTop, getImagesPerLineAmount()));
      }

      return pw.FullPage(
        ignoreMargins: true,
        child: pw.Stack(
          children: tempList,
        ),
      );
    },
  );
}

List<pw.Widget> getVertBaseWithOffset(double offset, pw.Widget arrowHorizontal,
    String drawCameraSide, String label) {
  double camX = 450;
  double camY = 195;
  return [
    pw.Positioned(
      //index n
      child: arrowHorizontal,
      left: 420,
      top: 195 - offset,
    ),
    pw.Positioned(
      //index n
      child: pw.SvgImage(svg: drawCameraSide),
      left: camX,
      top: camY - offset,
    ),
    pw.Positioned(
      child: pw.Text(label),
      left: 485,
      top: 195 - offset,
    ),
  ];
}

List<pw.Widget> getHorBaseWithOffset(double offset, pw.Widget arrowHorizontal,
    String drawCameraTop, String label) {
  double camX = 140;
  double camY = 635;
  return [
    pw.Positioned(
      //index n
      child: arrowHorizontal,
      left: 139 + offset,
      top: 600,
    ),
    pw.Positioned(
      //index n
      child: pw.SvgImage(svg: drawCameraTop),
      left: camX + offset,
      top: camY,
    ),
    pw.Positioned(
      child: pw.Text(label),
      left: 145 + offset,
      top: 660,
    ),
  ];
}

class _Block extends pw.StatelessWidget {
  _Block({this.title, this.icon, this.value});

  final String title;

  final pw.IconData icon;

  final String value;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: <pw.Widget>[
          pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: <pw.Widget>[
                pw.Container(
                  width: 6,
                  height: 6,
                  margin: const pw.EdgeInsets.only(top: 2.5, left: 2, right: 5),
                  decoration: const pw.BoxDecoration(
                      color: gray, shape: pw.BoxShape.circle),
                ),
                pw.Text(title,
                    style: pw.Theme.of(context)
                        .defaultTextStyle
                        .copyWith(fontWeight: pw.FontWeight.bold)),
              ]),
          pw.Container(
            // decoration: const pw.BoxDecoration(
            //     border: pw.Border(left: pw.BorderSide(color: gray, width: 2))),
            padding: const pw.EdgeInsets.only(left: 10, top: 5, bottom: 5),
            margin: const pw.EdgeInsets.only(left: 5),
            child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: <pw.Widget>[
                  pw.Text('$value',
                      style: pw.Theme.of(context).defaultTextStyle.copyWith(
                          color:
                              (value == d.UnavailableData) ? red : grayDark)),
                ]),
          ),
        ]);
  }
}

class _Category extends pw.StatelessWidget {
  _Category(this.icon, {this.title});

  final pw.IconData icon;
  final String title;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Container(
        decoration: const pw.BoxDecoration(
          color: greyVariation,
          borderRadius: pw.BorderRadius.all(pw.Radius.circular(6)),
        ),
        margin: const pw.EdgeInsets.only(bottom: 10, top: 5),
        child: pw.Row(children: [
          pw.Icon(icon, color: grayDark, size: 20),
          pw.Container(width: 10),
          pw.Text(title,
              textScaleFactor: 1.5,
              style: pw.Theme.of(context)
                  .defaultTextStyle
                  .copyWith(fontWeight: pw.FontWeight.bold))
        ]));
  }
}

class _Percent extends pw.StatelessWidget {
  _Percent({
    @required this.size,
    @required this.value,
    this.title,
    this.fontSize = 1.2,
    this.color = grayDark,
    this.backgroundColor = PdfColors.grey300,
    this.strokeWidth = 5,
  }) : assert(size != null);

  final double size;

  final double value;

  final pw.Widget title;

  final double fontSize;

  final PdfColor color;

  final PdfColor backgroundColor;

  final double strokeWidth;

  @override
  pw.Widget build(pw.Context context) {
    final widgets = <pw.Widget>[
      pw.Container(
        width: size,
        height: size,
        child: pw.Stack(
          alignment: pw.Alignment.center,
          fit: pw.StackFit.expand,
          children: <pw.Widget>[
            pw.Center(
              child: pw.Text(
                '${(value * 100).round().toInt()}%',
                textScaleFactor: fontSize,
              ),
            ),
            pw.CircularProgressIndicator(
              value: value,
              backgroundColor: backgroundColor,
              color: color,
              strokeWidth: strokeWidth,
            ),
          ],
        ),
      )
    ];

    if (title != null) {
      widgets.add(title);
    }

    return pw.Column(children: widgets);
  }
}

// class _UrlText extends pw.StatelessWidget {
//   _UrlText(this.text, this.url);
//
//   final String text;
//   final String url;
//
//   @override
//   pw.Widget build(pw.Context context) {
//     return pw.UrlLink(
//       destination: url,
//       child: pw.Text(text,
//           style: const pw.TextStyle(
//             decoration: pw.TextDecoration.underline,
//             color: PdfColors.blue,
//           )),
//     );
//   }
// }
