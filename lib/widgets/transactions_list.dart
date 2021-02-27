import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionsList extends StatelessWidget {
  final List transactions;

  TransactionsList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'No transactions',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Container(
                  height: 200,
                  padding: EdgeInsets.only(
                    top: 15,
                  ),
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    // like flatlist
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: FittedBox(
                          child: Text(
                            '\$${transactions[index].amount}',
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ),
                );
                // return Card(
                //   child: Row(
                //     children: [
                //       Container(
                //         margin: EdgeInsets.symmetric(
                //           horizontal: 15,
                //           vertical: 10,
                //         ),
                //         padding: EdgeInsets.all(10),
                //         decoration: BoxDecoration(
                //           border: Border.all(
                //             color: Colors.purple,
                //             width: 2,
                //           ),
                //         ),
                //         child: Text(
                //           '\$${transactions[index].amount.toStringAsFixed(2)}',
                //           style: TextStyle(
                //             fontWeight: FontWeight.bold,
                //             fontSize: 20,
                //             color: Theme.of(context).primaryColor,
                //           ),
                //         ),
                //       ),
                //       Column(
                //         children: [
                //           Text(
                //             transactions[index].title,
                //             style: Theme.of(context)
                //                 .textTheme
                //                 .headline6, //acess global headline6 theme
                //           ),
                //           Text(
                //             DateFormat.yMMMd().format(transactions[index].date),
                //             style: TextStyle(
                //               color: Colors.grey,
                //             ),
                //           ),
                //         ],
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //       ),
                //     ],
                //   ),
                // );
              },
            ),
    );
  }
}
