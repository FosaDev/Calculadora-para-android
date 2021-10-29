import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatefulWidget{
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  String Guardar = "0";
  double ValorNumero1 = 0;
  double ValorNumero2 = 0;
  String Resultado = "";
  String Salida = "0";
  operacion(String ButtonValue){
      if(ButtonValue == "C"){
          Salida = "0";
          ValorNumero1 = 0;
          ValorNumero2 = 0;
          Resultado = "";

      } else if(ButtonValue == "+" || ButtonValue == "-" || ButtonValue == "*" || ButtonValue == "/"){
        ValorNumero1 = double.parse(Guardar);
        Resultado = ButtonValue;
        Salida = "0";

      } else if(ButtonValue == "=") {
        ValorNumero2 = double.parse(Guardar) ;
          if(Resultado == "+"){
            Salida = (ValorNumero1 + ValorNumero2).toString();
          }
          if(Resultado == "-"){
          Salida = (ValorNumero1 - ValorNumero2).toString();
          }
          if(Resultado == "*"){
          Salida = (ValorNumero1 * ValorNumero2).toString();
          }
          if(Resultado == "/"){
          Salida = (ValorNumero1 / ValorNumero2).toString();
          }
          ValorNumero1 = 0;
          ValorNumero2 = 0;
          Resultado = "";
      } else{
        Salida = Salida + ButtonValue;
      }
      setState(() {
        Guardar = double.parse(Salida).toStringAsFixed(2);
      });
  }

  Widget button(String ButtonText){
    return Expanded(
      child: RawMaterialButton(
        child: Text(
          "$ButtonText",
        style: TextStyle(
            fontSize: 30,
            color: Colors.white54,
            fontWeight: FontWeight.w900
        ),
        ),
        fillColor:  Colors.blueGrey,
        padding: EdgeInsets.all(35.0),
        splashColor: Colors.white,
        shape: Border.all(color: Colors.redAccent, width: 1),
        onPressed: () {
          operacion(ButtonText);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context){
  return MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Calculadora"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
         margin: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.redAccent, width: 4),
                ),
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.only(bottom: 4),
                child: Text(
                    "$Guardar",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
            ),
            Row(
             children: [
               button("1"),
               SizedBox(
                 width: 5,
               ),
               button("2"),
               SizedBox(
                 width: 5,
               ),
               button("3"),
               SizedBox(
                 width: 5,
               ),
               button("4"),
               SizedBox(
                 width: 5,
               ),
             ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                button("5"),
                SizedBox(
                  width: 5,
                ),
                button("6"),
                SizedBox(
                  width: 5,
                ),
                button("7"),
                SizedBox(
                  width: 5,
                ),
                button("8"),
                SizedBox(
                  width: 5,
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                button("9"),
                SizedBox(
                  width: 5,
                ),
                button("0"),
                SizedBox(
                  width: 5,
                ),
                button("+"),
                SizedBox(
                  width: 5,
                ),
                button("-"),
                SizedBox(
                  width: 5,
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                button("*"),
                SizedBox(
                  width: 5,
                ),
                button("/"),
                SizedBox(
                  width: 5,
                ),
                button("C"),
                SizedBox(
                  width: 5,
                ),
                button("="),
                SizedBox(
                  width: 5,
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
  }
}