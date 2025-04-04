import 'package:flutter/material.dart';

class FavoritesTab extends StatelessWidget {
  final List<Map<String, dynamic>> favorites = [
    {
      'name': 'Bitcoin',
      'symbol': 'BTC',
      'image': 'assets/images/bitcoin.png',
      'marketCapRank': 1,
      'price': '2652.00',
      'change': '-0.81%',
      'date': '2021-08-02 04:39:26',
      'changeColor': Colors.red,
    },
    {
      'name': 'Bitcoin',
      'symbol': 'BTC',
      'image': 'assets/images/bitcoin.png',
      'marketCapRank': 1,
      'price': '2652.00',
      'change': '-0.81%',
      'date': '2021-08-02 04:39:26',
      'changeColor': Colors.red,
    },
    {
      'name': 'Bitcoin',
      'symbol': 'BTC',
      'image': 'assets/images/bitcoin.png',
      'marketCapRank': 1,
      'price': '2652.00',
      'change': '-0.81%',
      'date': '2021-08-02 04:39:26',
      'changeColor': Colors.red,
    },
    {
      'name': 'Bitcoin',
      'symbol': 'BTC',
      'image': 'assets/images/bitcoin.png',
      'marketCapRank': 1,
      'price': '2652.00',
      'change': '-0.81%',
      'date': '2021-08-02 04:39:26',
      'changeColor': Colors.red,
    },
  ];

  FavoritesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: const Text("Favourites", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF121212),
        elevation: 0,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(10),
        itemCount: favorites.length,
        separatorBuilder: (_, __) => const Divider(color: Colors.grey),
        itemBuilder: (context, index) {
          final coin = favorites[index];

          return ListTile(
            contentPadding: const EdgeInsets.symmetric(vertical: 0),
            leading: CircleAvatar(backgroundImage: AssetImage(coin['image'])),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  coin['symbol'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      coin['date'],
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    SizedBox(width: 2),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Color.fromARGB(255, 255, 254, 254),
                      size: 14,
                    ),
                  ],
                ),
              ],
            ),

            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Market Cap Rank",
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    Text(
                      coin['marketCapRank'].toString(),
                      style: const TextStyle(color: Colors.green, fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Price",
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    Text(
                      coin['price'],
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Price Change Percentage 24h",
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    Text(
                      coin['change'],
                      style: TextStyle(
                        color: coin['changeColor'],
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 14),
          );
        },
      ),
    );
  }
}
