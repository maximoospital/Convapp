import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';


const List<String> tipomass = <String>['t', 'st', 'kg', 'lb', 'hg', 'oz', 'dag', 'g', 'dg', 'cg', 'mg', 'μg'];

class mass extends StatefulWidget {
  const mass({super.key});

  @override
  State<mass> createState() => massstate();
}

class massstate extends State<mass> {
  String _dropDownValue = 'kg';
  String _dropDownValue2 = 'g';
  double inputValue = 0;
  double outputValue = 0;
  double valorG = 0;
  String inputValueInt = "";
  outputFunc(inputVal) {
    switch(_dropDownValue) {
      case 't':
        setState((){
          valorG = double.parse(inputVal) * 1000000;
        });
        break; // The switch statement must be told to exit, or it will execute every case.
      case 'st':
        setState((){
          valorG = double.parse(inputVal) * 6350.29;
        });
        break;
      case 'kg':
        setState((){
          valorG = double.parse(inputVal) * 1000;
        });
        break;
      case 'lb':
        setState((){
          valorG = double.parse(inputVal) * 453.59237;
        });
        break;
      case 'hg':
        setState((){
          valorG = double.parse(inputVal) * 100;
        });
        break;
      case 'oz':
        setState((){
          valorG = double.parse(inputVal) * 28.34952;
        });
        break;
      case 'dag':
        setState((){
          valorG = double.parse(inputVal) * 10;
        });
        break;
      case 'g':
        print('m!');
        setState((){
          valorG = double.parse(inputVal);
        });
        break;
      case 'dg':
        setState((){
          valorG = double.parse(inputVal) / 10;
        });
        break;
      case 'cg':
        setState((){
          valorG = double.parse(inputVal) / 100;
        });
        break;
      case 'mg':
        setState((){
          valorG = double.parse(inputVal) / 1000;
        });
        break;
      case 'μg':
        setState((){
          valorG = double.parse(inputVal) / 10000000;
        });
        break;
      default:
        print('error');
    }
    switch(_dropDownValue2) {
      case 't':
        setState((){
          outputValue = valorG / 1000000;
        });
        break; // The switch statement must be told to exit, or it will execute every case.
      case 'st':
        setState((){
          outputValue = valorG / 6350.29;
        });
        break;
      case 'kg':
        setState((){
          outputValue = valorG / 1000;
        });
        break;
      case 'lb':
        setState((){
          outputValue = valorG / 453.59237;
        });
        break;
      case 'hg':
        setState((){
          outputValue = valorG / 100;
        });
        break;
      case 'oz':
        setState((){
          outputValue = valorG / 28.34952;
        });
        break;
      case 'dag':
        setState((){
          outputValue = valorG / 10;
        });
        break;
      case 'g':
        print('m!');
        setState((){
          outputValue = valorG;
        });
        break;
      case 'dg':
        setState((){
          outputValue = valorG * 10;
        });
        break;
      case 'cg':
        setState((){
          outputValue = valorG * 100;
        });
        break;
      case 'mg':
        setState((){
          outputValue = valorG * 1000;
        });
        break;
      case 'μg':
        setState((){
          outputValue = valorG * 10000000;
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
                                "mass.",
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
                                  print(valorG);
                                } else {
                                  setState(() {
                                    _dropDownValue = newValue!;
                                  });
                                  outputFunc(inputValueInt);
                                  print(valorG);
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
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              onChanged: widget.onChanged,
              items: tipomass.map<DropdownMenuItem<String>>((String value) {
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