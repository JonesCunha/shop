import 'dart:convert';
import 'package:testefin/data/http/exceptions.dart';
import 'package:testefin/data/http/http_client.dart';
import 'package:testefin/data/models/fiis_model.dart';

abstract class IFiisRepository {
  Future<List<FiisModel>> getFiis(int value);
}

class FiisRepository implements IFiisRepository {
  final IHttpClient client;

  FiisRepository({required this.client});

  @override
  Future<List<FiisModel>> getFiis(int value) async {
    // final String apiKey = '5OQDRGX69iwOXiYqNMyEFcDGsEsQZS2z';
    const String apiUrl = 'https://servicehub.ddns.net/services/funds';

    final response = await client.get(url: apiUrl);

    if (response.statusCode == 200) {
      List<FiisModel> fiis = [];
      final body = jsonDecode(response.body);

      fiis = body
          .map<FiisModel>((item) => FiisModel.fromMap(item)
              //fiis.add(fiisModel);
              )
          .toList();

      //remover os zerados
      List<FiisModel> fiis2 = fiis.where((element) => element.netWorth > 0).toList();
      List<FiisModel> fiis3 = fiis2.where((element) => element.dividendYield > 0).toList();

      //remover liquidez diaria abaixo de 500mil

      List<FiisModel> fiis4 = fiis3.where((element) => element.dailyLiquidity > 500000.00).toList();


      if (value == 1) {
        return fiis4..sort((a, b) => a.lastDividend.compareTo(b.lastDividend));
      } else {
        return fiis4..sort((a, b) => (b.lastDividend/b.unitPrice*100).compareTo(a.lastDividend/a.unitPrice*100));
      }
    } else if (response.statusCode == 404) {
      throw NotFoundExcepction('A Url nao é válida');
    } else {
      //print(response.statusCode);
      throw Exception('Não foi possível carregar os Fiis');
    }
  }
}
