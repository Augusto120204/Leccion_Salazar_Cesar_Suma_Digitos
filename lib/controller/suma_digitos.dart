class SumadorDeDigitos {
  String sumarDigitos(String digitos){
    String mensaje = "";
    List<String> digitosString = digitos.split('');
    List<int> digitosNumericos = [];
    int suma = 0;

    for (var digito in digitosString) {
      if(int.tryParse(digito) != null){
        digitosNumericos.add(int.parse(digito));
        suma += int.parse(digito);
      } else{
        return "Ingrese solo números";
      }
    }

    if(digitosNumericos.length > 4){
      return "La cadena debe contener 4 digitos o menos";
    }

    mensaje = digitosNumericos.join(" + ") + " = " + suma.toString();
    return mensaje;
  }
}