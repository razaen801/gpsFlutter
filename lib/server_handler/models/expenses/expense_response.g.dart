// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExpenseResponse _$ExpenseResponseFromJson(Map<String, dynamic> json) {
  return ExpenseResponse(
    (json['expenses'] as List<dynamic>)
        .map((e) => ExpenseDetails.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['result'] as String,
  );
}

Map<String, dynamic> _$ExpenseResponseToJson(ExpenseResponse instance) =>
    <String, dynamic>{
      'expenses': instance.expenseDetails,
      'result': instance.result,
    };
