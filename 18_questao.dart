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

  if (contas.isEmpty) {
    print("Nenhuma conta cadastrada ainda.");
    return;
  }

  print("Digite o login:");
  String? login = stdin.readLineSync();

  print("Digite a senha:");
  String? senha = stdin.readLineSync();

  if (login == null || login.isEmpty || senha == null || senha.isEmpty) {
    print("Login e senha não podem ser vazios.");
    return;
  }

  var senhaHashDigitada = md5.string(senha).hex();

  bool loginValido = false;

  for (var conta in contas) {
    if (conta["login"] == login && conta["senha_hash"] == senhaHashDigitada) {
      loginValido = true;
      break;
    }
  }

  if (loginValido) {
    print("Login realizado com sucesso!");
  } else {
    print("Login ou senha incorretos!");
  }
}
