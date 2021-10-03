import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_gps_app/customColors.dart';
import 'package:my_gps_app/server_handler/models/expenses/expense_details.dart';
import 'package:provider/provider.dart';
import 'package:my_gps_app/constants.dart';

class ExpenseItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width / 100;
    double height = MediaQuery
        .of(context)
        .size
        .height / 100;
    ExpenseDetails expenseDetails = Provider.of<ExpenseDetails>(context,listen: false);
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
      color: Colors.white,
      // shape: Border(right: BorderSide(color: Colors.red, width: 5)),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText('${expenseDetails.expHead.capitalize()} - ${expenseDetails.expCat.capitalize()}',
                    minFontSize: 10,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 14
                    ),
                    ),
                    AutoSizeText('${expenseDetails.expDate}',
                      minFontSize: 10,
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: 12,
                        color: CustomColors.kButtonColor
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Center(
                  child: AutoSizeText('Rs ${expenseDetails.expAmt}',
                    minFontSize: 10,
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 14,
                      color: Colors.red
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
