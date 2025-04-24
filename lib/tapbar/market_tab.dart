import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:http/http.dart' as http;

class MarketTab extends StatefulWidget {
  const MarketTab({super.key});

  @override
  State<MarketTab> createState() => _MarketTabState();
}

class _MarketTabState extends State<MarketTab> {
  List<dynamic> coinData = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchMarketData();
  }

  Future<void> fetchMarketData() async {
    final url = Uri.parse(
      'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=20&page=1&sparkline=true&price_change_percentage=24h',
    );
    final response = await http.get(url);

    if (response.statusCode == 200) {
      setState(() {
        coinData = jsonDecode(response.body);
        isLoading = false;
      });
    } else {
      print("Error: \${response.statusCode}");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF1B232A),
      child: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: coinData.length,
              itemBuilder: (context, index) {
                final coin = coinData[index];
                final chartData = (coin['sparkline_in_7d']['price'] as List<dynamic>).cast<double>();

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
                          backgroundImage: NetworkImage(coin['image'] ?? ''),
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
                                coin['symbol'].toUpperCase(),
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
                                      chartData.length,
                                      (i) => FlSpot(i.toDouble(), chartData[i]),
                                    ),
                                    isCurved: true,
                                    color: (coin['price_change_percentage_24h'] ?? 0) >= 0 ? Colors.green : Colors.red,
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
                              '\$${coin['current_price'].toString()}',
                              style: const TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            Text(
                              '${(coin['price_change_percentage_24h'] ?? 0).toStringAsFixed(2)}%',
                              style: TextStyle(
                                color: (coin['price_change_percentage_24h'] ?? 0) >= 0 ? Colors.green : Colors.red,
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