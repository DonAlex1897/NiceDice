import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.redAccent[400],
      appBar: AppBar(
        title: Text('Role The Dice'),
        backgroundColor: Colors.redAccent[700],
      ),
      body: DicePage(),
    ),
  ));
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  String numberOfDices = 'Two Dices';
  int dicesCount = 2;

  void diceCountChange() {
    if (dicesCount == 1) {
      dicesCount = 2;
      numberOfDices = 'One Dices';
    } else {
      dicesCount = 1;
      numberOfDices = 'Two Dices';
    }
  }

  Row insertRows() {
      if (dicesCount == 2) {
        return Row(
          children: <Widget>[
            Expanded(
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        leftDiceNumber = Random().nextInt(6) + 1;
                        rightDiceNumber = Random().nextInt(6) + 1;
                      });
                    },
                    child: Image.asset('images/dice$leftDiceNumber.png'))),
            Expanded(
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        leftDiceNumber = Random().nextInt(6) + 1;
                        rightDiceNumber = Random().nextInt(6) + 1;
                      });
                    },
                    child: Image.asset('images/dice$rightDiceNumber.png')))
          ],
        );
      } else {
        return Row(
          children: <Widget>[
            Expanded(
              child: TextButton(
                onPressed: () {
                  setState(() {
                    leftDiceNumber = Random().nextInt(6) + 1;
                    rightDiceNumber = Random().nextInt(6) + 1;
                  });
                },
                child: Image.asset('images/dice$leftDiceNumber.png'),
              ),
            ),
          ],
        );
      }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Card(
            color: Colors.lightBlueAccent[100],
            child: TextButton(
              onPressed: () {
                setState(() {
                  diceCountChange();
                });
              },
              child: Text(
                numberOfDices,
                style: TextStyle(
                  color: Colors.redAccent[400],
                ),
              ),
            ),
          ),
          insertRows()
        ],
      ),
    );
  }
}
