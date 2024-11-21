import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:leccion_salazar_cesar_suma_digitos/controller/suma_digitos.dart';

class SumaDigitos extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => SumaDigitosState();
}

class SumaDigitosState extends State<SumaDigitos>{
  //?CODIGO
  //Instanciar
  final SumadorDeDigitos sumador = SumadorDeDigitos();
  //Controladores
  TextEditingController _controllerDigitos = TextEditingController();
  //Variables
  String mensaje = "";
  String digitos = "";
  bool mostrar = false;
  //Función
  void _sumar(){
    if(_controllerDigitos.text.isEmpty){
      setState(() {
        mensaje = "Por favor llene el campo";
        mostrar = true;
      });
      return;
    }

    setState(() {
      mensaje = sumador.sumarDigitos(_controllerDigitos.text);
      mostrar = true;
    });
    return;
  }

  //?DISEÑO
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gananacia Uvas', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controllerDigitos,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Ingrese los digitos: "),
            ),

            const SizedBox(height:20),
            ElevatedButton(
              onPressed: _sumar,
              child: const Text('Sumar dígitos', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black)
            ),
            const SizedBox(height:20),
            if (mostrar)
              Text(
                mensaje,
                style: const TextStyle(fontSize: 24),
              ),
          ],
        ),
      ),
    );
  }

}