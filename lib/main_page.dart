import 'package:flutter/material.dart';
import 'kai_home.dart';
import 'kereta_page.dart';
import 'akun_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int menuAktif = 0; 

  static const biru = Color(0xFF2F5BEA);

  final List<Widget> halaman = const [
    KaiHomePage(),
    KeretaPage(),
    Center(child: Text('Halaman Tiket Saya')),
    Center(child: Text('Halaman Promo')),
    AkunPage(),
  ];

  final List<Map<String, dynamic>> itemNav = [
    {'icon': Icons.home_outlined, 'aktif': Icons.home_rounded, 'label': 'Beranda'},
    {'icon': Icons.train_outlined, 'aktif': Icons.train, 'label': 'Kereta'},
    {
      'icon': Icons.confirmation_number_outlined,
      'aktif': Icons.confirmation_number,
      'label': 'Tiket Saya'
    },
    {'icon': Icons.discount_outlined, 'aktif': Icons.discount, 'label': 'Promo'},
    {'icon': Icons.person_outline, 'aktif': Icons.person, 'label': 'Akun'},
  ];

  // menu bawah
  Widget navBawah(double bawah) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: bawah > 0 ? bawah : 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFE6E9F0))),
      ),
      child: Row(
        children: List.generate(itemNav.length, (i) {
          final aktif = i == menuAktif;
          final warnaIcon = aktif ? biru : const Color(0xFF8A94A6);
          final icon = aktif ? itemNav[i]['aktif'] : itemNav[i]['icon'];

          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  menuAktif = i;
                });
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(icon as IconData, size: 30, color: warnaIcon),
                  const SizedBox(height: 4),
                  Text(
                    itemNav[i]['label'] as String,
                    style: TextStyle(
                      fontSize: 13,
                      color: aktif ? Colors.black : const Color(0xFF8A94A6),
                      fontWeight: aktif ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bawahPad = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      backgroundColor: Colors.white,
      // IndexedStack: semua halaman disimpan, yang tampil hanya yang dipilih
      body: IndexedStack(index: menuAktif, children: halaman),
      bottomNavigationBar: navBawah(bawahPad),
    );
  }
}