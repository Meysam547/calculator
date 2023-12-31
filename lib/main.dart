import 'package:calculator/widgets/mybutton.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: AppBarTheme(backgroundColor: Colors.black54, titleTextStyle: TextStyle(color: Colors.white)),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
          fontFamily: 'yekan'),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State createState() {
    return MyHomePageSate();
  }
}

class MyHomePageSate extends State {
  double fNum = 0;
  String showNumber = "";
  String operation = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.black12,

      appBar: AppBar(
        title: Text(
          'ماشین حساب',
          style: TextStyle(fontSize: 23),
        ),
        leading: Icon(
          Icons.calculate,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //this monitor
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 15),
              child: Text(
                showNumber,
                style: TextStyle(fontSize: 26, letterSpacing: 5, fontFamily: ''),
              ),
              height: 60,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(188, 209, 192, 1),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black26, width: 3)),
              width: double.infinity,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (int i = 7; i < 10; i++)
                  MyButton(
                    i.toString(),
                    onClick: () {
                      if (operation == "=") {
                        showNumber = '';
                        operation = '';
                      }
                      setState(() {
                        showNumber += i.toString();
                      });
                    },
                  ),
                MyButton(
                  '÷',
                  onClick: () {
                    fNum = double.parse(showNumber);
                    showNumber = '';
                    operation = "÷";
                    setState(() {});
                  },
                )
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (int i = 4; i < 7; i++)
                  MyButton(
                    i.toString(),
                    onClick: () {
                      if (operation == "=") {
                        showNumber = '';
                        operation = '';
                      }
                      setState(() {
                        showNumber += i.toString();
                      });
                    },
                  ),
                MyButton(
                  '×',
                  onClick: () {
                    fNum = double.parse(showNumber);
                    showNumber = '';
                    operation = "×";
                    setState(() {});
                  },
                )
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (int i = 1; i < 4; i++)
                  MyButton(
                    i.toString(),
                    onClick: () {
                      if (operation == "=") {
                        showNumber = '';
                        operation = '';
                      }
                      setState(() {
                        showNumber += i.toString();
                      });
                    },
                  ),
                MyButton(
                  '-',
                  onClick: () {
                    fNum = double.parse(showNumber);
                    showNumber = '';
                    operation = "-";
                    setState(() {});
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyButton(
                  '0',
                  onClick: () {
                    setState(() {
                      if (showNumber.length > 0) {
                        showNumber += '0';
                      }
                    });
                  },
                ),
                MyButton(
                  '.',
                  onClick: () {},
                ),
                MyButton(
                  '+',
                  onClick: () {
                    fNum = double.parse(showNumber);
                    showNumber = '';
                    operation = "+";
                    setState(() {});
                  },
                ),
                MyButton(
                  '=',
                  onClick: () {
                    int sNum = int.parse(showNumber);
                    switch (operation) {
                      case "+":
                        setState(() {
                          showNumber = (fNum + sNum).toString();
                          operation = '=';
                        });

                      case "-":
                        setState(() {
                          showNumber = (fNum - sNum).toString();
                          operation = '=';
                        });
                      case "×":
                        setState(() {
                          showNumber = (fNum * sNum).toString();
                          operation = '=';
                        });
                      case "÷":
                        setState(() {
                          showNumber = (fNum / sNum).toString();
                          operation = '=';
                        });
                    }
                  },
                  color: Colors.orange,
                  txtColor: Colors.white,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
