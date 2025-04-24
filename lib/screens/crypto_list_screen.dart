import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/theme_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/crypto_provider.dart';
//import '../providers/theme_provider.dart'; // 👈 Import the theme provider

class CryptoListScreen extends ConsumerWidget {
  const CryptoListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cryptoAsync = ref.watch(topCryptosProvider);
    final themeMode = ref.watch(themeModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Top 20 Cryptos'),
        actions: [
          IconButton(
            icon: Icon(
              themeMode == ThemeMode.dark ? Icons.light_mode : Icons.dark_mode,
            ),
            onPressed: () {
              final newMode =
                  themeMode == ThemeMode.dark
                      ? ThemeMode.light
                      : ThemeMode.dark;
              ref.read(themeModeProvider.notifier).state = newMode;
            },
          ),
        ],
      ),
      body: cryptoAsync.when(
        data: (cryptos) {
          return ListView.builder(
            itemCount: cryptos.length,
            itemBuilder: (context, index) {
              final crypto = cryptos[index];
              return ListTile(
                leading: Image.network(
                  crypto.image,
                  width: 32,
                  height: 32,
                  errorBuilder:
                      (context, error, stackTrace) => const Icon(Icons.error),
                ),
                title: Text(crypto.name),
                subtitle: Text(crypto.symbol.toUpperCase()),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('\$${crypto.currentPrice.toStringAsFixed(2)}'),
                    Text(
                      '${crypto.priceChangePercentage24h.toStringAsFixed(2)}%',
                      style: TextStyle(
                        color:
                            crypto.priceChangePercentage24h >= 0
                                ? Colors.green
                                : Colors.red,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Error: $err')),
      ),
    );
  }
}
