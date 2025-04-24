import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/crypto_model.dart';
import '../services/crypto_service.dart';

// Provides a single instance of CryptoService
final cryptoServiceProvider = Provider((ref) => CryptoService());

// Fetches the list of cryptos using the service
final topCryptosProvider = FutureProvider<List<Crypto>>((ref) async {
  final cryptoService = ref.watch(cryptoServiceProvider);
  final data = await cryptoService.getTopCryptos();
  return data.map((json) => Crypto.fromJson(json)).toList();
});

final cryptoPriceProvider = FutureProvider.family<Map<String, dynamic>, String>(
  (ref, cryptoId) async {
    final cryptoService = ref.watch(cryptoServiceProvider);
    return await cryptoService.getCryptoPrice(cryptoId);
  },
);

final historicalDataProvider =
    FutureProvider.family<List<dynamic>, Map<String, dynamic>>((
      ref,
      params,
    ) async {
      final cryptoService = ref.watch(cryptoServiceProvider);
      final cryptoId = params['cryptoId'] as String;
      final days = params['days'] as int;
      return await cryptoService.getHistoricalData(cryptoId, days);
    });
