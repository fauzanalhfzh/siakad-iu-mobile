import 'package:flutter/material.dart';
import 'package:siakad_siu/ui/mahasiswaDetail.dart';
import 'package:siakad_siu/ui/mahasiswaForm.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ItemMahasiswa> items = [
    ItemMahasiswa(
      nomorInduk: "202111064",
      namaMahasiswa: "Mohammad Fauzan Alhafizh",
      alamat: "Buol",
      jurusan: "Teknik Informatika",
      notelp: "085162902018",
      agama: "Islam",
    ), 
    ItemMahasiswa(
      nomorInduk: "202121003",
      namaMahasiswa: "Ridho Aziztatiko",
      alamat: "Cilegon",
      jurusan: "Sistem Informasi",
      notelp: "08524325334",
      agama: "Islam",
    ), 
    ItemMahasiswa(
      nomorInduk: "202113046",
      namaMahasiswa: "Moh Izzul Haq",
      alamat: "Palu",
      jurusan: "Komputerisasi Akuntansi",
      notelp: "082322417865",
      agama: "Islam",
    ), 
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Dashboard"),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeroSection(),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return items[index];
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          ItemMahasiswa? result = await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MahasiswaForm()),
          );

          if (result != null) {
            setState(() {
              items.add(result);
            });
          }
},
        child: Icon(Icons.add),
      ),
      drawer: Drawer(
  child: ListView(
    padding: EdgeInsets.zero,
    children: [
      UserAccountsDrawerHeader(
        accountName: Text("Mohammad Fauzan Alhafizh"),
        accountEmail: Text("Nomor Induk: 202111064"),
        currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/PhotoProfile.png'),
              ),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
        ),
      ),
      ListTile(
        leading: Icon(Icons.dashboard),
        title: Text('Dasboard'),
        onTap: () {
          Navigator.pop(context); 
        },
      ),
      ListTile(
        leading: Icon(Icons.schedule),
        title: Text('Jadwa Kuliah'),
        onTap: () {
          Navigator.pop(context); 
        },
      ),
      ListTile(
        leading: Icon(Icons.school),
        title: Text('Kartu Rencana Studi'),
        onTap: () {
          Navigator.pop(context); 
        },
      ),
      ListTile(
        leading: Icon(Icons.assignment),
        title: Text('Data Akademik'),
        onTap: () {
          Navigator.pop(context); 
        },
      ),
      ListTile(
        leading: Icon(Icons.forum),
        title: Text('Forum Diskusi'),
        onTap: () {
          Navigator.pop(context); 
        },
      ),
      ListTile(
        leading: Icon(Icons.attach_money),
        title: Text('Keuangan'),
        onTap: () {
          Navigator.pop(context); 
        },
      ),
    ],
  ),
),
    );
  }

  Widget _buildHeroSection() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.0),
      color: Theme.of(context).primaryColor,  
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Apa Kabar Sobat SIU ?",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8),
          Text(
            "Kuliah itu mudah & menyenangkan bukan, BUKANNN!",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              onPrimary: Theme.of(context).primaryColor, 
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              "Cek Nilai",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor, 
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ItemMahasiswa extends StatelessWidget {
  final String nomorInduk;
  final String namaMahasiswa;
  final String alamat;
  final String jurusan;
  final String notelp;
  final String agama;

  ItemMahasiswa({
    required this.nomorInduk,
    required this.namaMahasiswa,
    required this.alamat,
    required this.jurusan,
    required this.notelp,
    required this.agama,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          title: Text(namaMahasiswa),
          subtitle: Text(nomorInduk),
        ),
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MahasiswaDetail(
            nomorInduk: nomorInduk,
            namaMahasiswa: namaMahasiswa,
            alamat: alamat,
            jurusan: jurusan,
            notelp: notelp,
            agama: agama,
          ),
        ));
      },
    );
  }
}
