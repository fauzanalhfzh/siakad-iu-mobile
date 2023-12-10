import 'package:flutter/material.dart';
import 'package:siakad_siu/ui/homepage.dart';


class MahasiswaForm extends StatefulWidget {
  @override
  State<MahasiswaForm> createState() => _MahasiswaFormState();
}

class _MahasiswaFormState extends State<MahasiswaForm> {

  final List<String> _jurusanOptions = ['Pilih Jurusan','Teknik Informatika', 'Sistem Informasi', 'Manajemen Informatika', 'Komputerisasi Akuntansi']; 

  String _selectedJurusan = 'Pilih Jurusan';

  final _nomorIndukTextboxController = TextEditingController();
  final _namaMahasiswaTextboxController = TextEditingController();
  final _alamatTextboxController = TextEditingController();
  final _notelpTextboxController = TextEditingController();
  final _agamaTextboxController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Input Mahasiswa"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _textboxNomorInduk(),
            _textboxNamaMahasiswa(),
            _textboxAlamat(),
            _textboxJurusan(),
            _textboxNotelp(),
            _textboxAgama(),
            _tombolSimpan()
          ],
        )
        ),
    );
  }

  _textboxNomorInduk(){
    return TextField(
      decoration: InputDecoration(labelText: "Nomor Induk Mahasiswa"),
      controller: _nomorIndukTextboxController,
    );
  }
  _textboxNamaMahasiswa(){
    return TextField(
      decoration: InputDecoration(labelText: "Nama Mahasiswa"),
      controller: _namaMahasiswaTextboxController,
    );
  }
  _textboxAlamat(){
    return TextField(
      decoration: InputDecoration(labelText: "Alamat"),
      controller: _alamatTextboxController,
    );
  }
  _textboxJurusan() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 10),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Menambah properti crossAxisAlignment
      children: [
        SizedBox(height: 8, width: 500,),
        DropdownButton<String>(
          isExpanded: true,
          value: _selectedJurusan,
          onChanged: (String? newValue) {
            setState(() {
              _selectedJurusan = newValue!;
            });
          },
          items: _jurusanOptions.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value, 
                child: Text(
                  value,
                  style: TextStyle(
                    color: _selectedJurusan == value ?Colors.black54 : Colors.black,
                  ),
                ),
            );
          }).toList(),
        ),
      ],
    ),
  );
}

  _textboxNotelp(){
    return TextField(
      decoration: InputDecoration(labelText: "Nomor Telepon"),
      controller: _notelpTextboxController,
    );
  }
  _textboxAgama(){
    return TextField(
      decoration: InputDecoration(labelText: "Agama"),
      controller: _agamaTextboxController,
    );
  }

 _tombolSimpan() {
  return Container(
    margin: EdgeInsets.all(16.0),
    child: Column(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.white, // Warna latar belakang menjadi transparent
            onPrimary: Theme.of(context).primaryColor, // Warna teks menjadi primary
            side: BorderSide(color: Theme.of(context).primaryColor), 
             padding: EdgeInsets.symmetric(vertical: 20, horizontal: 200),// Warna border menjadi primary
          ),
          child: Text(
            "Batal", 
            style: TextStyle(fontSize: 20)
            ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        SizedBox(height: 16),
        Align(
          alignment: Alignment.bottomCenter,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 140),
            ),
            child: Text(
              "Tambahkan Data",
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () {
              String nomor_induk = _nomorIndukTextboxController.text;
              String nama_mahasiswa = _namaMahasiswaTextboxController.text;
              String alamat = _alamatTextboxController.text;
              String jurusan = _selectedJurusan;
              String notelp = _notelpTextboxController.text;
              String agama = _agamaTextboxController.text;

              Navigator.pop(
                context,
                ItemMahasiswa(
                  nomorInduk: nomor_induk,
                  namaMahasiswa: nama_mahasiswa,
                  alamat: alamat,
                  jurusan: jurusan,
                  notelp: notelp,
                  agama: agama,
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}


}