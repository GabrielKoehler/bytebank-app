import 'package:bytebank/screens/transfer/form.dart';
import 'package:flutter/material.dart';
import '../../models/transfer.dart';

const _appBarTitle = 'Transferências';

class TransferList extends StatefulWidget {
  final List<Transfer> _transfers = [];

  @override
  State<StatefulWidget> createState() {
    return TransferListState();
  }
}

class TransferListState extends State<TransferList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_appBarTitle),
      ),
      body: ListView.builder(
        itemCount: widget._transfers.length,
        itemBuilder: (context, index) {
          final actualTransfer = widget._transfers[index];
          return TransferItem(actualTransfer);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return TransferForm();
            }),
          ).then((receivedTransfer) => updateList(receivedTransfer));
        },
      ),
    );
  }

  void updateList(Transfer? receivedTransfer) {
    if (receivedTransfer != null) {
      setState(() {
        widget._transfers.add(receivedTransfer);
      });
    }
  }
}

class TransferItem extends StatelessWidget {
  final Transfer _transfer;

  TransferItem(this._transfer);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text(_transfer.transferValue.toString()),
        subtitle: Text(_transfer.accountNumber.toString()),
      ),
    );
  }
}
