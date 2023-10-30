import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:testefin/data/http/http_client.dart';
import 'package:testefin/data/repositories/fiis_reposity.dart';
import 'package:testefin/pages/secondPage.dart';
import 'package:testefin/pages/stores/fiis_store.dart';
import 'package:testefin/pages/ticker.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final FiisStore store = FiisStore(
    repository: FiisRepository(
      client: HttpClient(),
    ),
  );

  @override
  void initState() {
    super.initState();
    store.getFiis();
  }

  final List<int> options = [0, 1, 2, 3];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.search),
      ),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'Consumo API',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                store.getFiis();
              },
              icon: const Icon(Icons.refresh)),
          IconButton(
            onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const SecondPage())),
            icon: const Icon(Icons.pages),
          ),
        ],
      ),
      body: AnimatedBuilder(
        animation: Listenable.merge(
          [
            store.isLoading,
            store.erro,
            store.state,
          ],
        ),
        builder: (context, child) {
          if (store.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          if (store.erro.value.isNotEmpty) {
            return Center(
              child: Text(
                store.erro.value,
              ),
            );
          }
          if (store.state.value.isEmpty) {
            return const Center(
              child: Text('Nenhum item na lista'),
            );
          } else {
            return ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
              padding: const EdgeInsets.all(8),
              itemCount: store.state.value.length,
              itemBuilder: (_, index) {
                final item = store.state.value[index];
                var realFormat =
                    NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
                final netWorh = realFormat.format(item.netWorth);
                final unitPrice = realFormat.format(item.unitPrice);
                final dailyLiquidity = realFormat.format(item.dailyLiquidity);
                final realYield = (item.lastDividend / item.unitPrice) * 100;

                return GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Ticker(
                        fii: item,
                      ),
                    ),
                  ),
                  child: Card(
                    color: Colors.amber[200],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          // contentPadding: EdgeInsets.zero,
                          title: Text(
                            item.ticker,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 26,
                            ),
                          ),
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Text('Setor: ${item.sector}', overflow: TextOverflow.clip),
                        //     const SizedBox(
                        //       width: 20,
                        //     ),
                        //     Text('Segmento: ${item.segment}'),
                        //   ],
                        // ),
                        Text(
                          'Preco Unitario R\$ ${unitPrice}',
                        ),
                        Text(
                          'Valor Mercado R\$ ${netWorh}',
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Yield Anual : % ${item.dividendYield.toStringAsFixed(2)}',
                            ),
                            Text(
                              'Ultimo Yield Mensal : R\$ ${item.lastDividend.toStringAsFixed(2)}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Liquidez Diária : ${dailyLiquidity}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Yield Real % : ${realYield.toStringAsFixed(2)}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
