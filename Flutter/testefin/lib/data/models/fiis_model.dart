class FiisModel {
  final String id;
  final String lastUpdate;
  final String ticker;
  final String sector;
  final String segment;
  final double unitPrice;
  final double netWorth;
  final double priceOverEquity;
  final double dailyLiquidity;
  final double dividendYield;
  final double lastDividend;

  FiisModel({
    required this.id,
    required this.lastUpdate,
    required this.ticker,
    required this.sector,
    required this.segment,
    required this.unitPrice,
    required this.netWorth,
    required this.priceOverEquity,
    required this.dailyLiquidity,
    required this.dividendYield,
    required this.lastDividend,
  });

  factory FiisModel.fromMap(Map<String, dynamic> map) {
    return FiisModel(
      id: map['id'] ?? '',
      lastUpdate: map['lastUpdate'] ?? '',
      ticker: map['ticker'] ?? '',
      sector: map['sector'] ?? '',
      segment: map['segment'] ?? '',
      unitPrice: double.tryParse(map['unitPrice'].toString() ) ?? 0 ,
      netWorth: double.tryParse(map['netWorth'].toString() ) ?? 0  ,
      priceOverEquity: double.tryParse(map['priceOverEquity'].toString() ) ?? 0 ,
      dailyLiquidity: double.tryParse(map['dailyLiquidity'].toString() ) ?? 0 ,
      dividendYield: double.tryParse(map['dividendYield'].toString() ) ?? 0 ,
      lastDividend: double.tryParse(map['lastDividend'].toString() ) ?? 0 ,
    );
  }
}
