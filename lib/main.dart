import 'package:flutter/material.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
        buttonTheme: ButtonThemeData(
          minWidth: 20,
          buttonColor: Theme.of(context).canvasColor
        )
      ),
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  String equation = '';
  TextEditingController _controller = TextEditingController();
  final _focusNodeEquation = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: SafeArea(
          child: Container(
            child: Center(
              child: Column(
                children: <Widget>[
                  Text('\$0'),
                  Expanded(
                    child: KeyboardActions(
                      config: KeyboardActionsConfig(
                        actions: [
                          KeyboardAction(
                            focusNode: _focusNodeEquation,
                            footerBuilder: (_) => PreferredSize(
                              preferredSize: Size.fromHeight(50),
                              child: SizedBox(
                                height: 50,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    OperationButtons(icon: Icons.add,),
                                    OperationButtons(icon: Icons.remove,),
                                    OperationButtons(icon: Icons.clear,),
                                  ],
                                ),
                              ),
                            )
                          )
                        ]
                      ),
                      child: TextField(
                        focusNode: _focusNodeEquation,
                        controller: _controller,
                        keyboardType: TextInputType.number,
                        onTap: () {
                          print('Tapped');
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

class OperationButtons extends StatelessWidget {

  final IconData icon;
  final Function operation;

  OperationButtons({
    @required this.icon,
    this.operation
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: IconButton(
        icon: Icon(icon),
      )
    );
  }
}
