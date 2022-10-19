part of 'dynamic_views_cubit.dart';

class DynamicViewsState extends Equatable {
  final FormzStatus status;
  final Map<String, dynamic> fields;
  final List<InputModel> dynamicFields;

  DynamicViewsState({
    required this.status,
    required this.fields,
    required this.dynamicFields,
  });

  DynamicViewsState copyWith({
    FormzStatus? status,
    Map<String, dynamic>? fields,
    List<InputModel>? dynamicFields,
  }) =>
      DynamicViewsState(
        status: status ?? this.status,
        fields: fields ?? this.fields,
        dynamicFields: dynamicFields ?? this.dynamicFields,
      );

  @override
  List<Object> get props => [
        status,
        fields,
        dynamicFields,
      ];
}
