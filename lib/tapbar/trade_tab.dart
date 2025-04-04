import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class TradeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Bitcoin', style: TextStyle(color: Colors.white)),
        actions: [IconButton(icon: Icon(Icons.notifications, color: Colors.white), onPressed: () {})],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Container(
          child: Column(
            children: [
              Text('\$22,237.09', style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold)),
              Text('+2.04%', style: TextStyle(color: Colors.green, fontSize: 16)),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: ['1h', '8h', '24h', '1w', '1m', '1y'].map((e) => TimeframeButton(label: e)).toList(),
              ),
              SizedBox(height: 16),
              Expanded(
                child: CandlestickChart(),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PriceBox(label: 'High Price', value: '52,111.14', color: Colors.redAccent),
                  PriceBox(label: 'Low Price', value: '49,241.69', color: Colors.greenAccent),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TradeButton(label: 'Buy', color: Color(0xFF5ED5A8)),
                  TradeButton(label: 'Sell', color: Color(0xFF5ED5A8)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TimeframeButton extends StatelessWidget {
  final String label;
  TimeframeButton({required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[800]),
        onPressed: () {},
        child: Text(label, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

class PriceBox extends StatelessWidget {
  final String label, value;
  final Color color;

  PriceBox({required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: TextStyle(color: Colors.white70)),
        Text(value, style: TextStyle(color: color, fontWeight: FontWeight.bold)),
      ],
    );
  }
}

class TradeButton extends StatelessWidget {
  final String label;
  final Color color;

  TradeButton({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: color),
      onPressed: () {},
      child: Text(label, style: TextStyle(color: Colors.white)),
    );
  }
}

class CandlestickChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: [FlSpot(0, 1), FlSpot(1, 2), FlSpot(2, 1.5), FlSpot(3, 2.2)],
              isCurved: true,
              gradient: LinearGradient(colors: [Colors.green, Colors.lightGreen]),
              barWidth: 2,
              isStrokeCapRound: true,
            ),
          ],
        ),
      ),
    );
  }
}