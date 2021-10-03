import 'package:floor/floor.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

// part 'expense_details.g.dart';

// @entity
// @JsonSerializable()
class ExpenseDetails with ChangeNotifier {
  ExpenseDetails({
    required this.id,
    required this.userId,
    required this.expHead,
    required this.expCat,
    required this.expAmt,
    required this.remarks,
    required this.expFile,
    required this.expReceipt,
    required this.status,
    required this.approval,
    required this.expDate,
    required this.expTime,
    required this.createdAt,
    required this.updatedAt,
  });
  // @PrimaryKey(autoGenerate: false)
  int id;

  String userId;
  String expHead;
  String expCat;
  int expAmt;
  String? remarks;
  String expFile;
  String expReceipt;
  String status;
  String? approval;
  String expDate;
  String expTime;
  String? createdAt;
  String? updatedAt;

  factory ExpenseDetails.fromJson(Map<String, dynamic> json) => ExpenseDetails(
    id: json["id"],
    userId: json["user_id"],
    expHead: json["exp_head"],
    expCat: json["exp_cat"],
    expAmt: json["exp_amt"],
    remarks: json["remarks"],
    expFile: json["exp_file"],
    expReceipt: json["exp_receipt"],
    status: json["status"],
    approval: json["approval"],
    expDate: json["exp_date"],
    expTime: json["exp_time"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "exp_head": expHead,
    "exp_cat": expCat,
    "exp_amt": expAmt,
    "remarks": remarks,
    "exp_file": expFile,
    "exp_receipt": expReceipt,
    "status": status,
    "approval": approval,
    "exp_date": expDate,
    "exp_time": expTime,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

