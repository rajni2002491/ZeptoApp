import 'package:flutter/material.dart';
import 'package:flutter_application_1/tapbar/trade_tab.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B232A),
      appBar: AppBar(
        title: const Text("ZeptoPulse", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF1B232A),
        elevation: 0,
      ),
      body: ListView(
        children: [
          // Live Market Overview Section
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              "Live Market Overview",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _buildCurrencyPairCard(
            'USD/EUR',
            '1.2100',
            '1.2200',
            'Volume: 1M',
            '+0.5%',
          ),
          _buildCurrencyPairCard(
            'GBP/USD',
            '1.3600',
            '1.3700',
            'Volume: 2M',
            '-0.3%',
          ),

          // Top Gainers & Losers Section
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              "Top Gainers & Losers",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _buildTopCurrencyCard('EUR/USD', '+2.1%', 'Volume: 5M'),
          _buildTopCurrencyCard('JPY/USD', '-1.5%', 'Volume: 3M'),

          // Action Button for Trading
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TradeTab()),
                );
              },

              style: ElevatedButton.styleFrom(
                backgroundColor: Color(
                  0xFF5ED5A8,
                ), // Use backgroundColor instead of primary
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
              child: const Text(
                "Start Trading",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper widgets to build sections
  Widget _buildCurrencyPairCard(
    String pair,
    String buyPrice,
    String sellPrice,
    String volume,
    String change,
  ) {
    return Card(
     color: const Color(0xFF1B232A),

      margin: const EdgeInsets.all(8),
      child: ListTile(
        title: Text(pair, style: const TextStyle(color: Colors.white)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Buy Price: $buyPrice | Sell Price: $sellPrice',
              style: const TextStyle(color: Colors.white70),
            ),
            Text(volume, style: const TextStyle(color: Colors.white70)),
          ],
        ),
        trailing: Text(
          change,
          style: TextStyle(
            color: change.startsWith('+') ? Colors.green : Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildTopCurrencyCard(String pair, String change, String volume) {
    return Card(
      color: const Color(0xFF1B232A),

      margin: const EdgeInsets.all(8),
      child: ListTile(
        title: Text(pair, style: const TextStyle(color: Colors.white)),
        subtitle: Text(volume, style: const TextStyle(color: Colors.white70)),
        trailing: Text(
          change,
          style: TextStyle(
            color: change.startsWith('+') ? Colors.green : Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
