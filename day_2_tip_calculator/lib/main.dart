import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // for storing value typed in the textfield
  final controller = TextEditingController();
  List<bool> _selection = [true, false, false];
  String tip;

  void updateSelection(int selectedIndex){
    setState(() {
      for(int i = 0; i<_selection.length; i++){
        _selection[i] = selectedIndex == i;
      }
    });
  }

  void calculateTip(){
    final totalAmount = double.parse(controller.text);
    final selectedIndex = _selection.indexWhere((element) => element);
    final tipPercentage = [0.1, 0.15, .2][selectedIndex];

    final tipTotal = (totalAmount * tipPercentage).toStringAsFixed(2);
    setState(() {
      tip = '\$$tipTotal';
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              if(tip!=null)
                Padding(
                    padding: EdgeInsets.all(20),
                  child: Text(
                    tip,
                    style: TextStyle(
                      fontSize: 30
                    ),
                  ),
                ),
              Text('Total Amount'),
              SizedBox(
                width: 70,
                child: TextField(
                  controller: controller,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "\$100.00",
                  ),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ToggleButtons(
                    children: [
                      Text("10%"),
                      Text("15%"),
                      Text("20%"),
                    ],
                    isSelected: _selection,
                  onPressed: updateSelection
                ),
              ),
              FlatButton(
                  onPressed: calculateTip,
                  child: Text('Calculate'),
                color: Colors.green,
                textColor: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
