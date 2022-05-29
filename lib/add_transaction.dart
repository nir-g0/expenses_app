import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';

//import 'package:sqflite/sqflite.dart';

import './transaction.dart';
import './new_page.dart';

class AddTransaction extends StatefulWidget {
  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final List<Transactions> transactionList = [];
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void changePage(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) {
          return NewPage();
        },
      ),
    );
  }

  void addTx(String txTitle, double txAmount) {
    final newTx = Transactions(
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
    );
    print(transactionList);
    setState(() {
      transactionList.add(newTx);
    });
    print(transactionList);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 80),
      color: Colors.blue,
      /*
          Textfields and confirmation button
          */
      child: Column(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                      style: TextStyle(
                        //fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.white,
                      ),
                      'Title:'),
                ),
                CupertinoTextField(
                  keyboardType: TextInputType.text,
                  autocorrect: true,
                  padding: EdgeInsets.only(top: 6, bottom: 6, left: 16),
                  controller: titleController,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                  ),
                ),
                /*

                */
                Container(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                      'Amount:'),
                ),
                CupertinoTextField(
                  keyboardType: TextInputType.numberWithOptions(
                    decimal: true,
                    //signed: true,
                  ),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                  ),
                  maxLength: 10,
                  autocorrect: true,
                  prefix: Text(
                      style: TextStyle(
                        fontSize: 18,
                        //fontWeight: FontWeight.bold,
                      ),
                      ' \$'),
                  padding: EdgeInsets.only(top: 6, bottom: 6, left: 0),
                  // decoration: InputDecoration(labelText: 'Amount'),
                  controller: amountController,
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 10),
                  height: 40,
                  //width: MediaQuery.of(context).size.width,
                  decoration: ShapeDecoration(
                      shape: CircleBorder(side: BorderSide.none),
                      color: Colors.white),
                  child: IconButton(
                    padding: EdgeInsets.all(1),
                    //alignment: Alignment.center,
                    enableFeedback: true,
                    //splashRadius: 100,
                    //splashColor: Color.fromARGB(255, 255, 43, 43),
                    color: Color.fromARGB(255, 20, 161, 20),
                    iconSize: 40,
                    icon: const Icon(Icons.check_sharp),
                    onPressed: () {
                      addTx(titleController.text,
                          double.parse(amountController.text));
                      // titleController.clear();
                      // amountController.clear();
                    },
                  ),
                  //borderRadius: BorderRadius.all(Radius.elliptical(50, 50)),
                ),
              ],
            ),
          ),
          /*
          Output cards
          */
          Container(
            //height: 450,
            constraints: BoxConstraints.expand(height: 500),
            //: Clip.hardEdge,
            child: CupertinoScrollbar(
              scrollbarOrientation: ScrollbarOrientation.right,
              isAlwaysShown: true,

              //scrollbarOrientation: ScrollbarOrientation.right,
              child: ListView(
                // physics: ClampingScrollPhysics(),
                children: transactionList.map(
                  (tx) {
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 5,
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(166, 255, 191, 0),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                topLeft: Radius.circular(10),
                                topRight: Radius.elliptical(40, 35),
                                bottomRight: Radius.elliptical(40, 35),
                              ),
                            ),
                            padding: EdgeInsets.all(15),
                            child: Text(
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 20,
                                color: Colors.black,
                              ),
                              '\$' +
                                  tx.amount
                                      .toString(), // ${tx.amount} <= string interpolation
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.black),
                                  tx.title),
                              Text(
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                                DateFormat('MMMM-dd-yyyy').format(tx.date),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
          ),
          Container(
            child: RaisedButton(
              padding: EdgeInsets.all(1),
              onPressed: () {
                return changePage(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
