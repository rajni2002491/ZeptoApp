import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class MarketTab extends StatelessWidget {
  final List<Map<String, dynamic>> coinData = [
    {
      'name': 'Bitcoin',
      'symbol': 'BTC',
      'price': '47,00,000',
      'change': '+3.5%',
      'color': Colors.green, // Define color
      'image': 'assets/images/bitcoin.png',
      'chartData': [2.1, 2.4, 2.0, 2.3, 2.7, 3.0, 2.8]
    },
    {
      'name': 'Chainlink',
      'symbol': 'LINK',
      'price': '32,697.05',
      'change': '-0.81%',
      'color': Colors.red,
      'image': 'assets/images/ethereum.png',
      'chartData': [3.5, 3.6, 3.4, 3.2, 3.3, 3.25]
    },
    {
      'name': 'Cardano',
      'symbol': 'ADA',
      'price': '32,697.05',
      'change': '+0.81%',
      'color': Colors.green,
      'image': 'assets/images/cardano.png',
      'chartData': [0.45, 0.46, 0.48, 0.5, 0.51, 0.502]
    },
    {
      'name': 'SHIBA INU',
      'symbol': 'SHIB',
      'price': '32,697.05',
      'change': '-0.81%',
      'color': Colors.red,
      'image': 'assets/images/shiba.png',
      'chartData': [3.5, 3.6, 3.4, 3.2, 3.3, 3.25]
    },
    {
      'name': 'HIFI',
      'symbol': 'MFT',
      'price': '32,697.05',
      'change': '-0.81%',
      'color': Colors.red,
      'image': 'assets/images/hifi.png',
      'chartData': [3.5, 3.6, 3.4, 3.2, 3.3, 3.25]
    },
    {
      'name': 'REN',
      'symbol': 'REN',
      'price': '32,697.05',
      'change': '+0.81%',
      'color': Colors.green,
      'image': 'assets/images/ren.png',
      'chartData': [0.45, 0.46, 0.48, 0.5, 0.51, 0.502]
    },
  ];

  MarketTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF1B232A),
      child: ListView.builder(
        itemCount: coinData.length,
        itemBuilder: (context, index) {
          final coin = coinData[index];

          return Card(
            color: const Color(0xFF1E2A38),
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    backgroundImage: AssetImage(coin['image'] ?? 'assets/default.png'),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          coin['name'] ?? 'Unknown',
                          style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          coin['symbol'] ?? '--',
                          style: const TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      height: 20,
                      child: LineChart(
                        LineChartData(
                          borderData: FlBorderData(show: false),
                          titlesData: FlTitlesData(show: false),
                          gridData: FlGridData(show: false),
                          lineBarsData: [
                            LineChartBarData(
                              spots: List.generate(
                                (coin['chartData'] as List?)?.length ?? 0,
                                (i) => FlSpot(
                                  i.toDouble(),
                                  (coin['chartData']?[i] as num?)?.toDouble() ?? 0.0,
                                ),
                              ),
                              isCurved: true,
                              color: coin['color'] ?? Colors.white, // FIXED: Use 'color' instead of 'colors'
                              barWidth: 2,
                              dotData: FlDotData(show: false),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        coin['price'] ?? 'N/A',
                        style: const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Text(
                        coin['change'] ?? '0%',
                        style: TextStyle(
                          color: coin['color'] ?? Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
