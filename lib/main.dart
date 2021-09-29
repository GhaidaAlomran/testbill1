import 'package:flutter/material.dart';
import './transaction.dart';
import 'package:date_format/date_format.dart';

void main() {
  runApp(MyHomePage());
}

//gg
//gg
class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: "t1",
      title: "Shoe",
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t2",
      title: "STC",
      amount: 49.00,
      date: DateTime.now(),
    ),
  ];

  String titleInput;
  String amountInput;
  final titleContoller = TextEditingController();
  final amountContoller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
          appBar: AppBar(
            title: Text("My app"),
          ),
          body: Column(
            //  mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Card(
                  color: Colors.blue,
                  child: Text("CHART"),
                  elevation: 5,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                    // onChanged: (val) {
                    //الطريقة الاولى (أ)
                    //  titleInput = val;
                    //gg
                    //gggg
                    //gg
//ggggg
//g
//ggg
//g
//g
//g
//gg
                    //gggggg
                    controller: titleContoller,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Amount'),
                    // onChanged: (val) => amountInput = val, //الطريقة الاولى (ب)
                    controller: amountContoller,
                  ),
                  FlatButton(
                    child: Text("Add Transaction"),
                    textColor: Colors.purple,
                    onPressed: () {
                      print(titleContoller.text);
                      print(amountContoller.text);
                    },
                  ),
                ],
              ),
              Column(
                children: transactions.map((tr) {
                  return Card(
                      child: Row(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.purple, width: 2),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          '\$${tr.amount}',
                          style: TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tr.title,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              formatDate(tr.date, [yyyy, '-', mm, '-', dd]),
                              //DateFormat('yyyy-MM-dd').format(tr.date),
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      )
                    ],
                  ));
                }).toList(),
              )
            ],
          )),
    );
  }
}
