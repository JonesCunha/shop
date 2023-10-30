// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:testefin/pages/my_home_page.dart';

main() {
  //forçar o app nao girar a tela.
  //WidgetsFlutterBinding.ensureInitialized();
  //SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(FinancialAPP());
}

class FinancialAPP extends StatelessWidget {
  const FinancialAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      //theme: Thema(),
    );
  }


}
