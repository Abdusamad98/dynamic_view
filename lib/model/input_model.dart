import 'package:json_annotation/json_annotation.dart';

part 'input_model.g.dart';

@JsonSerializable()
class InputModel {
  @JsonKey(defaultValue: "", name: "code")
  String code;

  @JsonKey(defaultValue: "", name: "caption")
  String caption;

  @JsonKey(defaultValue: "", name: "fullCaption")
  String fullCaption;

  @JsonKey(defaultValue: 0, name: "sort")
  int sort;

  @JsonKey(defaultValue: "", name: "group")
  String group;

  @JsonKey(defaultValue: "", name: "initial_value")
  String initialValue;

  @JsonKey(defaultValue: "", name: "regExp")
  String regExp;

  @JsonKey(defaultValue: false, name: "required")
  bool required;

  @JsonKey(defaultValue: "", name: "type")
  String type;

  @JsonKey(defaultValue: [], name: "values")
  List<String> values;

  InputModel({
    required this.code,
    required this.caption,
    required this.values,
    required this.required,
    required this.type,
    required this.regExp,
    required this.initialValue,
    required this.group,
    required this.sort,
    required this.fullCaption,
  });

  factory InputModel.fromJson(Map<String, dynamic> json) => _$InputModelFromJson(json);
  Map<String, dynamic> toJson() => _$InputModelToJson(this);
}

