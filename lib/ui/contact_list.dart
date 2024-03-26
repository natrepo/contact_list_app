import 'package:contact_list_app/ui/contact_detail.dart';
import 'package:contact_list_app/ui/contact_form.dart';
import 'package:flutter/material.dart';

class ContactList extends StatefulWidget {
  const ContactList({Key? key}) : super(key: key);

  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  // List kontak yang akan muncul di awal saat aplikasi dijalankan
  List<Map<String, dynamic>> contact = [
    {'namaContact': 'Mina', 'nomorContact': '081323299658'},
    {'namaContact': 'Shinyu', 'nomorContact': '085812938291'},
    {'namaContact': 'Layla', 'nomorContact': '0817372721353'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildContactList(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('Contact List'),
      actions: [
        _buildAddContactButton(),
        _buildSearchButton(),
      ],
    );
  }

  //Mengalihkan halaman ke ContactForm saat button add ditekan
  GestureDetector _buildAddContactButton() {
    return GestureDetector(
      child: const Icon(Icons.add),
      onTap: () async {
        final newContact = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ContactForm(contact: contact), 
          ),
        );

        // Mengecek apakah data yang diinput terisi semua? Jika ya, maka data contact yang telah diisi akan dianggap sebagai newContact
        if (newContact != null) {
          setState(() {
            contact = newContact as List<Map<String, dynamic>>;
          });
        }
      },
    );
  }

  //Menampilkan icon search
  IconButton _buildSearchButton() {
    return IconButton(
      icon: const Icon(Icons.search),
      onPressed: () {},
    );
  }

  ListView _buildContactList() {
    return ListView.builder(
      itemCount: contact.length,
      itemBuilder: (context, index) {
        return ContactCard(
          namaContact: contact[index]['namaContact'],
          nomorContact: contact[index]['nomorContact'],
        );
      },
    );
  }
}

// Untuk menampilkan kontak yang ada dengan card
class ContactCard extends StatelessWidget {
  final String? namaContact;
  final String? nomorContact;

  const ContactCard({Key? key, this.namaContact, this.nomorContact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ContactDetail(
              namaContact: namaContact,
              nomorContact: nomorContact,
            ),
          ),
        );
      },
      child: Card(
        child: ListTile(
          title: Text(namaContact ?? ''),
          subtitle: Text(nomorContact ?? ''),
        ),
      ),
    );
  }
}
