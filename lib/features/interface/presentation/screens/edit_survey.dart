import 'package:capimobile/core/constants.dart';
import 'package:capimobile/core/language/language_list.dart';
import 'package:capimobile/features/interface/presentation/screens/camera_register.dart';
import 'package:capimobile/features/interface/presentation/screens/help_me/help_dimensions.dart';
import 'package:capimobile/features/interface/presentation/screens/help_me/help_general.dart';
import 'package:capimobile/features/interface/presentation/screens/qr_Code.dart';
import 'package:capimobile/features/interface/presentation/screens/surveys_web.dart';
import 'package:capimobile/features/interface/presentation/screens/view_survey.dart';
import 'package:capimobile/features/interface/presentation/widgets/SectionTitle.dart';
import 'package:capimobile/features/interface/presentation/widgets/button_big_screen_edit.dart';
import 'package:capimobile/features/interface/presentation/widgets/data_getters/camera_selector.dart';
import 'package:capimobile/features/interface/presentation/widgets/data_getters/numeric_input_w_unit.dart';
import 'package:capimobile/features/interface/presentation/widgets/data_getters/photo_orientation_select.dart';
import 'package:capimobile/features/interface/presentation/widgets/data_getters/toggle_switch_w_Label.dart';
import 'package:capimobile/features/interface/presentation/widgets/wave_slider/wave_slider_complete.dart';
import 'package:capimobile/features/interface/presentation/widgets/web_app_bar.dart';
import 'package:capimobile/features/repository/domain/entities/camera_entity.dart';
import 'package:capimobile/features/repository/domain/entities/survey_data_entity.dart';
import 'package:capimobile/features/repository/presentation/cubit/camera/camera_cubit.dart';
import 'package:capimobile/features/repository/presentation/cubit/survey/survey_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:tinycolor/tinycolor.dart';

final int overlapMax = 90, overlapMin = 10;
String currentDataStrBackup;

class EditSurvey extends StatefulWidget {
  static const String route = '/edit';
  final EditSurveyArguments args;

  EditSurvey(this.args);

  @override
  _EditSurveyState createState() => _EditSurveyState();
}

class _EditSurveyState extends State<EditSurvey> {
  SurveyDataEntity undoCash;
  SurveyDataEntity blankPage;

  Map<String, TextEditingController> editingControllers;

  Map<String, FocusNode> focus;

  CameraEntity dropdownValue = CameraSelector.DEFAULT;

  String gsdOrDist = '';

  double frontOverlap, sideOverlap;

  bool hStructures = false, vStructures = false;

  int orientationInitial = 0, orientationCurrent = 0;

  @override
  void initState() {
    super.initState();
    frontOverlap = convertRangeInverse(30, overlapMax, overlapMin);
    sideOverlap = convertRangeInverse(60, overlapMax, overlapMin);
    blankPage = SurveyDataEntity(
        '',
        Timestamp.now(),
        widget.args.survayData.surveyName,
        null,
        null,
        null,
        '',
        null,
        null,
        null,
        null,
        null,
        false,
        false,
        null,
        PhotoOrientationSelector.LANDSCAPE.toString(),
        60,
        30);
    focus = {
      'gsd': FocusNode(),
      'dist': FocusNode(),
    };

    editingControllers = {
      'width': TextEditingController(),
      'height': TextEditingController(),
      'outcropDistance': TextEditingController(),
      'sensorWidthMm': TextEditingController(),
      'sensorHeightMm': TextEditingController(),
      'sensorWidthPx': TextEditingController(),
      'sensorHeightPx': TextEditingController(),
      'focalLength': TextEditingController(),
      'gsd': TextEditingController(),
    };

    surveyEntityToPage(widget.args.survayData);
    undoCash = convertPageDataToSurveyEntity();
  }

  void surveyEntityToPage(SurveyDataEntity surveyData) {
    if (surveyData.userId != null) {
      editingControllers['width'].text =
          surveyData.width == null ? '' : surveyData.width.toString();
      editingControllers['height'].text =
          surveyData.height == null ? '' : surveyData.height.toString();
      editingControllers['outcropDistance'].text =
          surveyData.outcropDistance == null
              ? ''
              : surveyData.outcropDistance.toString();
      editingControllers['sensorWidthMm'].text =
          surveyData.sensorWidthMm == null
              ? ''
              : surveyData.sensorWidthMm.toString();
      editingControllers['sensorHeightMm'].text =
          surveyData.sensorHeightMm == null
              ? ''
              : surveyData.sensorHeightMm.toString();
      editingControllers['sensorWidthPx'].text =
          surveyData.sensorWidthPx == null
              ? ''
              : surveyData.sensorWidthPx.toString();
      editingControllers['sensorHeightPx'].text =
          surveyData.sensorHeightPx == null
              ? ''
              : surveyData.sensorHeightPx.toString();
      editingControllers['focalLength'].text = surveyData.focalLength == null
          ? ''
          : surveyData.focalLength.toString();
      editingControllers['gsd'].text =
          surveyData.gsd == null ? '' : surveyData.gsd.toString();

      gsdOrDist = (surveyData.gsd != null)
          ? 'gsd'
          : (surveyData.outcropDistance != null)
              ? 'dist'
              : '';

      frontOverlap = convertRangeInverse(
          surveyData.frontOverlap ?? 30, overlapMax, overlapMin);
      sideOverlap = convertRangeInverse(
          surveyData.sideOverlap ?? 60, overlapMax, overlapMin);

      hStructures = (surveyData.horizontalStructures == null)
          ? hStructures
          : surveyData.horizontalStructures;
      vStructures = (surveyData.verticalStructures == null)
          ? vStructures
          : surveyData.verticalStructures;

      // dropdownValue = (surveyData.cameraModel == null)
      //     ? dropdownValue
      //     : surveyData.cameraModel;

      orientationInitial = int.parse(surveyData.photoOrientation);
      orientationCurrent = orientationInitial;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (undoCash != convertPageDataToSurveyEntity()) {
          if (await _confirmSave()) {
            _saveSurvey();
          }
        }
        if (kIsWeb)
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Surveys()));

        return true;
      },
      child: Scaffold(
          appBar: MediaQuery.of(context).size.width > PAGE_WIDTH_SWITCH_APP_BAR
              ? WebAppBar(context, () {
                  setState(() {});
                })
              : AppBar(
                  title: Text(widget.args.survayData.surveyName),
                ),
          bottomNavigationBar: MediaQuery.of(context).size.width >
                  PAGE_WIDTH_SWITCH_APP_BAR
              ? null
              : Material(
                  elevation: 4,
                  color: Theme.of(context).primaryColor,
                  child: SafeArea(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                            icon: FaIcon(FontAwesomeIcons.broom),
                            color: Theme.of(context).colorScheme.onPrimary,
                            disabledColor:
                                Theme.of(context).colorScheme.primaryVariant,
                            onPressed:
                                (blankPage == convertPageDataToSurveyEntity())
                                    ? null
                                    : () {
                                        _clearAll();
                                      }),
                        IconButton(
                            color: Theme.of(context).colorScheme.onPrimary,
                            disabledColor:
                                Theme.of(context).colorScheme.primaryVariant,
                            icon: FaIcon(FontAwesomeIcons.history),
                            onPressed:
                                (undoCash == convertPageDataToSurveyEntity())
                                    ? null
                                    : () {
                                        _restore();
                                      }),
                        IconButton(
                            icon: FaIcon(FontAwesomeIcons.save),
                            color: Theme.of(context).colorScheme.onPrimary,
                            disabledColor:
                                Theme.of(context).colorScheme.primaryVariant,
                            tooltip: d.Save,
                            onPressed:
                                (undoCash == convertPageDataToSurveyEntity())
                                    ? null
                                    : () {
                                        _saveSurvey();
                                      }),
                        IconButton(
                            icon: FaIcon(FontAwesomeIcons.qrcode),
                            color: Theme.of(context).colorScheme.onPrimary,
                            disabledColor:
                                Theme.of(context).colorScheme.primaryVariant,
                            tooltip: d.QRCodeExport,
                            onPressed: () {
                              Navigator.pushNamed(context, QrDisplay.route,
                                  arguments: convertPageDataToSurveyEntity()
                                      .toString());
                            }),
                        IconButton(
                            color: Theme.of(context).colorScheme.onPrimary,
                            disabledColor:
                                Theme.of(context).colorScheme.primaryVariant,
                            tooltip: d.OpenPDF,
                            icon: FaIcon(FontAwesomeIcons.filePdf),
                            onPressed: () async {
                              if (undoCash != convertPageDataToSurveyEntity()) {
                                if (await _confirmSave()) {
                                  _saveSurvey();
                                }
                              }
                              _openPdf();
                            }),
                      ],
                    ),
                  ),
                ),
          body: Scrollbar(
            child: BlocListener<SurveyCubit, SurveyState>(
              listener: (context, state) {
                if (state is SurveySaved) {
                  final snackBar = SnackBar(content: Text(d.SuccessfullySaved));

// Find the Scaffold in the widget tree and use it to show a SnackBar.
                  Scaffold.of(context).showSnackBar(snackBar);
                }
              },
              child: SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                constraints: BoxConstraints(maxWidth: 1000),
                                child: SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Theme.of(context)
                                                  .accentTextTheme
                                                  .button
                                                  .color),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              SectionTitle(d.Dimensions,
                                                  onHelp: () {
                                                _onHelpClicked(d.Dimensions);
                                              }),
                                              IntrinsicWidth(
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child:
                                                          NumericInputWithUnit(
                                                        onSubmitted: (value) {
                                                          setState(() {});
                                                        },
                                                        title: d.OutcropHeight,
                                                        unit: 'm',
                                                        controller:
                                                            editingControllers[
                                                                'height'],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child:
                                                          NumericInputWithUnit(
                                                        onSubmitted: (value) {
                                                          setState(() {});
                                                        },
                                                        title: d.OutcropWidth,
                                                        unit: 'm',
                                                        controller:
                                                            editingControllers[
                                                                'width'],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              IntrinsicWidth(
                                                child: Row(
                                                  children: [
                                                    Radio(
                                                        value: 'dist',
                                                        groupValue: gsdOrDist,
                                                        onChanged: (value) {
                                                          _toggleGSDDistance(
                                                              'dist');
                                                        }),
                                                    Expanded(
                                                      child:
                                                          NumericInputWithUnit(
                                                        onSubmitted: (value) {
                                                          setState(() {});
                                                        },
                                                        title:
                                                            d.OutcropDistance,
                                                        unit: 'm',
                                                        disable:
                                                            gsdOrDist != 'dist',
                                                        controller:
                                                            editingControllers[
                                                                'outcropDistance'],
                                                        focusNode:
                                                            focus['dist'],
                                                        onTap: () {
                                                          _toggleGSDDistance(
                                                              'dist');
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              IntrinsicWidth(
                                                child: Row(
                                                  children: [
                                                    Radio(
                                                        value: 'gsd',
                                                        groupValue: gsdOrDist,
                                                        onChanged: (value) {
                                                          _toggleGSDDistance(
                                                              'gsd');
                                                        }),
                                                    Expanded(
                                                      child:
                                                          NumericInputWithUnit(
                                                        onSubmitted: (value) {
                                                          setState(() {});
                                                        },
                                                        title: d.Gsd,
                                                        unit: 'cm/pixel',
                                                        disable:
                                                            gsdOrDist != 'gsd',
                                                        focusNode: focus['gsd'],
                                                        controller:
                                                            editingControllers[
                                                                'gsd'],
                                                        onTap: () {
                                                          _toggleGSDDistance(
                                                              'gsd');
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Theme.of(context)
                                                  .accentTextTheme
                                                  .button
                                                  .color),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              SectionTitle(d.CameraModel),
                                              CameraSelector(
                                                  onChanged: (e) {
                                                    if (e ==
                                                        CameraSelector
                                                            .DEFAULT) {
                                                      Navigator.pushNamed(
                                                          context,
                                                          CameraRegister.route);
                                                      currentDataStrBackup =
                                                          convertPageDataToSurveyEntity()
                                                              .toString();
                                                    } else {
                                                      //fill spaces
                                                      editingControllers[
                                                                  'sensorWidthMm']
                                                              .text =
                                                          (e.sensorWidthMm !=
                                                                  null)
                                                              ? e.sensorWidthMm
                                                                  .toString()
                                                              : '';
                                                      editingControllers[
                                                                  'sensorHeightMm']
                                                              .text =
                                                          (e.sensorHeightMm !=
                                                                  null)
                                                              ? e.sensorHeightMm
                                                                  .toString()
                                                              : '';
                                                      editingControllers[
                                                                  'sensorWidthPx']
                                                              .text =
                                                          (e.sensorWidthPx !=
                                                                  null)
                                                              ? e.sensorWidthPx
                                                                  .toString()
                                                              : '';
                                                      editingControllers[
                                                                  'sensorHeightPx']
                                                              .text =
                                                          (e.sensorHeightPx !=
                                                                  null)
                                                              ? e.sensorHeightPx
                                                                  .toString()
                                                              : '';
                                                      editingControllers[
                                                                  'focalLength']
                                                              .text =
                                                          (e.focalLength !=
                                                                  null)
                                                              ? e.focalLength
                                                                  .toString()
                                                              : '';
                                                    }
                                                    setState(() {});
                                                  },
                                                  onLongPress: _onLongPress,
                                                  dropdownValue: dropdownValue),
                                              IntrinsicWidth(
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child:
                                                          NumericInputWithUnit(
                                                        onSubmitted: (value) {
                                                          setState(() {});
                                                        },
                                                        title: d.SensorHeightMm,
                                                        unit: 'mm',
                                                        controller:
                                                            editingControllers[
                                                                'sensorHeightMm'],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child:
                                                          NumericInputWithUnit(
                                                        onSubmitted: (value) {
                                                          setState(() {});
                                                        },
                                                        title: d.SensorWidthMm,
                                                        unit: 'mm',
                                                        controller:
                                                            editingControllers[
                                                                'sensorWidthMm'],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              IntrinsicWidth(
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child:
                                                          NumericInputWithUnit(
                                                        onSubmitted: (value) {
                                                          setState(() {});
                                                        },
                                                        title: d.SensorHeightPx,
                                                        unit: 'px',
                                                        controller:
                                                            editingControllers[
                                                                'sensorHeightPx'],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child:
                                                          NumericInputWithUnit(
                                                        onSubmitted: (value) {
                                                          setState(() {});
                                                        },
                                                        title: d.SersorWidthPx,
                                                        unit: 'px',
                                                        controller:
                                                            editingControllers[
                                                                'sensorWidthPx'],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              NumericInputWithUnit(
                                                onSubmitted: (value) {
                                                  setState(() {});
                                                },
                                                title: d.FocalLength,
                                                controller: editingControllers[
                                                    'focalLength'],
                                                unit: 'mm',
                                              ),
                                              SizedBox(
                                                height: 10,
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Theme.of(context)
                                                  .accentTextTheme
                                                  .button
                                                  .color),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              SectionTitle(
                                                d.General,
                                                onHelp: () {
                                                  _onHelpClicked(d.General);
                                                },
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              WaveSliderComplete(
                                                displayedMax: overlapMax,
                                                displayedMin: overlapMin,
                                                currentValue:
                                                    frontOverlap / 100,
                                                onChanged: (double value) {
                                                  setState(() {
                                                    frontOverlap = value * 100;
                                                  });
                                                },
                                                label: d.FrontOverlap,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              WaveSliderComplete(
                                                displayedMax: overlapMax,
                                                displayedMin: overlapMin,
                                                currentValue: sideOverlap / 100,
                                                onChanged: (double value) {
                                                  setState(() {
                                                    sideOverlap = value * 100;
                                                  });
                                                },
                                                label: d.SideOverlap,
                                              ),
                                              Divider(),
                                              ToggleSwitchWithLabel(
                                                label: d.VerticalStructures,
                                                status: hStructures,
                                                onToggle: (value) {
                                                  setState(() {
                                                    hStructures = value;
                                                  });
                                                },
                                              ),
                                              ToggleSwitchWithLabel(
                                                label: d.HorizontalStructures,
                                                status: vStructures,
                                                onToggle: (value) {
                                                  setState(() {
                                                    vStructures = value;
                                                  });
                                                },
                                              ),
                                              Divider(),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 10),
                                                child: Text(
                                                  d.PhotoOrientation,
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                      fontFamily:
                                                          'SourceSansPro',
                                                      color: Theme.of(context)
                                                          .accentColor),
                                                ),
                                              ),
                                              PhotoOrientationSelector(
                                                text: (orientationCurrent ==
                                                        PhotoOrientationSelector
                                                            .LANDSCAPE)
                                                    ? d.Landscape
                                                    : d.Portrait,
                                                initialLabelIndex:
                                                    orientationInitial,
                                                onToggle: (v) {
                                                  setState(() {
                                                    orientationCurrent = v;
                                                  });
                                                },
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    MediaQuery.of(context).size.width <
                            PAGE_WIDTH_SWITCH_APP_BAR
                        ? Container()
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                constraints: BoxConstraints(
                                    maxWidth: 250, maxHeight: 400),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ButtonBigScreen(d.ClearAll,
                                        icon: FaIcon(FontAwesomeIcons.broom),
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                        disabledColor: Theme.of(context)
                                            .colorScheme
                                            .primaryVariant,
                                        onPressed: (blankPage ==
                                                convertPageDataToSurveyEntity())
                                            ? null
                                            : () {
                                                _clearAll();
                                              }),
                                    ButtonBigScreen(d.Undo,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                        disabledColor: Theme.of(context)
                                            .colorScheme
                                            .primaryVariant,
                                        icon: FaIcon(FontAwesomeIcons.history),
                                        onPressed: (undoCash ==
                                                convertPageDataToSurveyEntity())
                                            ? null
                                            : () {
                                                _restore();
                                              }),
                                    ButtonBigScreen(d.Save,
                                        icon: FaIcon(FontAwesomeIcons.save),
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                        disabledColor: Theme.of(context)
                                            .colorScheme
                                            .primaryVariant,
                                        onPressed: (undoCash ==
                                                convertPageDataToSurveyEntity())
                                            ? null
                                            : () {
                                                _saveSurvey();
                                              }),
                                    ButtonBigScreen(d.QRCodeExport,
                                        icon: FaIcon(FontAwesomeIcons.qrcode),
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                        disabledColor: Theme.of(context)
                                            .colorScheme
                                            .primaryVariant, onPressed: () {
                                      Navigator.pushNamed(
                                          context, QrDisplay.route,
                                          arguments:
                                              convertPageDataToSurveyEntity()
                                                  .toString());
                                    }),
                                    ButtonBigScreen(d.OpenPDF,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                        disabledColor: Theme.of(context)
                                            .colorScheme
                                            .primaryVariant,
                                        icon: FaIcon(FontAwesomeIcons.filePdf),
                                        onPressed: () async {
                                      if (await _confirmSave()) {
                                        _saveSurvey();
                                      }

                                      _openPdf();
                                    }),
                                  ],
                                ),
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  SurveyDataEntity convertPageDataToSurveyEntity() {
    return SurveyDataEntity(
        '',
        Timestamp.now(),
        widget.args.survayData.surveyName,
        double.tryParse(editingControllers['width'].text),
        double.tryParse(editingControllers['height'].text),
        (gsdOrDist == 'dist')
            ? double.tryParse(editingControllers['outcropDistance'].text)
            : null,
        null,
        double.tryParse(editingControllers['sensorWidthMm'].text),
        double.tryParse(editingControllers['sensorHeightMm'].text),
        int.tryParse(editingControllers['sensorWidthPx'].text),
        int.tryParse(editingControllers['sensorHeightPx'].text),
        double.tryParse(editingControllers['focalLength'].text),
        hStructures,
        vStructures,
        (gsdOrDist == 'gsd')
            ? double.tryParse(editingControllers['gsd'].text)
            : null,
        orientationCurrent.toString(),
        convertRange(sideOverlap.toInt(), overlapMax, overlapMin),
        convertRange(frontOverlap.toInt(), overlapMax, overlapMin));
  }

  void _saveSurvey() async {
    setState(() {
      undoCash = convertPageDataToSurveyEntity();
    });
    BlocProvider.of<SurveyCubit>(context)
        .appendNewSurvey(surveyData: convertPageDataToSurveyEntity());
  }

  void _clearAll() {
    _showOkCancelDialog(
        context,
        d.Warning,
        d.CLEAR_ALL_FIELDS_CONFIRMATION,
        () => setState(() {
              surveyEntityToPage(blankPage);
              blankPage = convertPageDataToSurveyEntity();
              Navigator.pop(context);
            }));
  }

  void _restore() {
    _showOkCancelDialog(
        context,
        d.Warning,
        d.RESTORE_TO_PREVIOUS_STATE_CONFIRMATION,
        () => setState(() {
              surveyEntityToPage(undoCash);
              Navigator.pop(context);
            }));
  }

  void _toggleGSDDistance(String target) {
    setState(() {
      gsdOrDist = target;
      focus[target].requestFocus();
    });
  }

  void _openPdf() {
    pdfDataSrc = convertPageDataToSurveyEntity();
    Navigator.popAndPushNamed(context, ViewSurvey.route);
  }

  void _setFocus(String target) {
    setState(() {
      focus[target].requestFocus();
    });
  }

  void _onLongPress(CameraEntity cameraData) {
    dropdownValue = CameraSelector.DEFAULT;

    showDialog(
        context: context,
        builder: (BuildContext) {
          return AlertDialog(
            title: Text('Ações de câmera'),
            actions: [
              OutlineButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pushNamed(context, CameraRegister.route,
                      arguments: cameraData);
                },
                child: Text('Editar'),
              ),
              OutlineButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  _showMyDialog(context, cameraData.name);
                },
                child: Text('Excluir'),
              ),
              OutlineButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancelar'),
              ),
            ],
          );
        });
  }

  Future<void> _showMyDialog(BuildContext context, String name) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(name),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(d.CAMERA_DELETION_CONFIRMATION),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(d.Yes),
              onPressed: () {
                BlocProvider.of<CameraCubit>(context).deleteCamera(name);
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(d.No),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showOkCancelDialog(
      BuildContext context, String name, String body, Function action) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(name),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(body),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(d.Ok),
              onPressed: () {
                action();
              },
            ),
            TextButton(
              child: Text(d.Cancel),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _onHelpClicked(String title) {
    currentDataStrBackup = convertPageDataToSurveyEntity().toString();
    if (title == d.Dimensions) {
      Navigator.of(context).pushNamed(HelpDimensions.route);
    } else if (title == d.General) {
      Navigator.of(context).pushNamed(HelpGeneral.route);
    }
  }

  Future<bool> _confirmSave() async {
    return await Alert(
        context: context,
        title: d.SaveBeforeLeavingThePage,
        buttons: [
          DialogButton(
            onPressed: () async {
              Navigator.pop(context, true);
            },
            child: Text(
              d.Yes,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          DialogButton(
            onPressed: () async {
              Navigator.pop(context, false);
            },
            child: Text(
              d.No,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }
}

class EditSurveyArguments {
  final SurveyDataEntity survayData;

  EditSurveyArguments(this.survayData);
}
