import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_gps_app/constants.dart';
import 'package:my_gps_app/customColors.dart';
import 'package:my_gps_app/dashboard/expense/expense_item.dart';
import 'package:my_gps_app/server_handler/models/expenses/expense_details.dart';
import 'package:my_gps_app/server_handler/models/expenses/expense_response.dart';
import 'package:my_gps_app/server_handler/network/network_repository.dart';
import 'package:my_gps_app/server_handler/network/network_data_source.dart';
import 'package:provider/provider.dart';

class AllExpenseList extends StatefulWidget {
  @override
  _AllExpenseListState createState() => _AllExpenseListState();
}

class _AllExpenseListState extends State<AllExpenseList> {
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
    NetworkDataSource repository = NetworkRepository();
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text("All Expenses"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Constant.showToastMessage("Feature will be available soon");
          },
          backgroundColor: CustomColors.kButtonColor,
          child: const Icon(Icons.add,color: Colors.white,),
        ),
        body: FutureBuilder(
          future: repository.getAllExpenses(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            ExpenseResponse expenseResponse = snapshot.data;
            List<ExpenseDetails> expenses = [];
            return snapshot.connectionState == ConnectionState.waiting
                ? Center(
                    child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: CircularProgressIndicator(),
                  ))
                : Container(
              height: double.infinity,
                  width: double.infinity,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, i) {
                      expenses.clear();
                      expenses = expenseResponse.expenseDetails;
                        return ChangeNotifierProvider.value(
                          value: expenseResponse.expenseDetails[i],
                          child: ExpenseItem(),
                        );
                      },
                    itemCount: expenseResponse.expenseDetails.length,
                  ),

                );
          },
        ),
      ),
    );
  }
}
