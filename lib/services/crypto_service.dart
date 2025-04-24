import 'dart:convert';
import 'package:http/http.dart' as http;

class CryptoService {
  static const String baseUrl = 'https://api.coingecko.com/api/v3';

  // Fetch current price of a cryptocurrency
  Future<Map<String, dynamic>> getCryptoPrice(String cryptoId) async {
    try {
      final response = await http.get(
        Uri.parse(
          '$baseUrl/simple/price?ids=$cryptoId&vs_currencies=usd&include_24hr_change=true',
        ),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load crypto price');
      }
    } catch (e) {
      throw Exception('Error fetching crypto price: $e');
    }
  }

  // Fetch list of top cryptocurrencies
  Future<List<dynamic>> getTopCryptos({int limit = 10}) async {
    try {
      final response = await http.get(
        Uri.parse(
          '$baseUrl/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=$limit&page=1&sparkline=false',
        ),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load top cryptocurrencies');
      }
    } catch (e) {
      throw Exception('Error fetching top cryptocurrencies: $e');
    }
  }

  // Fetch historical price data for a cryptocurrency
  Future<List<dynamic>> getHistoricalData(String cryptoId, int days) async {
    try {
      final response = await http.get(
        Uri.parse(
          '$baseUrl/coins/$cryptoId/market_chart?vs_currency=usd&days=$days',
        ),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body)['prices'];
      } else {
        throw Exception('Failed to load historical data');
      }
    } catch (e) {
      throw Exception('Error fetching historical data: $e');
    }
  }
}
