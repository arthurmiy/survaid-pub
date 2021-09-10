import 'package:capimobile/core/language/language_list.dart';
import 'package:capimobile/features/repository/domain/entities/camera_entity.dart';
import 'package:capimobile/features/repository/presentation/cubit/camera/camera_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CameraSelector extends StatelessWidget {
  static final DEFAULT =
      CameraEntity(null, null, null, null, null, null, null, null);
  final CameraEntity dropdownValue;
  final ValueChanged<CameraEntity> onChanged;
  final ValueChanged<CameraEntity> onLongPress;
  final FocusNode focusNode;

  CameraSelector(
      {this.onChanged, this.dropdownValue, this.onLongPress, this.focusNode});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CameraCubit, CameraState>(builder: (_, state) {
      if (state is CameraLoaded) {
        return Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<CameraEntity>(
              isExpanded: true,
              value: dropdownValue,
              iconSize: 24,
              elevation: 16,
              onChanged: onChanged,
              focusNode: focusNode,
              items: List.from(state.cameras
                  .map((e) => DropdownMenuItem(
                        child: GestureDetector(
                          child: Row(
                            children: [
                              Text(e.name),
                            ],
                          ),
                          onLongPress: () {
                            this.onLongPress(e);
                          },
                        ),
                        value: e,
                      ))
                  .toList())
                ..insert(
                    0,
                    DropdownMenuItem(
                      child: Row(
                        children: [
                          Text(d.RegisterNewCamera),
                        ],
                      ),
                      value: DEFAULT,
                    )),
            ));
      } else {
        BlocProvider.of<CameraCubit>(context).getCameras();
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: DropdownButton<String>(
            isExpanded: true,
            value: '0',
            iconSize: 24,
            elevation: 16,
            onChanged: null,
            items: [
              DropdownMenuItem(
                child: Row(
                  children: [
                    Text(d.Loading),
                  ],
                ),
                value: '0',
              ),
            ],
          ),
        );
      }
    });
  }
}
