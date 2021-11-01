import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  //على الرغم من اننا ما نادينا set state
// سويناه ستيتفل علشان لما ادخل البيانات وانتقل من انبوت الى انبوت ما تطبي المعلومات
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleContoller = TextEditingController();

  final amountContoller = TextEditingController();

  void submitData() {
    final enterdTitle = titleContoller.text;
    final enteredAmount = double.parse(amountContoller.text);

    if (enterdTitle.isEmpty || enteredAmount < 0) {
      return;
    }

    widget.addTx(
      titleContoller.text,
      double.parse(amountContoller.text),
    );

    Navigator.of(context).pop();
  } //علشان يربط الفنشكن الي جتنا من الكلاس اللي فوق مع هذا الكلاس

//gg
  @override
  //remote add origin https://github.com/GhaidaAlomran/test55.git
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                // onChanged: (val) {
                //الطريقة الاولى (أ)
                //  titleInput = val;
                controller: titleContoller,
                onSubmitted: (_) => submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                // onChanged: (val) => amountInput = val, //الطريقة الاولى (ب)
                controller: amountContoller,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitData(),
              ),
              FlatButton(
                child: Text("Add Transaction"),
                textColor: Theme.of(context).primaryColor,
                onPressed: submitData,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
