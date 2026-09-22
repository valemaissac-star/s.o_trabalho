import 'dart:io';
import 'dart:convert';
import 'package:tint/tint.dart';

void main() async {
  var arquivo = File("processos.json");

  if (await arquivo.exists()) {
    String conteudoTexto = await arquivo.readAsString();
    List<dynamic> listaJson = jsonDecode(conteudoTexto) as List<dynamic>;
    for (var item in listaJson) {
      String state = (item["state"]);
      String nome = item["process_name"];
      bool io_bound = item["io_bound"];
      if (state == "ready") {
        print("STATE: ${nome}".underline().blue().onWhite());
        print("process : ${nome} *${io_bound}.".underline().green().onWhite());
      } else if (state == "running") {
        print("STATE: ${nome}".underline().blue().onWhite());
        print("process : ${nome} *${io_bound}.".underline().yellow().onWhite());
      } else if (state == "blocked") {
        print("STATE: ${nome}".underline().blue().onWhite());
        print("process : ${nome} *${io_bound}".underline().red().onWhite());
      }
    }
  }
}
