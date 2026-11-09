import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'kereta_antar_kota.dart';
import 'komponen_umum.dart';

class KeretaPage extends StatefulWidget {
  const KeretaPage({super.key});

  @override
  State<KeretaPage> createState() => _KeretaPageState();
}

class _KeretaPageState extends State<KeretaPage> {
  static const biru = Color(0xFF2F5BEA);
  static const gelap = Color(0xFF1F2A44);
  static const garis = Color(0xFFE6E9F0);

  // judul
  Widget judulHalaman() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Kereta',
              style: TextStyle(
                  fontSize: 30, fontWeight: FontWeight.bold, color: gelap)),
          SizedBox(height: 2),
          Text('Layanan Kereta KAI',
              style: TextStyle(fontSize: 16, color: Color(0xFF8A94A6))),
        ],
      ),
    );
  }

  // menu
  Widget slot(Widget menu) {
    return SizedBox(
      width: 58,
      height: 90,
      child: OverflowBox(minWidth: 71, maxWidth: 71, child: menu),
    );
  }

  Widget menuLayanan() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          slot(MenuBulat(
            label: 'Antar Kota',
            icon: Icons.directions_railway_filled,
            warna1: const Color(0xFF5B6CF0),
            warna2: const Color(0xFF1E1FB5),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const KeretaAntarKotaPage()),
              );
            },
          )),
          slot(const MenuBulat(
            label: 'Lokal',
            icon: Icons.directions_railway_filled,
            warna1: Color(0xFFFFC53D),
            warna2: Color(0xFFFF8A00),
          )),
          slot(const MenuBulat(
            label: 'Komuter',
            icon: Icons.directions_subway_filled,
            warna1: Color(0xFFFF7A1A),
            warna2: Color(0xFFE8260C),
          )),
          slot(const MenuBulat(
            label: 'LRT',
            icon: Icons.directions_railway_filled,
            warna1: Color(0xFFE020B0),
            warna2: Color(0xFFB5009A),
          )),
          slot(const MenuBulat(
            label: 'Bandara',
            icon: Icons.flight,
            warna1: Color(0xFF4FC3F7),
            warna2: Color(0xFF1E88E5),
          )),
        ],
      ),
    );
  }

  // tujuan populer
  Widget kartuTujuan(String gambar) {
    return Container(
      width: double.infinity, 
      margin: const EdgeInsets.fromLTRB(18, 0, 18, 18),
      height: 153,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: Image.asset(
          gambar,
          width: double.infinity,
          height: 153,
          fit: BoxFit.cover, 
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final topPad = MediaQuery.of(context).padding.top;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.only(top: topPad + 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  judulHalaman(),
                  const SizedBox(height: 20),
                  menuLayanan(),
                  const SizedBox(height: 30),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    child: Text('Tujuan Populer',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: gelap)),
                  ),
                  const SizedBox(height: 14),
                  kartuTujuan('assets/images/kota_jakarta.png'),
                  kartuTujuan('assets/images/kota_bandung.png'),
                  kartuTujuan('assets/images/kota_jogja.png'),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}