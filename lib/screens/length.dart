import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';


const List<String> tipolen = <String>['mi', 'km', 'hm', 'dcm', 'm', 'yd', 'ft', 'dm', 'in', 'cm', 'mm'];

class length extends StatefulWidget {
  const length({super.key});

  @override
  State<length> createState() => lengthstate();
}

class lengthstate extends State<length> {
  String _dropDownValue = 'km';
  String _dropDownValue2 = 'm';
  double inputValue = 0;
  double outputValue = 0;
  double valorMetro = 0;
  String inputValueInt = "";
  outputFunc(inputVal) {
    switch(_dropDownValue) {
      case 'mi':
        setState((){
          valorMetro = double.parse(inputVal) * 1609.344;
        });
        break; // The switch statement must be told to exit, or it will execute every case.
      case 'km':
        setState((){
          valorMetro = double.parse(inputVal) * 1000;
        });
        break;
      case 'hm':
        setState((){
          valorMetro = double.parse(inputVal) * 100;
        });
        break;
      case 'dcm':
        setState((){
          valorMetro = double.parse(inputVal) * 10;
        });
        break;
      case 'm':
        print('m!');
        setState((){
          valorMetro = double.parse(inputVal);
        });
        break;
      case 'yd':
        setState((){
          valorMetro = double.parse(inputVal) / 1.094;
        });
        break;
      case 'ft':
        setState((){
          valorMetro = double.parse(inputVal) / 3.281;
        });
        break;
      case 'dm':
        setState((){
          valorMetro = double.parse(inputVal) / 10;
        });
        break;
      case 'in':
        setState((){
          valorMetro = double.parse(inputVal) / 39.37;
        });
        break;
      case 'cm':
        setState((){
          valorMetro = double.parse(inputVal) / 100;
        });
        break;
      case 'mm':
        setState((){
          valorMetro = double.parse(inputVal) / 1000;
        });
        break;
      default:
        print('error');
    }
    switch(_dropDownValue2) {
      case 'mi':
        setState((){
          outputValue = valorMetro / 1609.344;
        });
        break; // The switch statement must be told to exit, or it will execute every case.
      case 'km':
        setState((){
          outputValue = valorMetro / 1000;
        });
        break;
      case 'hm':
        setState((){
          outputValue = valorMetro / 100;
        });
        break;
      case 'dcm':
        setState((){
          outputValue = valorMetro / 10;
        });
        break;
      case 'm':
        print('m!');
        setState((){
          outputValue = valorMetro;
        });
        break;
      case 'yd':
        setState((){
          outputValue = valorMetro * 1.094;
        });
        break;
      case 'ft':
        setState((){
          outputValue = valorMetro * 3.281;
        });
        break;
      case 'dm':
        setState((){
          outputValue = valorMetro * 10;
        });
        break;
      case 'in':
        setState((){
          outputValue = valorMetro * 39.37;
        });
        break;
      case 'cm':
        setState((){
          outputValue = valorMetro * 100;
        });
        break;
      case 'mm':
        setState((){
          outputValue = valorMetro * 1000;
        });
        break;
      default:
        print('error');
    }
  }

  @override
  Widget build(BuildContext context) {
    double logicWidth = 460;
    double logicHeight = 460;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size; //getting the size property
    return Scaffold(
      body: SizedBox.expand(
        child: FittedBox(
          fit: BoxFit.contain,
          alignment: Alignment.center,
          child: SizedBox(
            width: logicWidth,
            height: logicHeight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45),
              child: Center(
                  child: Container(
                    constraints: BoxConstraints(minWidth: 376, maxWidth: 900),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: [
                            Expanded(child:Text(
                                "length.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w900,
                                )))
                          ],
                        ),
                        SizedBox(height: 40),
                        Row(
                          children: [
                            Expanded(child:TextField(
                              decoration: InputDecoration(
                                hintText: "input number.",
                                border: InputBorder.none,
                                enabledBorder: myinputborder(),
                                focusedBorder: myfocusborder(isDarkMode),
                              ),
                              style: TextStyle(
                                fontSize: 24,
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w300,
                              ),
                              keyboardType: TextInputType.number,
                              onChanged: (text) {
                                if (text! == ""){
                                  inputValue = 0;
                                  inputValueInt = "0";
                                  outputFunc("0");
                                  print('Input text field: $inputValue');
                                } else {
                                  inputValue = double.parse(text);
                                  inputValueInt = text;
                                  outputFunc(text);
                                  print('Input text field: $inputValue');
                                }
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(RegExp(r"[0-9./]")),
                                TextInputFormatter.withFunction((oldValue, newValue) {
                                  try {
                                    final text = newValue.text;
                                    if (text.isNotEmpty) double.parse(text);
                                    return newValue;
                                  } catch (e) {}
                                  return oldValue;
                                }),
                              ], // Only numbers can be entered
                            )),
                            SizedBox(width:10),
                            Expanded(child:DropDownWidget(
                              dropdownValue: _dropDownValue,
                              darkMode: isDarkMode,
                              onChanged: (String? newValue) {
                                if(newValue! == _dropDownValue2){
                                  setState(() {
                                    _dropDownValue2 = _dropDownValue;
                                    _dropDownValue = newValue!;
                                  });
                                  outputFunc(inputValueInt);
                                  print(valorMetro);
                                } else {
                                  setState(() {
                                    _dropDownValue = newValue!;
                                  });
                                  outputFunc(inputValueInt);
                                  print(valorMetro);
                                }
                              },
                            )),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(child: Padding(
                                padding: EdgeInsets.all(10),
                                child: SelectableText(
                                    '$outputValue',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontFamily: "Inter",
                                      fontWeight: FontWeight.w600,
                                    )
                                )
                            )),
                            SizedBox(width:10),
                            Expanded(child:DropDownWidget(
                              dropdownValue: _dropDownValue2,
                              darkMode: isDarkMode,
                              onChanged: (String? newValue2) {
                                if(newValue2! == _dropDownValue){
                                  setState(() {
                                    _dropDownValue = _dropDownValue2;
                                    _dropDownValue2 = newValue2!;
                                  });
                                  outputFunc(inputValueInt);
                                } else {
                                  setState(() {
                                    _dropDownValue2 = newValue2!;
                                  });
                                  outputFunc(inputValueInt);
                                }
                              },
                            ))
                          ],
                        ),
                        SizedBox(height: 40),
                        Row(
                          children: [
                            Expanded(child:SelectableText.rich(
                              textAlign: TextAlign.center,
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: '$inputValue $_dropDownValue',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontFamily: "Inter",
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' = ',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontFamily: "Inter",
                                        fontWeight: FontWeight.w300
                                    ),
                                  ),
                                  TextSpan(
                                    text: '$outputValue $_dropDownValue2',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontFamily: "Inter",
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ],
                              ),
                            ))
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                            children: [
                              Expanded(child:ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('back.'),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: isDarkMode ? Colors.white : Colors.black,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(0),
                                      ),
                                      elevation: 0,
                                      padding: EdgeInsets.symmetric(vertical: 20),
                                      textStyle: TextStyle(
                                        fontSize: 24,
                                        fontFamily: "Inter",
                                        fontWeight: FontWeight.w900,
                                      ))
                              ))]),
                      ],
                    ),
                  )
              ),
            ),
          )
        )
      )
    );
  }
}

OutlineInputBorder myinputborder(){ //return type is OutlineInputBorder
  return OutlineInputBorder( //Outline border type for TextFeild
      borderRadius: BorderRadius.all(Radius.circular(0)),
      borderSide: BorderSide(
        color:Colors.grey,
        width: 3,
      )
  );
}

OutlineInputBorder myfocusborder(isDarkMode){
  return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(0)),
      borderSide: BorderSide(
        color:isDarkMode ? Colors.white : Colors.black,
        width: 3,
      )
  );
}

class DropDownWidget extends StatefulWidget {
  final String dropdownValue;
  final Function(String?)? onChanged;
  final darkMode;
  DropDownWidget({required this.dropdownValue, this.onChanged, this.darkMode, Key? key}) : super(key: key);

  @override
  _DropDownWidgetState createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  @override
  Widget build(BuildContext context) {
    var darkMode = widget.darkMode;

    return Column(
      children: <Widget>[
        //dropdownField
    Container(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      decoration: BoxDecoration( color: widget.darkMode ? Colors.white : Colors.black, ),
      child: DropdownButton<String>(
        isExpanded: true,
        value: widget.dropdownValue,
        underline: SizedBox(),
        dropdownColor: widget.darkMode ? Colors.white : Colors.black,
        style: TextStyle(
          fontSize: 24,
          fontFamily: "Inter",
          fontWeight: FontWeight.w300,
        ),
        icon: Icon(
            Icons.arrow_downward,
            color: darkMode ? Colors.black : Colors.white,
        ),
        elevation: 16,
        onChanged: widget.onChanged,
        items: tipolen.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value, style: TextStyle(color: widget.darkMode ? Colors.black : Colors.white,),),
          );
        }).toList(),
      )
    ),

      ],
    );
  }
}


