import 'package:finances/finances.dart' as finances1;

parcelas(int escolherValorParcelas,
    {required double valor,
    required double taxa,
    required double numMeses,
    String? tipoConsorcio}) {
  print("Tipo de consórcio: $tipoConsorcio");

  if (escolherValorParcelas == 2) {
    try {
      ((
          {required double valor,
          required double taxa,
          required double numMeses}) {
        return ((simularConsorcio(
                    valorConsorcio: valor, taxaAdminidtrativa: taxa) /
                numMeses) /
            2);
      });
    } catch (e) {
      print(
          "Não foi possivel realizar a operação, tente novamente com outros valores.");
    }
  } else if (escolherValorParcelas == 3) {
    try {
      ((
          {required double valor,
          required double taxa,
          required double numMeses}) {
        return ((simularConsorcio(
                    valorConsorcio: valor, taxaAdminidtrativa: taxa) /
                numMeses) *
            2);
      });
    } catch (e) {
      print(
          "Não foi possivel realizar a operação, tente novamente com outros valores.");
    }
  }
}

double simularConsorcio(
        {required double valorConsorcio,
        required double taxaAdminidtrativa,
        double? numMeses}) =>
    valorConsorcio +
    (finances1.converterPorcentagem(taxaAdminidtrativa) * valorConsorcio);
