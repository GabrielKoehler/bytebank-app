import 'package:bytebank/screens/transfer/list.dart';
import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  const BytebankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.green[900],
          secondary: Colors.blue[800],
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.blue[700],
            onPrimary: Colors.white,
            //   side: BorderSide(color: Colors.black, width: 2.5),
          ),
        ),
      ),
      home: TransferList(),
    );
  }
}
