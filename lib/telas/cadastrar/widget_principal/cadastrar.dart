import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_stockflow_web/dados/firebase/cadastrar/cadastrar.dart';
import 'package:flutter_stockflow_web/models/usuario.dart';
import 'package:flutter_stockflow_web/servicos/enums/status_cadastro.dart';
import 'package:flutter_stockflow_web/servicos/validacao/validar_email.dart';

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
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final nomeCadastrar = AppLocalizations.of(context)!.nomeCadastrar;

    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ops! Você esqueceu de preencher este campo.';
                      }
                      return null;
                    },
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
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (fEmail){
                      email = fEmail;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ops! Você esqueceu de preencher este campo.';
                      }
                      // Use uma expressão regular para verificar o formato do e-mail
                      // Aqui, usamos um padrão simples, mas você pode usar um mais complexo se necessário
                      if (!ValidarEmail.validar(value)) {
                        return 'Por favor, insira um e-mail válido';
                      }
                      return null;
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
                    keyboardType: TextInputType.visiblePassword,
                    onChanged: (fSenha){
                      senha = fSenha;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ops! Você esqueceu de preencher este campo.';
                      }
                      return null;
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ops! Você esqueceu de preencher este campo.';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 30,),
                SizedBox(
                  width: 500,
                  height: 30,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();

                        if(senha != confirmarSenha){
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Oops, as senhas não batem.')),
                          );
                          return;
                        }

                        Usuario usuario = Usuario(nome, email, senha); // Substitua isso pela criação do usuário

                        StatusCadastro resultado = await cadastrarUsuario(usuario);

                        // resultado para navegar para outra tela
                        switch (resultado) {
                          case StatusCadastro.sucesso:
                            Navigator.of(context).pushNamed('/');
                            break;

                          default: Navigator.of(context).pushNamed('/falha');
                        }
                      }
                    },
                    child: const Text("Cadastrar"),
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
