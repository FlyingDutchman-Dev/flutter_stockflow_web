import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Cadastrar extends StatefulWidget {
  const Cadastrar({super.key});

  @override
  State<Cadastrar> createState() => _CadastrarState();
}

class _CadastrarState extends State<Cadastrar> {

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
                ),
              ),
              SizedBox(
                width: 500,
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Seu email',
                  ),
                ),
              ),
              SizedBox(
                width: 500,
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Digite sua senha',
                  ),
                ),
              ),
              SizedBox(
                width: 500,
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Confirme sua senha',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
