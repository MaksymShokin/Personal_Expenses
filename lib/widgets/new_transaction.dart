import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTransaction;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTransaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              // onChanged: (title) => titleInput = title,
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
            ),
            TextField(
              // onChanged: (amount) => amountInput = amount,
              keyboardType: TextInputType.number,
              controller: amountController,
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
            ),
            FlatButton(
              onPressed: () {
                addTransaction(
                  titleController.text,
                  double.parse(amountController.text),
                );
              },
              child: Text('Add purchase'),
              textColor: Colors.purple,
            )
          ],
        ),
      ),
      elevation: 5,
    );
  }
}
