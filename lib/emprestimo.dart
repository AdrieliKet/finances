import 'package:finances/finances.dart' as finances1;

import 'dart:math';

parcelas(
    {required double valor,
    required double taxa,
    required double numMeses,
    String? tipoEmprestimo}) {
  try {
    return simularEmprestimo(
            numMeses: numMeses, valorEmprestimo: valor, taxaJuros: taxa) /
        numMeses;
  } catch (e) {
    print(
        "Não foi possivel realizar a operação, tente novamente com outros valores.");
  }
}

double simularEmprestimo(
        {required double numMeses,
        required double valorEmprestimo,
        required double taxaJuros}) =>
    valorEmprestimo *
    pow(1 + finances1.converterPorcentagem(taxaJuros), numMeses);
