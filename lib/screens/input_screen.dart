import 'package:bmi_calculator/models/argument.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/icon_content.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/reusable_card.dart';
import '../utils/constants.dart';
import '../utils/BMI_Calculator.dart';
import '../models/BMI_arguments.dart';

class InputScreen extends StatefulWidget {
  @override
  _InputScreenState createState() => _InputScreenState();
}

enum gender { Male, Female }

class _InputScreenState extends State<InputScreen> {
  bool isMale = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('BMI'),
          ),
          body: LayoutBuilder(
              builder: (context, constraints) {
            var w = constraints.maxWidth;
            var h = constraints.maxHeight;
            var verPad = 0.03 * w;

            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ReusableCard(
                        width: -2 * verPad + w / 2,
                        height: h / 4,
                        colour:
                            isMale ? kActiveCardColour : kInactiveCardColour,
                        onPress: () {
                          setState(() {
                            isMale = true;
                          });
                        },
                        cardChild: IconContent(
                          icon: FontAwesomeIcons.mars,
                          label: 'Male',
                        )),
                    ReusableCard(
                        width: -2 * verPad + w / 2,
                        height: h / 4,
                        colour:
                            isMale ? kInactiveCardColour : kActiveCardColour,
                        onPress: () {
                          setState(() {
                            isMale = false;
                          });
                        },
                        cardChild: IconContent(
                          icon: FontAwesomeIcons.venus,
                          label: 'Female',
                        )),
                  ],
                ),
                ReusableCard(
                  colour: kInactiveCardColour,
                  height: h / 4,
                  width: w - 2 * verPad,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Height",
                        style: kLabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            "${Provider.of<Argument>(context).height}",
                            style: kNumberTextStyle,
                          ),
                          Text(
                            'cm',
                            style: kLabelTextStyle,
                          )
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          inactiveTrackColor: Color(0xFF8D8E98),
                          activeTrackColor: Colors.white,
                          thumbColor: Color(0xFFEB1555),
                          overlayColor: Color(0x29EB1555),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0),
                        ),
                        child: Slider(
                          value: Provider.of<Argument>(context).getHeight(),
                          min: 120.0,
                          max: 220.0,
                          onChanged: (double newValue) {
                            Provider.of<Argument>(context).setHeight(newValue);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ReusableCard(
                        colour: kInactiveCardColour,
                        height: h / 4,
                        width: -2 * verPad + w / 2,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Weight',
                              style: kLabelTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: <Widget>[
                                Text(
                                  "${Provider.of<Argument>(context).weight}",
                                  style: kNumberTextStyle,
                                ),
                                Text(
                                  'kg',
                                  style: kLabelTextStyle,
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                FloatingActionButton(
                                    backgroundColor: Colors.grey,
                                    onPressed: () {
                                      double a= Provider.of<Argument>(context).getWeight();

                                      Provider.of<Argument>(context).setWeight(a-1);
                                    },
                                    child: Icon(
                                      FontAwesomeIcons.minus,
                                      color: Colors.white,
                                    )),
                                FloatingActionButton(
                                    backgroundColor: Colors.grey,
                                    onPressed: () {
                                      double a= Provider.of<Argument>(context).getWeight();

                                        Provider.of<Argument>(context).setWeight(a+1);

                                    },
                                    child: Icon(
                                      FontAwesomeIcons.plus,
                                      color: Colors.white,
                                    ))
                              ],
                            )
                          ],
                        )),
                    ReusableCard(
                      colour: kInactiveCardColour,
                      height: h / 4,
                      width: -2 * verPad + w / 2,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Age',
                            style: kLabelTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Text(
                                Provider.of<Argument>(context).getAge(),
                                style: kNumberTextStyle,
                              ),
                              Text(
                                'yr',
                                style: kLabelTextStyle,
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FloatingActionButton(
                                  backgroundColor: Colors.grey,
                                  onPressed: () {
                                    int a= Provider.of<Argument>(context).getAge();

                                    Provider.of<Argument>(context).setAge(a-1);
                                  },
                                  child: Icon(
                                    FontAwesomeIcons.minus,
                                    color: Colors.white,
                                  )),
                              FloatingActionButton(
                                  backgroundColor: Colors.grey,
                                  onPressed: () {
                                    int a= Provider.of<Argument>(context).getAge();

                                    Provider.of<Argument>(context).setAge(a+1);
                                  },
                                  child: Icon(
                                    FontAwesomeIcons.plus,
                                    color: Colors.white,
                                  )),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: RaisedButton(
                    color: Colors.pinkAccent,
                    onPressed: () {
                      BMICalculatorBrain bmiCalc =
                          BMICalculatorBrain(height: Provider.of<Argument>(context).getHeight(), weight: Provider.of<Argument>(context).getWeight());
                      var bmi = bmiCalc.calculateBMI();
                      BMIArguments myArgs = BMIArguments(
                          interpretation: bmiCalc.getInterpretation(),
                          bmiResult: bmiCalc.getResult(),
                          bmi: bmi);
                      Navigator.pushNamed(context, '/result',
                          arguments: myArgs);
                    },
                    child: Text(
                      'Calculate',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            );
          })),
    );
  }
}
