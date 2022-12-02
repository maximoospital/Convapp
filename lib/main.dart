import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:convapp/screens/length.dart';
import 'package:convapp/screens/time.dart';
import 'package:convapp/screens/temperature.dart';
import 'package:convapp/screens/mass.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MaterialApp(
    home: Home(),
    title: 'Convapp',
    debugShowCheckedModeBanner: false,
    theme: ThemeData.light().copyWith(
      primaryColor: Colors.black,
      scaffoldBackgroundColor: Colors.white,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            onPrimary: Colors.white,
          )),
    ),
    darkTheme: ThemeData.dark().copyWith(
      primaryColor: Colors.white,
      scaffoldBackgroundColor: Colors.black,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            onPrimary: Colors.black,
          )),
    ),
  ),
  )
  );}


class Home extends StatelessWidget {
  double widget1Opacity = 0.0;
  @override
  void initialization() async {
    print('ready in 2...');
    await Future.delayed(const Duration(seconds: 1));
    print('go!');
    FlutterNativeSplash.remove();
  }

  Widget build(BuildContext ctx) {
    final isDarkMode = Theme.of(ctx).brightness == Brightness.dark;
    final size = MediaQuery.of(ctx).size; //getting the size property
    double logicWidth = 460;
    double logicHeight = 460;
    initialization();
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
                    constraints: BoxConstraints(minWidth: 442, maxWidth: 900),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: [
                            Expanded(child:Text(
                                "welcome to",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 14.7,
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w600,
                                )))
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(child:Image.asset(
                              isDarkMode
                                  ? 'assets/images/logo_long_dark.png'
                                  : 'assets/images/logo_long_light.png',
                              fit: BoxFit.contain,
                            )),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(child:Text(
                                "select a conversion mode:",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w600,
                                )))
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Expanded(child:ElevatedButton(
                                onPressed: () {
                                  Navigator.of(ctx).push(MaterialPageRoute(builder: (BuildContext context) => const length()));
                                },
                                child: const Text('length.'),
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
                            )),
                            SizedBox(width:10),
                            Expanded(child:ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: isDarkMode ? Colors.white : Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                  elevation: 0,
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w900,
                                  )),
                              onPressed: () {
                                Navigator.of(ctx).push(MaterialPageRoute(builder: (BuildContext context) => const mass()));
                              },
                              child: const Text('mass.'),
                            ))
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(child:ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: isDarkMode ? Colors.white : Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                  elevation: 0,
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w900,
                                  )),
                              onPressed: () {
                                Navigator.of(ctx).push(MaterialPageRoute(builder: (BuildContext context) => const temperature()));
                              },
                              child: const Text('temperature.'),
                            )),
                            SizedBox(width:10),
                            Expanded(child:ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: isDarkMode ? Colors.white : Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                  elevation: 0,
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w900,
                                  )),
                              onPressed: () {
                                Navigator.of(ctx).push(MaterialPageRoute(builder: (BuildContext context) => const time()));
                              },
                              child: const Text('time.'),
                            )),
                          ],
                        ),
                        SizedBox(height: 30),
                        Row(
                          children: [
                            Expanded(child:Text(
                                "@ Maximo Ospital, 2022.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w900,
                                )))
                          ],
                        ),
                      ],
                    ),
                  )
              ),
            ),
          )
        ),
      ),
    );
  }
}