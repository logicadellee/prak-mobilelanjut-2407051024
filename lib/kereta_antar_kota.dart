import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'komponen_umum.dart';

class KeretaAntarKotaPage extends StatefulWidget {
  const KeretaAntarKotaPage({super.key});

  @override
  State<KeretaAntarKotaPage> createState() => _KeretaAntarKotaPageState();
}

class _KeretaAntarKotaPageState extends State<KeretaAntarKotaPage> {
  bool pulangPergi = false; 

  static const biru = Color(0xFF1A5CE8);
  static const garisKotak = Color(0xFFD6D9EE);
  static const abuTeks = Color(0xFF9AA0B4);

  // app bar
  Widget appBar() {
    return SizedBox(
      height: 48,
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Text(
            'Kereta Antar Kota',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          // tombol kembali di kiri
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              padding: const EdgeInsets.only(left: 18),
              onPressed: () {
                Navigator.maybePop(context);
              },
              icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
            ),
          ),
        ],
      ),
    );
  }

  // card stasiun
  Widget itemStasiun(String icon, String label, String hint) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 14, 12, 14),
      child: Row(
        children: [
          Image.asset(icon, width: 26),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87)),
                const SizedBox(height: 6),
                Text(hint,
                    style: const TextStyle(fontSize: 16, color: abuTeks)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget kotakStasiun() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: garisKotak, width: 1.5),
      ),
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Column(
            children: [
              itemStasiun('assets/images/ikon_kereta_berangkat.png',
                  'Keberangkatan', 'Pilih stasiun keberangkatan'),
              // garis pemisah
              const Padding(
                padding: EdgeInsets.only(left: 12, right: 50),
                child: Divider(height: 1, thickness: 1.5, color: garisKotak),
              ),
              itemStasiun('assets/images/ikon_kereta_tujuan.png', 'Tujuan',
                  'Pilih stasiun tujuan'),
            ],
          ),
          // tombol tukar stasiun
          Container(
            margin: const EdgeInsets.only(right: 12),
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: garisKotak, width: 1.5),
            ),
            child: const Icon(Icons.swap_vert, color: biru, size: 20),
          ),
        ],
      ),
    );
  }

  // tanggal
  Widget kotakTanggal() {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: garisKotak, width: 1.5),
      ),
      child: Row(
        children: [
          Image.asset('assets/images/ikon_kalender.png', width: 26),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Tanggal Berangkat',
                    style: TextStyle(fontSize: 14, color: abuTeks)),
                SizedBox(height: 4),
                Text('Sab, 17 Okt 2026',
                    style: TextStyle(fontSize: 18, color: Colors.black87)),
              ],
            ),
          ),
          // switch pulang pergi
          Column(
            children: [
              const Text('Pulang Pergi',
                  style: TextStyle(fontSize: 12, color: abuTeks)),
              Switch(
                value: pulangPergi,
                onChanged: (nilai) {
                  setState(() {
                    pulangPergi = nilai;
                  });
                },
                activeTrackColor: biru,
                inactiveThumbColor: Colors.white,
                inactiveTrackColor: const Color(0xFFB9B9C9),
                trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // penumpang
  Widget kotakPenumpang() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(12, 14, 12, 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: garisKotak, width: 1.5),
      ),
      child: Row(
        children: [
          Image.asset('assets/images/ikon_penumpang.png', width: 26),
          const SizedBox(width: 14),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Pilih Penumpang',
                  style: TextStyle(fontSize: 14, color: abuTeks)),
              SizedBox(height: 4),
              Text('01 Dewasa, 00 Bayi',
                  style: TextStyle(fontSize: 18, color: Colors.black87)),
            ],
          ),
        ],
      ),
    );
  }

  // card
  Widget kartuCari() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 18),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: garisKotak),
      ),
      child: Column(
        children: [
          kotakStasiun(),
          const SizedBox(height: 12),
          kotakTanggal(),
          const SizedBox(height: 12),
          kotakPenumpang(),
          const SizedBox(height: 20),
          // tombol cari
          GestureDetector(
            onTap: () {},
            child: Container(
              width: double.infinity,
              height: 49,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: biru,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text('Cari Kereta',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final topPad = MediaQuery.of(context).padding.top;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: const Color(0xFFF1F1F1),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  // latar gradasi (oranye -> ungu -> biru)
                  Container(
                    height: topPad + 366,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFFF6A06A),
                          Color(0xFFD9508E),
                          Color(0xFF8B3BD0),
                          Color(0xFF4038D8),
                        ],
                        stops: [0.0, 0.25, 0.55, 1.0],
                      ),
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(42)),
                    ),
                  ),
                  // app bar
                  Positioned(
                    top: topPad + 8,
                    left: 0,
                    right: 0,
                    child: appBar(),
                  ),
                  // kartu putih menimpa latar
                  Padding(
                    padding: EdgeInsets.only(top: topPad + 98),
                    child: kartuCari(),
                  ),
                ],
              ),
              const SizedBox(height: 19),
              const IklanBanner(),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}