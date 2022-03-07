import 'package:flutter/material.dart';
import '../../components/editor.dart';
import '../../models/transfer.dart';

const _appBarTitle = 'Criando transferência';
const _confirmButton = 'Confirmar';
const _numberAccountLabel = 'Número da conta';
const _transferValueLabel = 'Valor';
const _numberAccountHint = '0000';
const _transferValueHint = '0.00';

class TransferForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TransferFormState();
  }
}

class TransferFormState extends State<TransferForm> {
  final TextEditingController _controllerNumberAccount =
      TextEditingController();
  final TextEditingController _controllerTransferValue =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_appBarTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controller: _controllerNumberAccount,
              hint: _numberAccountHint,
              label: _numberAccountLabel,
            ),
            Editor(
              hint: _transferValueHint,
              controller: _controllerTransferValue,
              label: _transferValueLabel,
              icon: Icons.monetization_on,
            ),
            ElevatedButton(
              child: const Text(_confirmButton),
              onPressed: () => _createTransfer(context),
            )
          ],
        ),
      ),
    );
  }

  void _createTransfer(BuildContext context) {
    final int? accountNumber = int.tryParse(_controllerNumberAccount.text);
    final double? transferValue =
        double.tryParse(_controllerTransferValue.text);
    if (accountNumber != null && transferValue != null) {
      final createdTransfer = Transfer(transferValue, accountNumber);
      Navigator.pop(context, createdTransfer);
    }
  }
}
