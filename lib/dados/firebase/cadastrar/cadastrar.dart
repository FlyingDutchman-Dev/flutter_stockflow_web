import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_stockflow_web/models/usuario.dart';
import 'package:flutter_stockflow_web/servicos/enums/status_cadastro.dart';

// Função de cadastro de usuário
Future<StatusCadastro> cadastrarUsuario(Usuario usuario) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Verificar se o email e a senha são válidos
  if (usuario.email.isEmpty || usuario.senha.isEmpty) {
    return StatusCadastro.parametrosInvalidos;
  }

  try {
    final UserCredential credencialUsuario = await _auth.createUserWithEmailAndPassword(
      email: usuario.email,
      password: usuario.senha,
    );

    final User? authUser = credencialUsuario.user;

    if (authUser != null) {
      // Cadastro bem-sucedido no Firebase Auth
      String email = authUser.email ?? "";
      String userId = authUser.uid;

      print("Cadastro realizado\nEmail: $email");

      // Salvar informações adicionais no Firestore
      await _firestore.collection('usuarios').doc(userId).set({
        'nome': usuario.nome,
        'email': usuario.email,
        // Adicione outros campos conforme necessário
      });

      return StatusCadastro.sucesso;
    } else {
      // Tratar erro de cadastro
      return StatusCadastro.falhaCadastro;
    }
  } on FirebaseAuthException catch (e) {
    print("Erro ao criar conta: $e");

    // Tratar diferentes tipos de erro do Firebase Auth
    if (e.code == 'weak-password') {
      return StatusCadastro.senhaFraca;
    } else if (e.code == 'email-already-in-use') {
      return StatusCadastro.emailJaEmUso;
    } else {
      return StatusCadastro.erroDesconhecido;
    }
  } catch (e) {
    print("Erro inesperado: $e");
    return StatusCadastro.erroDesconhecido;
  }
}
