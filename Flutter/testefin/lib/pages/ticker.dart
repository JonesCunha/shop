import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:testefin/data/models/fiis_model.dart';

class Ticker extends StatefulWidget {
  final FiisModel fii;

  Ticker({super.key, required this.fii});

  @override
  State<Ticker> createState() => _tickerState();
}

class _tickerState extends State<Ticker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          centerTitle: true,
          title: Text(
            widget.fii.ticker.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Column(children: [
                Text('Price Over Equity: ${widget.fii.priceOverEquity}'),
                Text('Preço Unitário: ${widget.fii.unitPrice}'),
                Text('Yield ${widget.fii.dividendYield}'),
                Text('Ultimo Dividendo: ${widget.fii.lastDividend}'),
                Text('Data Update: ${widget.fii.lastUpdate}'),
                Text('Valor Mercado: ${widget.fii.netWorth}'),
                component(widget.fii),
              ]),
            )
          ],
        ));
  }
}

Widget component(FiisModel fii) {
  return Padding(
    padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 12),
    child: Container(
      width: double.infinity,
      height: 270,
      decoration: BoxDecoration(
        color: Color(0xFF4B39EF),
        borderRadius: BorderRadius.circular(0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 12, 0, 0),
            child: Text(
              'Dados de Mercado',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 4, 0, 12),
            child: Text(
              'Abaixo mais informações a Respeito do FII - ${fii.ticker}',
              style: TextStyle(
                fontFamily: 'Plus Jakarta Sans',
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              primary: false,
              shrinkWrap: true,

              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12, 12, 0, 12),
                  child: Container(
                    width: 380,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x2B202529),
                          offset: Offset(0, 2),
                        )
                      ],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Text(
                                  fii.ticker,
                                  style: TextStyle(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: Color(0xFF14181B),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.star_rounded,
                                color: Color(0xFF4B39EF),
                                size: 24,
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
                                child: Text(
                                  '4.5',
                                  style: TextStyle(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: Color(0xFF14181B),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Text(
                                '(242)',
                                style: const TextStyle(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: Color(0xFF14181B),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 50, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'R\$ ${fii.unitPrice.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFF14181B),
                                    fontSize: 36,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const Expanded(
                                  child: Text(
                                    '/Unitário',
                                    style: TextStyle(
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: Color(0xFF14181B),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  // borderColor: Color(0xFFF1F4F8),
                                  // borderRadius: 30,
                                  // borderWidth: 2,
                                  // buttonSize: 44,
                                  icon: const Icon(
                                    Icons.arrow_forward_rounded,
                                    color: Color(0xFF57636C),
                                    size: 24,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

