import 'package:bmi_calculator/components/my_card.dart';
import 'package:bmi_calculator/screens/InputPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/bottom_button.dart';


class OutputScreen extends StatelessWidget {

  OutputScreen({required this.bmi,required this.result,required this.advice});
  final String bmi;
  final String result;
  final String advice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 10,left: 15),
              child: Text(
                'Your Result',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: MyCard(
              cardColor: Color(0xFF282C4F),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    result.toUpperCase(),
                    style: TextStyle(
                      fontSize: 22,
                      color: Color(0xFF24D876),
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(bmi,
                    style: TextStyle(
                        fontSize: 100,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    advice,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
            )
          ),
          Expanded(child: BottomButton(title: 'ReCalculate',
            onPress: (){
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => InputPage()));
            },
          ),),
        ],
      ),
    );
  }
}
