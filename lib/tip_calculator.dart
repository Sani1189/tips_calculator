import 'package:flutter/material.dart';

class TipsCalculatorPage extends StatefulWidget {
  const TipsCalculatorPage({Key? key}) : super(key: key);

  @override
  _TipsCalculatorPageState createState() => _TipsCalculatorPageState();
}

class _TipsCalculatorPageState extends State<TipsCalculatorPage> {
  double totalBill = 0.0;
  double tipPercentage = 0.0;
  int numberOfPeople = 1;

  double totalTip = 0.0;
  double totalAmount = 0.0;
  double amountPerPerson = 0.0;

  void calculate() {
    setState(() {
      totalTip = totalBill * tipPercentage / 100;
      totalAmount = totalBill + totalTip;
      amountPerPerson = totalAmount / numberOfPeople;
    });
  }

  void clearFields() {
    setState(() {
      totalBill = 0.0;
      tipPercentage = 0.0;
      numberOfPeople = 1;
      totalTip = 0.0;
      totalAmount = 0.0;
      amountPerPerson = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Tips Calculator',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: Container(
        color: Color(0xFFF5F5F5),
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(12.0),
              child: Column(
                children: [
                  SizedBox(height: 4.0),
                  Text(
                    'Total Amount',
                    style: TextStyle(fontSize: 16.0, color: Colors.black),
                  ),
                  Text(
                    '\$${totalAmount.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Person',
                            style: TextStyle(fontSize: 16.0, color: Colors.black),
                          ),
                          Text(
                            '$numberOfPeople',
                            style: TextStyle(fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Tip',
                            style: TextStyle(fontSize: 16.0, color: Colors.black),
                          ),
                          Text(
                            '\$${totalTip.toStringAsFixed(2)}',
                            style: TextStyle(fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 12.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Amount Per Person',
                        style: TextStyle(fontSize: 16.0, color: Colors.black),
                      ),
                      Text(
                        '\$${amountPerPerson.toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.0),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Spacer(),
            TextField(
              key: Key('total_bill_input'),
              decoration: InputDecoration(
                labelText: 'Total Bill',
                border: OutlineInputBorder(),
                prefixText: '\$',
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onChanged: (value) {
                totalBill = double.tryParse(value) ?? 0.0;
                calculate();
              },
            ),
            SizedBox(height: 8.0),
            TextField(
              key: Key('tip_percentage_input'),
              decoration: InputDecoration(
                labelText: 'Tip Percentage',
                border: OutlineInputBorder(),
                suffixText: '%',
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onChanged: (value) {
                tipPercentage = double.tryParse(value) ?? 0.0;
                calculate();
              },
            ),
            SizedBox(height: 8.0),
            TextField(
              key: Key('number_of_people_input'),
              decoration: InputDecoration(
                labelText: 'Number of People',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                numberOfPeople = int.tryParse(value) ?? 1;
                calculate();
              },
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: calculate,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                    ),
                    child: Text(
                      'Calculate',
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    onPressed: clearFields,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                    ),
                    child: Text(
                      'Clear',
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
