import 'package:capimobile/core/cameras/camera_database.dart';
import 'package:capimobile/core/cameras/sensor_data_holder.dart';
import 'package:capimobile/core/constants.dart';
import 'package:capimobile/core/language/language_list.dart';
import 'package:capimobile/features/interface/presentation/screens/edit_survey.dart';
import 'package:capimobile/features/interface/presentation/widgets/data_getters/numeric_input_w_unit.dart';
import 'package:capimobile/features/interface/presentation/widgets/data_getters/text_input_w_label.dart';
import 'package:capimobile/features/interface/presentation/widgets/web_app_bar.dart';
import 'package:capimobile/features/repository/domain/entities/camera_entity.dart';
import 'package:capimobile/features/repository/domain/entities/survey_data_entity.dart';
import 'package:capimobile/features/repository/presentation/cubit/camera/camera_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CameraRegister extends StatefulWidget {
  static const route = '/CameraRegister0';
  final CameraEntity data;

  CameraRegister(this.data);

  @override
  _CameraRegisterState createState() => _CameraRegisterState();
}

class _CameraRegisterState extends State<CameraRegister> {
  List<DropdownMenuItem<String>> models = [
    DropdownMenuItem<String>(
      child: Text('...'),
      value: '0',
    )
  ];
  String _currentCamera = '0';
  String _currentModel = '0';
  String _scaffoldTitle = d.RegisterNewCamera;
  TextEditingController shMm, swMm, shPx, swPx, fl, name;

  bool nameRequire = false;

  @override
  void initState() {
    super.initState();
    name = TextEditingController();
    shMm = TextEditingController();
    swMm = TextEditingController();
    shPx = TextEditingController();
    swPx = TextEditingController();
    fl = TextEditingController();

    if (widget.data.name == null) {
    } else {
      _scaffoldTitle = '${d.Edit} - ${widget.data.name}';
      _initializeFields();
    }
  }

  void _initializeFields() {
    shMm.text = (widget.data.sensorHeightMm == null)
        ? ''
        : widget.data.sensorHeightMm.toString();
    swMm.text = (widget.data.sensorWidthMm == null)
        ? ''
        : widget.data.sensorWidthMm.toString();
    shPx.text = (widget.data.sensorHeightPx == null)
        ? ''
        : widget.data.sensorHeightPx.toString();
    swPx.text = (widget.data.sensorWidthPx == null)
        ? ''
        : widget.data.sensorWidthPx.toString();
    fl.text = (widget.data.focalLength == null)
        ? ''
        : widget.data.focalLength.toString();
    name.text = (widget.data.name ?? '');
  }

  @override
  Widget build(BuildContext context) {
    Widget page = Scaffold(
        appBar: MediaQuery.of(context).size.width > PAGE_WIDTH_SWITCH_APP_BAR
            ? WebAppBar(context, () {
                setState(() {});
              })
            : AppBar(
                title: Text(_scaffoldTitle),
              ),
        body: Scrollbar(
          child: BlocListener<CameraCubit, CameraState>(
            listener: (context, state) {
              if (state is CameraSaved) {
                final snackBar = SnackBar(content: Text(d.SuccessfullySaved));

// Find the Scaffold in the widget tree and use it to show a SnackBar.
                Scaffold.of(context).showSnackBar(snackBar);
              }
            },
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                constraints: BoxConstraints(maxWidth: 1000),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextInputWithLabel(
                          errorText: (nameRequire) ? d.Required : null,
                          title: d.CameraName,
                          controller: name,
                        ),
                        Divider(),
                        Row(
                          children: [
                            FaIcon(FontAwesomeIcons.industry),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: DropdownButton<String>(
                                  isExpanded: true,
                                  value: _currentCamera,
                                  items: List.from(CameraDatabase.entries
                                      .map<DropdownMenuItem<String>>(
                                          (e) => DropdownMenuItem<String>(
                                                child: Text(e.key),
                                                value: e.key,
                                              ))
                                      .toList())
                                    ..add(DropdownMenuItem<String>(
                                      child: Text('-'),
                                      value: '0',
                                    )),
                                  onChanged: (value) {
                                    name.text = (name.text == _currentModel)
                                        ? ''
                                        : name.text;
                                    shMm.text = '';
                                    swMm.text = '';
                                    shPx.text = '';
                                    swPx.text = '';
                                    _currentCamera = value;
                                    if (value == '0') {
                                      _resetLists('');
                                    } else {
                                      _currentModel = "0";

                                      models = CameraDatabase[value]
                                          .entries
                                          .map<DropdownMenuItem<String>>(
                                              (e) => DropdownMenuItem<String>(
                                                    child: Text(e.key),
                                                    value: e.key,
                                                  ))
                                          .toList();
                                      models.add(DropdownMenuItem<String>(
                                        child: Text('...'),
                                        value: "0",
                                      ));
                                      setState(() {});
                                    }
                                  }),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            FaIcon(FontAwesomeIcons.camera),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: DropdownButton<String>(
                                  isExpanded: true,
                                  items: models,
                                  value: _currentModel,
                                  onChanged: (value) {
                                    setState(() {
                                      name.text = (name.text == _currentModel)
                                          ? ''
                                          : name.text;
                                      _currentModel = value;
                                      if (value != '0') {
                                        SensorDataHolder tmp =
                                            CameraDatabase[_currentCamera]
                                                [_currentModel];
                                        shMm.text =
                                            '${tmp.sensorHeightMm ?? ''}';
                                        swMm.text =
                                            '${tmp.sensorWidthMm ?? ''}';
                                        shPx.text =
                                            '${tmp.sensorHeightPx ?? ''}';
                                        swPx.text =
                                            '${tmp.sensorWidthPx ?? ''}';
                                        name.text = (name.text.isEmpty)
                                            ? _currentModel
                                            : name.text;
                                      }
                                    });
                                  }),
                            ),
                          ],
                        ),
                        IntrinsicWidth(
                          child: Row(
                            children: [
                              Expanded(
                                child: NumericInputWithUnit(
                                  title: d.SensorHeightMm,
                                  unit: 'mm',
                                  controller: shMm,
                                  onChanged: _resetLists,
                                ),
                              ),
                              Expanded(
                                child: NumericInputWithUnit(
                                  title: d.SensorWidthMm,
                                  unit: 'mm',
                                  controller: swMm,
                                  onChanged: _resetLists,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IntrinsicWidth(
                          child: Row(
                            children: [
                              Expanded(
                                child: NumericInputWithUnit(
                                  title: d.SensorHeightPx,
                                  unit: 'px',
                                  controller: shPx,
                                  onChanged: _resetLists,
                                ),
                              ),
                              Expanded(
                                child: NumericInputWithUnit(
                                  title: d.SersorWidthPx,
                                  unit: 'px',
                                  controller: swPx,
                                  onChanged: _resetLists,
                                ),
                              ),
                            ],
                          ),
                        ),
                        NumericInputWithUnit(
                          title: d.FocalLength,
                          unit: 'mm',
                          controller: fl,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        OutlineButton(
                          onPressed: () {
                            _saveCamera();
                          },
                          child: Text(d.Save),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));

    return (kIsWeb)
        ? WillPopScope(
            onWillPop: () async => Navigator.push(
                context,
                MaterialPageRoute(
                    settings: RouteSettings(name: EditSurvey.route),
                    builder: (context) => EditSurvey(EditSurveyArguments(
                        SurveyDataEntity.fromString(
                            currentDataStrBackup))))), //EditSurveyArguments(tmp)
            child: page)
        : page;
  }

  void _saveCamera() async {
    setState(() {
      nameRequire = false;
    });
    if (name.text.isEmpty) {
      setState(() {
        nameRequire = true;
      });
    } else {
      BlocProvider.of<CameraCubit>(context).appendNewCamera(
          cameraData: CameraEntity(
        name.text,
        null,
        null,
        double.tryParse(swMm.text),
        double.tryParse(shMm.text),
        int.tryParse(swPx.text),
        int.tryParse(shPx.text),
        double.tryParse(fl.text),
      ));
    }
  }

  void _resetLists(String value) {
    setState(() {
      models = [
        DropdownMenuItem<String>(
          child: Text('...'),
          value: '0'.toString(),
        )
      ];
      _currentModel = '0';
      _currentCamera = '0';
    });
  }
}
