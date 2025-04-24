import 'package:flutter/material.dart';

class WalletTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B232A),
      appBar: AppBar(
        title: const Text("Wallet", style: TextStyle(color: Colors.white)),
         backgroundColor: const Color(0xFF1B232A),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          // Wallet Balance Section
          Card(
            color: const Color(0xFF1B232A),

            margin: const EdgeInsets.all(8),
            child: ListTile(
              title: const Text(
                'USD Balance',
                style: TextStyle(color: Colors.white),
              ),
              trailing: const Text(
                '1000 USD',
                style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          // Transaction History Section
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              "Transaction History",
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          _buildTransactionCard('Buy USD/EUR', '1.2100', '1000 USD', '+1.5%'),
          _buildTransactionCard('Sell GBP/USD', '1.3600', '500 GBP', '-0.8%'),

          // Withdraw/Deposit Section
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Withdraw Action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF5ED5A8),// Use backgroundColor instead of primary
                  ),
                  child: const Text("Withdraw", style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Deposit Action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF5ED5A8), // Use backgroundColor instead of primary
                  ),
                  child: const Text("Deposit", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper widget for transaction history
  Widget _buildTransactionCard(String action, String price, String quantity, String change) {
    return Card(
      color: const Color(0xFF1B232A),

      margin: const EdgeInsets.all(8),
      child: ListTile(
        title: Text(
          action,
          style: const TextStyle(color: Colors.white),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Price: $price',
              style: const TextStyle(color: Colors.white70),
            ),
            Text(
              'Quantity: $quantity',
              style: const TextStyle(color: Colors.white70),
            ),
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
}
