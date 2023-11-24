import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_stockflow_web/dados/firebase/cadastrar/cadastrar.dart';
import 'package:flutter_stockflow_web/models/usuario.dart';

class Cadastrar extends StatefulWidget {
  const Cadastrar({super.key});

  @override
  State<Cadastrar> createState() => _CadastrarState();
}

class _CadastrarState extends State<Cadastrar> {
  String nome = "";
  String email = "";
  String senha = "";
  String confirmarSenha = "";

  @override
  Widget build(BuildContext context) {
    final nomeCadastrar = AppLocalizations.of(context)!.nomeCadastrar;

    return Scaffold(
      body: Center(
        child: Card(
          color: Colors.transparent,
          elevation: 0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 500,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(),
                    labelText: nomeCadastrar,
                  ),
                  onChanged: (fNome){
                    nome = fNome;
                  },
                ),
              ),
              SizedBox(
                width: 500,
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Seu email',
                  ),
                  onChanged: (fEmail){
                    email = fEmail;
                  },
                ),
              ),
              SizedBox(
                width: 500,
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Digite sua senha',
                  ),
                  onChanged: (fSenha){
                    senha = fSenha;
                  },
                ),
              ),
              SizedBox(
                width: 500,
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Confirme sua senha',
                  ),
                  onChanged: (fConfirmar){
                    confirmarSenha = fConfirmar;
                  },
                ),
              ),
              const SizedBox(height: 30,),
              SizedBox(
                width: 500,
                height: 30,
                child: ElevatedButton(
                  onPressed: () async {
                    Usuario usuario = Usuario(email, senha);

                    var sucesso = await cadastrarUsuario(usuario);

                  },
                  child: const Text("Cadastrar"),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
