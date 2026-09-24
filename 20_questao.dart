import 'dart:io';

void main() {
  Map<String, String> mensagens = {
    "pt": "Oi, tudo bem?",
    "en": "Hi, how are you?",
    "es": "Hola, ¿qué tal?",
    "fr": "Salut, ça va ?",
    "de": "Hallo, wie geht's?",
    "it": "Ciao, come va?",
  };

  String? lang = Platform.environment["LANG"];

  print("Valor de LANG: $lang");

  String codigoIdioma = "pt";

  if (lang != null && lang != "") {
    String parte = "";

    for (int i = 0; i < lang.length; i++) {
      String caractere = lang[i];
      if (caractere == "_" || caractere == ".") {
        break;
      }
      parte = parte + caractere;
    }

    codigoIdioma = parte.toLowerCase();
  }

  String mensagem = mensagens[codigoIdioma] ?? mensagens["pt"]!;

  print(mensagem);
}
