import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
  // URL de la API para obtener los datos de la moneda
  String url = 'https://api.exchangerate-api.com/v4/latest/USD';

  // Obtener los datos de la moneda
  http.Response response = await http.get(Uri.parse(url));

  // Verificar si la respuesta es exitosa
  if (response.statusCode == 200) {
    // Decodificar los datos de la moneda
    Map<String, dynamic> data = jsonDecode(response.body);

    // Obtener el valor del dólar y el euro
    double usd = data['rates']['USD'];
    double eur = data['rates']['EUR'];

    // Imprimir los valores
    print('Valor del dólar: $usd');
    print('Valor del euro: $eur');

    // Actualizar los valores cada 10 segundos
    while (true) {
      await Future.delayed(Duration(seconds: 10));
      response = await http.get(Uri.parse(url));
      data = jsonDecode(response.body);
      usd = data['rates']['USD'];
      eur = data['rates']['EUR'];
      print('Valor del dólar: $usd');
      print('Valor del euro: $eur');
    }
  } else {
    print('Error al obtener los datos de la moneda');
  }
}