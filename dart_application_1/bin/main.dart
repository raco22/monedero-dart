import ' package:http/http.dart' as http;

void main() async {
  // URL de la API para obtener los datos de la moneda
  String url = 'https://api.exchangerate-api.com/v4/latest/USD';

  // Obtener los datos de la moneda
  http.Response response = await http.get(Uri.parse(url));

  // Verificar si la respuesta es exitosa
  if (response.statusCode == 200) {
    // Decodificar los datos de la moneda
    String responseBody = response.body;

    // Imprimir los datos de la moneda
    print(responseBody);
  } else {
    print('Error al obtener los datos de la moneda');
  }
}