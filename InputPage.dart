import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/my_card.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/screens/OutputPage.dart';
import 'package:bmi_calculator/components/round_button.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/calculator.dart';

const bottomContainerHeight = 80.0;
const activeCardColor = Color(0xFF1D1E33);
const inActiveCardColor = Color(0xFF282C4F);
const bottomContainerColor = Color(0xFFE8005E);

const sliderTextStyle = TextStyle(
  fontSize: 18,
  color: Color(0xFF8D8E98),
);
enum Gender{
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  double height = 180;
  int age = 20;
  double weight = 65;
  Color maleCardColor = Color(0xFF282C4F);
  Color femaleCardColor = Color(0xFF282C4F);
  Gender selectedGender = Gender.male;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: MyCard(
                      cardColor: selectedGender==Gender.male?inActiveCardColor:activeCardColor,

                      cardChild: IconContent(
                        icon: FontAwesomeIcons.male,
                        iconText: "Male",
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: MyCard(
                      cardColor: selectedGender==Gender.female?inActiveCardColor:activeCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.female,
                        iconText: "Female",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MyCard(
              cardColor: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Height',
                    style: sliderTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toStringAsFixed(0),
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        'cm',
                        style: sliderTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30),
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFE8005E),
                        overlayColor: Color(0x29E8005E)),
                    child: Expanded(
                      child: Slider(
                          inactiveColor: Color(0xFF8D8E98),
                          value: height,
                          min: 120,
                          max: 220,
                          onChanged: (val) {
                            setState(() {
                              height = val.toDouble();
                            });
                          }),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyCard(
                    cardColor: activeCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Weight',
                          style: sliderTextStyle,
                        ),
                        Text(
                          weight.toStringAsFixed(0),
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundButton(
                              icon: Icons.remove,
                              onClick: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundButton(
                              icon: Icons.add,
                              onClick: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: MyCard(
                    cardColor: activeCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Age',
                          style: sliderTextStyle,
                        ),
                        Text(
                          age.toStringAsFixed(0),
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundButton(
                              icon: Icons.remove,
                              onClick: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundButton(
                              icon: Icons.add,
                              onClick: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            title: "Calculate",
            onPress: () {
              BMICalculator bmiCalculator =
                  BMICalculator(weight: weight, height: height);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OutputScreen(
                    bmi: bmiCalculator.CalculateBMI(),
                    result: bmiCalculator.getResult(),
                    advice: bmiCalculator.getAdvice(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
