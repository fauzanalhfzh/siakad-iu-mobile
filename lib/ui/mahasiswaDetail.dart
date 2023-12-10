import 'package:flutter/material.dart';

class MahasiswaDetail extends StatefulWidget {
  final String nomorInduk;
  final String namaMahasiswa;
  final String alamat;
  final String jurusan;
  final String notelp;
  final String agama;

  // Membuat constructor
  MahasiswaDetail({
    required this.nomorInduk,
    required this.namaMahasiswa,
    required this.alamat,
    required this.jurusan,
    required this.notelp,
    required this.agama,
  });

  @override
  State<MahasiswaDetail> createState() => _MahasiswaDetailState();
}

class _MahasiswaDetailState extends State<MahasiswaDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Mahasiswa"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Icon(Icons.numbers_rounded),
              title: Text("Nomor Induk Mahasiswa"),
              subtitle: Text(widget.nomorInduk),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Nama Mahasiswa"),
              subtitle: Text(widget.namaMahasiswa),
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text("Alamat"),
              subtitle: Text(widget.alamat),
            ),
            ListTile(
              leading: Icon(Icons.school),
              title: Text("Jurusan"),
              subtitle: Text(widget.jurusan),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text("Nomor Handphone"),
              subtitle: Text(widget.notelp),
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text("Agama"),
              subtitle: Text(widget.agama),
            ),
          ],
        ),
      ),
    );
  }
}
