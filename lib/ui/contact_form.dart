import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  final List<Map<String, dynamic>> contact;
  const ContactForm({Key? key, required this.contact}) : super(key: key);

  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _namaContactController = TextEditingController(); //Kontroler untuk textfield nama contact
  final _nomorContactController = TextEditingController(); //Kontroller untuk textfield nomor contact

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new contact'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildNamaContactTextField(),
            _buildNomorContactTextField(),
            _buildButtonSimpan(),
          ],
        ),
      ),
    );
  }

  //Textfield nama contact
  TextField _buildNamaContactTextField() {
    return TextField(
      decoration: const InputDecoration(labelText: "Contact Name"),
      controller: _namaContactController,
    );
  }

  //Textfield nomor contact
  TextField _buildNomorContactTextField() {
    return TextField(
      decoration: const InputDecoration(labelText: "Contact Number"),
      controller: _nomorContactController,
    );
  }

  //Button untuk menyimpan data contact yang telah diisi
  ElevatedButton _buildButtonSimpan() {
    return ElevatedButton(
      onPressed: _buttonSimpan,
      child: const Text('Simpan'),
    );
  }

  //Untuk menyimpan data
  _buttonSimpan() {
    String namaContact = _namaContactController.text;
    String nomorContact = _nomorContactController.text;

    // Untuk menambahkan data ke list
    widget.contact.add({
      'namaContact': namaContact,
      'nomorContact': nomorContact,
    });

    Navigator.pop(context, widget.contact);
  }
}
