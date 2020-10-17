import 'package:bmi_calculator_of_techily_fly/BMIModel.dart';
import 'package:bmi_calculator_of_techily_fly/BMIResultScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BMICalculatorOfTechilyFlyScreen extends StatefulWidget {
  @override
  _BMICalculatorOfTechilyFlyScreenState createState() =>
      _BMICalculatorOfTechilyFlyScreenState();
}

class _BMICalculatorOfTechilyFlyScreenState
    extends State<BMICalculatorOfTechilyFlyScreen> {
  double _heightOfUser = 100.0;
  double _weightOfUser = 40.0;

  double _bmi = 0;

  BMIModel _bmiModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              child: SvgPicture.asset(
                "assets/images/heart.svg",
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "BMI Calculator Of Techily Fly",
              style: TextStyle(
                  color: Colors.red[700],
                  fontSize: 22,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              "We Care about Your Health",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 32,
            ),
            Text(
              "Height in (CM)",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 24,
                  fontWeight: FontWeight.w400),
            ),
            Container(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Slider(
                min: 80.0,
                max: 250.0,
                onChanged: (height) {
                  setState(() {
                    _heightOfUser = height;
                  });
                },
                value: _heightOfUser,
                divisions: 100,
                activeColor: Colors.pink,
                label: "$_heightOfUser",
              ),
            ),
            Text(
              "$_heightOfUser cm",
              style: TextStyle(
                  color: Colors.red, fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              "Weight in (KG)",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 24,
                  fontWeight: FontWeight.w400),
            ),
            Container(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Slider(
                min: 30.0,
                max: 120.0,
                onChanged: (weight) {
                  setState(() {
                    _weightOfUser = weight;
                  });
                },
                value: _weightOfUser,
                divisions: 100,
                activeColor: Colors.pink,
                label: "$_weightOfUser",
              ),
            ),
            Text(
              "$_weightOfUser kg",
              style: TextStyle(
                  color: Colors.red, fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 16,),
            Container(
              child: FlatButton.icon(
                  onPressed: () {
                    setState(() {
                      _bmi = _weightOfUser/((_heightOfUser/100)*(_heightOfUser/100));
                      if(_bmi >= 18.5 && _bmi <= 25){
                        _bmiModel = BMIModel(bmi: _bmi, isNormal: true, comments: "You are Totally Fit. (BMI = Body Mass Index)");
                      } else if(_bmi < 18.5){
                        _bmiModel = BMIModel(bmi: _bmi, isNormal: false, comments: "You are UnderWeighted. (BMI = Body Mass Index)");
                      } else if(_bmi > 25 && _bmi <= 30) {
                        _bmiModel = BMIModel(bmi: _bmi, isNormal: false, comments: "You are OverWeighted. (BMI = Body Mass Index)");
                      } else {
                        _bmiModel = BMIModel(bmi: _bmi, isNormal: false, comments: "You are Obese");
                      }
                    });

                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => BMIResultScreen(bmiModel: _bmiModel,)
                    ));
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
                  label: Text("Calculate"),
                textColor: Colors.white,
              color: Colors.pink,
              ),
              width: double.infinity,
              padding: EdgeInsets.only(left: 16, right: 16),
            ),
          ],
        ),
      )),
    );
  }
}
