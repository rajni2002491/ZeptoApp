import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/crypto_model.dart';

class CryptoService {
  static const String _url =
      'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=20&page=1';

  Future<List<Crypto>> fetchCryptos() async {
    final response = await http.get(Uri.parse(_url));

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      print(data); // 👈 PUT THIS LINE RIGHT HERE
      return data.map((json) => Crypto.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch crypto data');
    }
  }
}
