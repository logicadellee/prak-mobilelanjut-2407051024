import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AkunPage extends StatefulWidget {
  const AkunPage({super.key});

  @override
  State<AkunPage> createState() => _AkunPageState();
}

class _AkunPageState extends State<AkunPage> {
  bool bahasaId = true; 

  static const biru = Color(0xFF2F5BEA);
  static const gelap = Color(0xFF2D3250);
  static const garisKotak = Color(0xFFD6D9EE);
  static const garisMenu = Color(0xFFE3E8F8);

  // card profil
  Widget tombolKartu(String icon, String teks) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: garisKotak, width: 1.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(icon, width: 22),
          const SizedBox(width: 10),
          Text(teks, style: const TextStyle(fontSize: 16, color: gelap)),
        ],
      ),
    );
  }

  Widget kartuProfil() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 18),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: garisKotak),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 67,
                height: 67,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Color(0xFFFF5A00),
                  shape: BoxShape.circle,
                ),
                child: const Text('AS',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold)),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('ADELIA AGUS SAFITRI',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: gelap)),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Image.asset('assets/images/ikon_bintang_premium.png',
                            width: 22),
                        const SizedBox(width: 6),
                        const Flexible(
                          child: Text('Premium Member | HPR7**',
                              style: TextStyle(fontSize: 15, color: gelap)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                  child: tombolKartu('assets/images/ikon_profil.png', 'Lihat Profile')),
              const SizedBox(width: 10),
              Expanded(
                  child: tombolKartu('assets/images/ikon_qr.png', 'QR code')),
            ],
          ),
        ],
      ),
    );
  }

  Widget bagianAtas(double topPad) {
    return Stack(
      children: [
        Container(
          height: topPad + 171,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF5B2BD0), Color(0xFF9A4DF0)],
            ),
          ),
          // alignment: Alignment.bottomCenter,
          // child: Image.asset('assets/images/header_kota.png',
          //     width: double.infinity, fit: BoxFit.fitWidth),
        ),
        Padding(
          padding: EdgeInsets.only(top: topPad + 85),
          child: kartuProfil(),
        ),
      ],
    );
  }

  // menu
  Widget itemMenu(String icon, String teks, {Widget? kanan, bool garis = true}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18),
      padding: const EdgeInsets.symmetric(vertical: 24),
      decoration: BoxDecoration(
        border: garis
            ? const Border(bottom: BorderSide(color: garisMenu, width: 2))
            : null,
      ),
      child: Row(
        children: [
          Image.asset(icon, width: 20),
          const SizedBox(width: 14),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 165),
                child: Text(teks,
                    style: const TextStyle(fontSize: 17, color: gelap)),
              ),
            ),
          ),
          kanan ??
              const Icon(Icons.chevron_right, color: Colors.black87, size: 24),
        ],
      ),
    );
  }

  // switch bahasa ID / EN
  Widget toggleBahasa() {
    final bulat = Container(
      width: 22,
      height: 22,
      decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
    );
    final label = Expanded(
      child: Center(
        child: Text(bahasaId ? 'ID' : 'EN',
            style: const TextStyle(
                color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
      ),
    );

    return GestureDetector(
      onTap: () {
        setState(() {
          bahasaId = !bahasaId;
        });
      },
      child: Container(
        width: 54,
        height: 28,
        padding: const EdgeInsets.symmetric(horizontal: 3),
        decoration: BoxDecoration(
          color: biru,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: bahasaId ? [label, bulat] : [bulat, label],
        ),
      ),
    );
  }

  // footer
  Widget footer() {
    const gaya = TextStyle(fontSize: 18, color: Color(0xFF8A8FA0));
    return const Column(
      children: [
        Text('Versi 6.19.6', style: gaya),
        SizedBox(height: 10),
        Text('Copyright © 2026 Access', style: gaya),
      ],
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
              child: Column(
                children: [
                  bagianAtas(topPad),
                  const SizedBox(height: 30),
                  itemMenu('assets/images/ikon_sandi.png', 'Ganti Kata Sandi'),
                  itemMenu('assets/images/ikon_riwayat.png', 'Riwayat Transaksi'),
                  itemMenu('assets/images/ikon_benefit.png', 'Member Benefit'),
                  itemMenu('assets/images/ikon_daftar_penumpang.png',
                      'Daftar Penumpang'),
                  itemMenu('assets/images/ikon_pembayaran.png',
                      'Metode Pembayaran Saya'),
                  itemMenu('assets/images/ikon_face.png',
                      'Registrasi Face Recognition'),
                  itemMenu('assets/images/ikon_bantuan.png', 'Pusat Bantuan'),
                  itemMenu('assets/images/ikon_tentang.png',
                      'Tentang Access by KAI'),
                  itemMenu('assets/images/ikon_bahasa.png', 'Bahasa',
                      kanan: toggleBahasa()),
                  itemMenu('assets/images/ikon_keluar.png', 'Keluar',
                      garis: false),
                  const SizedBox(height: 66),
                  footer(),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}