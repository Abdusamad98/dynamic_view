import 'package:dynamic_view/cubits/dynamic_views_cubit.dart';
import 'package:dynamic_view/model/input_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UniversalInputView extends StatelessWidget {
  const UniversalInputView({Key? key, required this.inputModel})
      : super(key: key);

  final InputModel inputModel;

  @override
  Widget build(BuildContext context) {
    switch (inputModel.type) {
      case "select":
        {
          return Switch(value: true, onChanged: (value) {});
        }
      case "checkbox":
        {
          return Checkbox(
              value: true,
              onChanged: (v) {
                if (v != null) {
                  BlocProvider.of<DynamicViewsCubit>(context)
                      .updateSingleFieldValue(
                          code: inputModel.code, value: v ? "1" : "0");
                }
              });
        }
      case "text":
        {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              onChanged: (val) {
                BlocProvider.of<DynamicViewsCubit>(context)
                    .updateSingleFieldValue(
                  code: inputModel.code,
                  value: val,
                );
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text(inputModel.caption),
              ),
            ),
          );
        }
      default:
        return const Text("No Input found");
    }
  }
}
