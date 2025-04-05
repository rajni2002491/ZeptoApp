import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/crypto_model.dart';
import '../services/crypto_service.dart';


// Provides a single instance of CryptoService
final cryptoServiceProvider = Provider<CryptoService>((ref) {
  return CryptoService();
});

// Fetches the list of cryptos using the service
final cryptoProvider = FutureProvider<List<Crypto>>((ref) async {
  final service = ref.read(cryptoServiceProvider);
  return service.fetchCryptos();
});
