import 'package:my_gps_app/server_handler/models/expenses/expense_details.dart';
import 'package:json_annotation/json_annotation.dart';

part 'expense_response.g.dart';

@JsonSerializable()
class ExpenseResponse{
  @JsonKey(name: 'expenses')
  final List<ExpenseDetails> expenseDetails;

  @JsonKey(name: 'result')
  final String result;

  ExpenseResponse(this.expenseDetails, this.result);

  factory ExpenseResponse.fromJson(Map<String,dynamic> json) => _$ExpenseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ExpenseResponseToJson(this);


}