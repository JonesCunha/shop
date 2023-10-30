import 'package:flutter/material.dart';

List<String> list = ['Opção 1', 'Opção 2', 'Opção 3'];

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pagina 2 para testes')),
      body: Column(
        children: [DropDownButtonExemple(),
        ],
      )
    );
  }
}

class DropDownButtonExemple extends StatefulWidget {
  const DropDownButtonExemple({super.key});

  @override
  State<DropDownButtonExemple> createState() => _DropDownButtonExempleState();
}

class _DropDownButtonExempleState extends State<DropDownButtonExemple> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return  DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }


}