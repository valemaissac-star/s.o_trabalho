import 'dart:io';
import 'dart:convert';
import 'package:hashlib/hashlib.dart';

void main() async {
  var arquivo1 = File("contas2.json");
  List<dynamic> contas = [];

  if (await arquivo1.exists()) {
    String conteudo = await arquivo1.readAsString();
    if (conteudo.trim().isNotEmpty) {
      contas = jsonDecode(conteudo) as List<dynamic>;
    }
  }

  print("Digite o login:");
  String? login = stdin.readLineSync();

  print("Digite a senha:");
  String? senha = stdin.readLineSync();

  if (login == null || login.isEmpty || senha == null || senha.isEmpty) {
    print("faça o login novamente!");
    return;
  }

  bool jaExiste = false;

  for (var conta in contas) {
    if (conta["login"] == login) {
      jaExiste = true;
      break;
    }
  }

  if (jaExiste) {
    print("Esse login já está cadastrado!");
    return;
  }

  var senhaHash = md5.string(senha).hex();

  Map<String, dynamic> novaConta = {"login": login, "senha_hash": senhaHash};

  contas.add(novaConta);
  await arquivo1.writeAsString(jsonEncode(contas));

  print("Conta cadastrada com sucesso!");
}
