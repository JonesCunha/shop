import 'package:flutter/material.dart';
import 'package:testefin/data/models/fiis_model.dart';
import 'package:testefin/data/repositories/fiis_reposity.dart';
import '../../data/http/exceptions.dart';

class FiisStore {

  final IFiisRepository repository; 
  
  // Variavel reativa para loading
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  // Variavel reativa para o state

  final ValueNotifier<List<FiisModel>> state =
      ValueNotifier<List<FiisModel>>([]);

  // Variavel rerativa para o erro

  final ValueNotifier<String> erro = ValueNotifier<String>('');

  FiisStore({required this.repository});

  Future getFiis() async {
    isLoading.value = true;

    try {
      final result = await repository.getFiis(0);
      state.value = result;
    } on NotFoundExcepction catch (e) {
      erro.value = e.message;
    }
    catch (e) {
      erro.value = e.toString();
    }

    isLoading.value = false;
  }

}
