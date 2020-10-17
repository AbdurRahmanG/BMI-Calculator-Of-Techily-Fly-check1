import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class BMIResultScreen extends StatelessWidget {
  final bmiModel;

  BMIResultScreen({this.bmiModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              child: bmiModel.isNormal
                  ? SvgPicture.asset(
                "assets/images/happy_heart_style.svg",
                fit: BoxFit.contain,
              )
                  : SvgPicture.asset(
                "assets/images/sad_heart_style.svg",
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Your BMI is ${bmiModel.bmi.round()}",
              style: TextStyle(
                  color: Colors.red[700],
                  fontSize: 32,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              "${bmiModel.comments}",
              style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 12,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 16,),

            bmiModel.isNormal ?
            Text(
              "Hurray! Your BMI is Normal.",
              style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ) :
            Text(
              "Sadly! Your BMI is not Normal.",
              style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),

            SizedBox(height: 16,),
            Container(
              child: FlatButton.icon(
                onPressed: () {

                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                label: Text("Let's Calculate Again"),
                textColor: Colors.white,
                color: Colors.pink,
              ),
              width: double.infinity,
              padding: EdgeInsets.only(left: 16, right: 16),
            ),

          ],
        ),
      ),
    );
  }
}
