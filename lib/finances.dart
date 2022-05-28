import 'dart:io';
import 'package:finances/consorcio.dart' as consorcio;
import 'package:finances/emprestimo.dart' as emprestimo;

void show() {
  print("${apresentacao()}");
  print(
      '''
Escolha uma opção:
1-simular emprestimo;
2-simular valor da parcela do emprestimo;
3-simular consórcio;
4-simular valor integral da parcela do consórcio;
5-simular valor da meia parcela do consórcio;
6-simular valor da parecla após contemplação do consórcio; 
''');
  int opcao = int.parse(stdin.readLineSync()!);

  String resultado = interface(opcao);
  print(resultado);
}

String interface(int opcao) {
  var resultado;
  var valorParcelasConsorcio;
  print("Informe o tipo de emprestimo/consórcio:");
  String tipo = stdin.readLineSync()!;
  print("Informe o número de meses: ");
  double numMeses = double.parse(stdin.readLineSync()!);
  print("Informe o valor: ");
  double valor = double.parse(stdin.readLineSync()!);
  print("Informe a taxa de juros ou administrativa: ");
  double taxa = double.parse(stdin.readLineSync()!);
  if (opcao == 1) {
    resultado = emprestimo.simularEmprestimo(
        numMeses: numMeses, valorEmprestimo: valor, taxaJuros: taxa);
    return "O valor total do financiamento é: $resultado";
  } else if (opcao == 2) {
    resultado = emprestimo.parcelas(
        tipoEmprestimo: tipo, numMeses: numMeses, valor: valor, taxa: taxa);
    return "O valor das parcelas é: $resultado";
  } else if (opcao == 3) {
    resultado = consorcio.simularConsorcio(
        valorConsorcio: valor, taxaAdminidtrativa: taxa, numMeses: numMeses);
    return "O valor total do consórcio é: $resultado";
  } else if (opcao == 4) {
    resultado = consorcio.parcelas(2,
        valor: valor, taxa: taxa, numMeses: numMeses, tipoConsorcio: tipo);
    return "O valor da parcela integral do consórcio é: $resultado";
  } else if (opcao == 5) {
    resultado = consorcio.parcelas(2,
        valor: valor, taxa: taxa, numMeses: numMeses, tipoConsorcio: tipo);
    return "O valor da meia parcela do consórcio é: $resultado";
  } else if (opcao == 6) {
    resultado = consorcio.parcelas(3,
        valor: valor, taxa: taxa, numMeses: numMeses, tipoConsorcio: tipo);
    return "O valor da parcela após a contemplação do consórcio é: $resultado";
  } else {
    return "Opção inválida, tente novamente  !";
  }
}

double converterPorcentagem(double taxaJuros) => taxaJuros / 100;

String apresentacao([String? nome]) {
  nome = "usuário";
  return "Olá $nome, bem vindo ao sistema finances";
}
