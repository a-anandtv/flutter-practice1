import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Water Tracker',
      home:  WaterTracker(),
    );
  }
}

class WaterTracker extends StatefulWidget {
  const WaterTracker({Key key}) : super(key: key);

  @override
  _WaterTrackerState createState() => _WaterTrackerState();
}

class _WaterTrackerState extends State<WaterTracker> {

  // Measures
  double _dailyGoal = 11.0;
  double _waterConsumed = 0.0;
  int _consumedPercentage = 0;

  final _headerTextStyle = TextStyle(
    fontFamily: 'Nunito',
    fontSize: 35,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  final _descTextStyle = TextStyle(
    fontFamily: 'NunitoSans',
    fontSize: 18,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemGrey.withOpacity(0.01),
        leading: CupertinoButton(child: Icon(CupertinoIcons.back, color: Colors.black,), onPressed: (){},),
        trailing: CupertinoButton(child: Icon(CupertinoIcons.bell, color: Colors.black,), onPressed: (){},),
      ),
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                child: Align (
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Hydration',
                    textDirection: TextDirection.ltr,
                    style: _headerTextStyle,
                  ),
                ),
                margin: EdgeInsets.all(10.0)
              ),
              Container(
                  child: Align (
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Description why water is important',
                      textDirection: TextDirection.ltr,
                      style: _descTextStyle,
                    ),
                  ),
                  margin: EdgeInsets.only(left: 10.0, bottom: 10.0)
              ),
              Container(
                  child: Align (
                    alignment: Alignment.center,
                    child: _drawDroplet(),
                  ),
                  margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0)
              ),
            ],
          ),
        )
      ),
    );
  }

  // Widget holding droplet animation and measures/buttons below it
  Widget _drawDroplet() {

    // Font Styles
    final _pcntStyle = TextStyle(
      fontFamily: 'Nunito',
      fontWeight: FontWeight.bold,
      fontSize: 70,
      fontStyle: FontStyle.normal,
      color: Colors.black,
    );
    final _measureStyle = TextStyle(
      fontFamily: 'Nunito',
      fontWeight: FontWeight.normal,
      fontSize: 33,
      fontStyle: FontStyle.normal,
      color: Color(0xffB2B2B2),
    );
    final _buttonTxtStyle = TextStyle(
      fontFamily: 'Nunito',
      fontSize: 13,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
      color: Colors.black,
    );

    return Container(
      child: Column(
        children: [
          Container(
            child: Center(
              child: CustomPaint(
                size: Size(200, 300),
                painter: DropletPainter(),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              '$_consumedPercentage%',
              textDirection: TextDirection.ltr,
              style: _pcntStyle,
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              '$_waterConsumed' + 'l / ' + '$_dailyGoal' + 'l',
              textDirection: TextDirection.ltr,
              style: _measureStyle,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            alignment: Alignment.center,
            child: CupertinoButton(
              color: Color(0xffEAF1F4),
              child: Text(
                'Daily Goal',
                style: _buttonTxtStyle,
              ),
              borderRadius: BorderRadius.circular(30.0),
              onPressed: (){},
            )
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CupertinoButton(
                  child: Icon(Icons.remove),
                  color: Color(0xff6FA9C2),
                  borderRadius: BorderRadius.circular(30.0),
                  padding: EdgeInsets.all(16),
                  onPressed: () {
                    setState(() {
                      if (_waterConsumed > 0) {
                        _waterConsumed -= 0.250;
                        _consumedPercentage = ((_waterConsumed / _dailyGoal) * 100).round();
                      }
                    });
                  },
                ),
                CupertinoButton(
                  child: Icon(Icons.add),
                  color: Color(0xff6FA9C2),
                  borderRadius: BorderRadius.circular(30.0),
                  padding: EdgeInsets.all(16),
                  onPressed: () {
                    setState(() {
                      if (_waterConsumed < _dailyGoal) {
                        _waterConsumed += 0.250;
                        _consumedPercentage = ((_waterConsumed / _dailyGoal) * 100).round();
                      }
                    });
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}


// To draw the droplet
class DropletPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width*0.9990743,size.height*0.6580786);
    path_0.cubicTo(size.width*0.9990743,size.height*0.8465860,size.width*0.7757997,size.height*0.9994005,size.width*0.5003765,size.height*0.9994005);
    path_0.cubicTo(size.width*0.2249534,size.height*0.9994005,size.width*0.001679889,size.height*0.8465860,size.width*0.001679889,size.height*0.6580786);
    path_0.cubicTo(size.width*0.001679889,size.height*0.4695713,size.width*0.4267876,size.height*0.2494509,size.width*0.6128446,size.height*0.00005458673);
    path_0.cubicTo(size.width*0.8096166,size.height*0.2329570,size.width*0.9990743,size.height*0.4695713,size.width*0.9990743,size.height*0.6580786);
    path_0.close();

    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.color = Color(0xffF0F0F0).withOpacity(1.0);
    canvas.drawPath(path_0,paint_0_fill);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

