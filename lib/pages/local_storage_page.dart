import 'package:dashboard_flutter/services/localpersistence_service.dart';
import 'package:flutter/material.dart';

class LocalStoragePage extends StatelessWidget {
  static const String route = '/local-storage';

  final TextEditingController _editKey = TextEditingController();
  final TextEditingController _editValue = TextEditingController();

  final GlobalKey<FormState> _formSaveKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formReadKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formRemoveKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print("Buildou LocalStoragePage");

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Text("Manipulação no Local Storage do Navegador"),
          Card(
            child: Padding(
              padding: EdgeInsets.all(30),
              child: Form(
                key: _formSaveKey,
                child: Column(
                  children: [
                    Text(
                      "Salvar",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _editKey,
                            decoration: InputDecoration(
                              hintText: "Digite a KEY do valor a ser salvo",
                            ),
                            validator: isEmpty,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: _editValue,
                            decoration: InputDecoration(
                              hintText: "Digite o valor a ser salvo",
                            ),
                            validator: isEmpty,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () => saveLocalStorage(context),
                      child: Text("Salvar"),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: EdgeInsets.all(30),
              child: Form(
                key: _formReadKey,
                child: Column(
                  children: [
                    Text(
                      "Ler",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _editKey,
                            decoration: InputDecoration(
                              hintText: "Digite a KEY do valor a ser lido",
                            ),
                            validator: isEmpty,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () => readLocalStorage(context),
                      child: Text("Ler"),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: EdgeInsets.all(30),
              child: Form(
                key: _formRemoveKey,
                child: Column(
                  children: [
                    Text(
                      "Excluir",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _editKey,
                            decoration: InputDecoration(
                              hintText: "Digite a KEY do valor a ser excluído",
                            ),
                            validator: isEmpty,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () => deleteLocalStorage(context),
                      child: Text("Excluir"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String? isEmpty(String? value) {
    if (value == null || value.trim() == "") {
      return "Campo Obrigatório";
    }

    return null;
  }

  void _clearInputs() {
    _editKey.text = "";
    _editValue.text = "";
  }

  void saveLocalStorage(BuildContext context) async {
    final formState = this._formSaveKey.currentState;

    if (formState?.validate() ?? false) {
      LocalPersistenceService localPersistenceService =
          LocalPersistenceService();

      if (await localPersistenceService.setValue(
              _editKey.text, _editValue.text) ==
          true) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text('Token salvo com sucesso!'),
          duration: const Duration(seconds: 5),
          behavior: SnackBarBehavior.floating,          
        ));
        _clearInputs();
      }
    }
  }

  void readLocalStorage(BuildContext context) async {
    final formState = this._formReadKey.currentState;

    if (formState?.validate() ?? false) {
      LocalPersistenceService localPersistenceService =
          LocalPersistenceService();

      final contentValue =
          await localPersistenceService.getValue(_editKey.text);

      if (contentValue == null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text('Valor não encontrado'),
          duration: const Duration(seconds: 5),
          behavior: SnackBarBehavior.floating,
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("O valor de ${_editKey.text} é $contentValue"),
          duration: const Duration(seconds: 15),
          behavior: SnackBarBehavior.floating,
        ));
        _clearInputs();
      }
    }
  }

  void deleteLocalStorage(BuildContext context) async {
    final formState = this._formRemoveKey.currentState;

    if (formState?.validate() ?? false) {
      LocalPersistenceService localPersistenceService =
          LocalPersistenceService();

      if (await localPersistenceService.deleteValue(_editKey.text) == true) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('A key ${_editKey.text} foi deletada com sucesso!'),
          duration: const Duration(seconds: 5),
          behavior: SnackBarBehavior.floating,
        ));
        _clearInputs();
      }
    }
  }
}
