import 'package:bill_project3/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: transactions.isEmpty
            ? Column(
                children: [
                  Text(
                    "There is no treansactions",
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Image.asset(
                    "assets/images/waiting.png",
                    fit: BoxFit.cover,
                  ),
                ],
              )
            : Expanded(
                child: SizedBox(
                  height: 400,
                  child: ListView.builder(
                      itemCount: transactions.length,
                      itemBuilder: (ctx, index) {
                        return Card(
                          elevation: 5,
                          margin: EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 5,
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 30,
                              child: Padding(
                                padding: EdgeInsets.all(6),
                                child: FittedBox(
                                  child:
                                      Text('\$${transactions[index].amount}'),
                                ),
                              ),
                            ),
                            title: Text(
                              transactions[index].title,
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            subtitle: Text(formatDate(transactions[index].date,
                                [yyyy, '-', mm, '-', dd])),
                          ),
                        );
                      }),
                ),
              )
        // : Column(
        //     children: transaction.map((tr) {
        //       return Card(
        //           child: Row(
        //         children: [
        //           Container(
        //             margin:
        //                 EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        //             decoration: BoxDecoration(
        //               border: Border.all(
        //                   color: Theme.of(context).primaryColor, width: 2),
        //             ),
        //             padding: EdgeInsets.all(10),
        //             child: Text(
        //               '\$${tr.amount.toStringAsFixed(2)}',
        //               style: TextStyle(
        //                   color: Theme.of(context).primaryColor,
        //                   fontWeight: FontWeight.bold,
        //                   fontSize: 20),
        //             ),
        //           ),
        //           Container(
        //             child: Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: [
        //                 Text(
        //                   tr.title,
        //                   style: TextStyle(
        //                       fontSize: 16, fontWeight: FontWeight.bold),
        //                 ),
        //                 Text(
        //                   formatDate(tr.date, [yyyy, '-', mm, '-', dd]),
        //                   //DateFormat('yyyy-MM-dd').format(tr.date),
        //                   style: TextStyle(color: Colors.grey),
        //                 ),
        //               ],
        //             ),
        //           )
        //         ],
        //       ));
        //     }).toList(),
        //   ),
        );
  }
}
