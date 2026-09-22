import 'dart:io';
import 'dart:convert';
import 'dart:math';
import 'package:tint/tint.dart';

void main() async {
  var arquivo = File("contas.json");
  var random = Random();
  if (await arquivo.exists()) {
    String conteudoTexto = await arquivo.readAsString();
    List<dynamic> listaJson = jsonDecode(conteudoTexto) as List<dynamic>;

    var ganhador = listaJson[random.nextInt(listaJson.length)];

    print("Vencedor: ${ganhador['nome']}".underline().blue().onWhite());
    print("email: ${ganhador['email']}".underline().red().onWhite());
    print(
      "Parabens!!! Vc ganhou 10 créditos para uso de IA!!!"
          .underline()
          .onMagenta()
          .onWhite(),
    );
  } else {
    print("Arquivo não encontrado.");
  }
}
