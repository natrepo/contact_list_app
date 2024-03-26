import 'package:contact_list_app/ui/contact_list.dart';
import 'package:flutter/material.dart';

void main() {
runApp(const MyApp());
 }

class MyApp extends StatelessWidget {
const MyApp({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
  return const MaterialApp(
    title: "Contact List",
    home:ContactList(), //Untuk menampilkan page ContactList saat awal aplikasi dijalankan
    debugShowCheckedModeBanner: false, //Untuk menghilangkan banner debug saat dijalankan emolator di Chrome
  );
}
}