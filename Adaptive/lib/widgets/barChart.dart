import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget{

  final String label;
  final double spendingAmount;
  final double percAmount;

  ChartBar(this.label, this.spendingAmount, this.percAmount);

  Widget build(BuildContext context){

    return LayoutBuilder(builder: (ctx, constraints){

      return Column(
      children: <Widget>[
        Container(
          height: constraints.maxHeight * 0.15,
          child: FittedBox (child: Text('Rs.${spendingAmount.toStringAsFixed(0)}'))),
        SizedBox(
          height: constraints.maxHeight * 0.05
        ),
        Container(
          height: constraints.maxHeight * 0.6,
          width: 10,
          child: Stack(children:<Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                color: Color.fromRGBO(220, 220, 220, 50),
                borderRadius: BorderRadius.circular(10)
              ),
            ),
            FractionallySizedBox(
              heightFactor: percAmount,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10)
                )
              ),
            )

          ]
          )
        ),
        SizedBox(
          height: constraints.maxHeight * 0.05
        ),
        Container(
          height: constraints.maxHeight*0.15,
          child: FittedBox(child: Text('$label'))),
      ],
    );

    });
    
    
  }
}