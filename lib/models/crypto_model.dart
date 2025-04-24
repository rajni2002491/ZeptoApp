class Crypto {
  final String id;
  final String symbol;
  final String name;
  final double currentPrice;
  final double priceChange24h;
  final double priceChangePercentage24h;
  final double marketCap;
  final String image;

  Crypto({
    required this.id,
    required this.symbol,
    required this.name,
    required this.currentPrice,
    required this.priceChange24h,
    required this.priceChangePercentage24h,
    required this.marketCap,
    required this.image,
  });

  factory Crypto.fromJson(Map<String, dynamic> json) {
    return Crypto(
      id: json['id'] ?? '',
      symbol: json['symbol'] ?? '',
      name: json['name'] ?? '',
      currentPrice: (json['current_price'] ?? 0.0).toDouble(),
      priceChange24h: (json['price_change_24h'] ?? 0.0).toDouble(),
      priceChangePercentage24h:
          (json['price_change_percentage_24h'] ?? 0.0).toDouble(),
      marketCap: (json['market_cap'] ?? 0.0).toDouble(),
      image: json['image'] ?? '',
    );
  }
}
