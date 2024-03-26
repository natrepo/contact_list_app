import 'package:flutter/material.dart';

class ContactDetail extends StatefulWidget{
  final String? namaContact;
  final String? nomorContact;
  
  
  const ContactDetail({Key? key, this.namaContact, this.nomorContact})
    :super(key:key);


@override
  _ContactDetailState createState() => _ContactDetailState();
  }

class _ContactDetailState extends State<ContactDetail> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar( 
        title: const Text('Detail Kontak'),//Judul page
      ),
      body: Column(
        children:[
          //Untuk menampilkan detail kontak dengan allignment rata kiri
          Align(
            alignment: Alignment.centerLeft, 
            child: Text("Nama Kontak: "+widget.namaContact.toString()),
          ),
          
          Align(
            alignment: Alignment.centerLeft, 
            child: Text("Nomor Kontak: ${widget.nomorContact}"),
          ),
         
        ],
      ),
    );
    
  }
}