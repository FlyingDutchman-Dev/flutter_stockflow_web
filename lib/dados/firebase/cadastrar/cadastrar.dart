import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_stockflow_web/dados/firebase/conexao/conexao_firebase.dart';
import 'package:flutter_stockflow_web/models/usuario.dart';

// Função de cadastro de usuário
Future<String?> cadastrarUsuario(Usuario usuario) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    final UserCredential credencialUsuario = await _auth.createUserWithEmailAndPassword(
      email: usuario.email,
      password: usuario.senha,
    );

    //
    final User? authUser = credencialUsuario.user;

    if (authUser != null) {
      // Cadastro bem-sucedido no Firebase Auth
      String email = authUser.email ?? ""; // O operador ?? fornece um valor padrão (vazio neste caso) se o email for nulo

      print("Cadastro realizado\n Email: " + email);

      // Exemplo de como salvar o usuário em um banco de dados Firestore:
      /* Map<String, dynamic> dadosUsuario = {
        'id': usuario.id,
        'nome': usuario.nome,
        'email': usuario.email,
      };
      // Substitua 'suaColecao' pelo nome da coleção no Firestore onde você deseja armazenar os usuários.
      await FirebaseFirestore.instance.collection('suaColecao').doc(usuario.id).set(dadosUsuario);
       */
    } else {
      // Tratar erro de cadastro
    }
  } catch (e) {
    print("Erro ao criar conta: $e");
  }
}
