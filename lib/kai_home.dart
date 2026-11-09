import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'kereta_antar_kota.dart';
import 'komponen_umum.dart';

class KaiHomePage extends StatefulWidget {
  const KaiHomePage({super.key});

  @override
  State<KaiHomePage> createState() => _KaiHomePageState();
}

class _KaiHomePageState extends State<KaiHomePage> {
  final ScrollController scroll = ScrollController();
  bool sudahScroll = false; // false = header ungu, true = header putih

  static const biru = Color(0xFF2F5BEA);
  static const gelap = Color(0xFF1F2A44);
  static const garis = Color(0xFFE6E9F0);

  @override
  void initState() {
    super.initState();
    // header berubah jadi putih kalau halaman sudah digulir
    scroll.addListener(() {
      bool status = scroll.offset > 60;
      if (status != sudahScroll) {
        setState(() {
          sudahScroll = status;
        });
      }
    });
  }

  @override
  void dispose() {
    scroll.dispose();
    super.dispose();
  }

  // header
  Widget tombolBulat(IconData icon) {
    return Container(
      width: 38,
      height: 38,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: sudahScroll ? Colors.white : const Color(0x26FFFFFF),
        border: Border.all(
          color: sudahScroll ? const Color(0xFFB9C6F5) : Colors.white54,
        ),
      ),
      child: Icon(icon, size: 20, color: sudahScroll ? biru : Colors.white),
    );
  }

  Widget header(double topPad) {
    final warnaTeks = sudahScroll ? gelap : Colors.white;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: EdgeInsets.fromLTRB(18, topPad + 8, 18, 10),
      decoration: BoxDecoration(
        color: sudahScroll ? Colors.white : Colors.transparent,
        border: Border(
          bottom: BorderSide(
            color: sudahScroll ? garis : Colors.transparent,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Selamat Malam',
                    style: TextStyle(color: warnaTeks, fontSize: 13)),
                const SizedBox(height: 2),
                Text(
                  'ADELIA AGUS SAFITRI',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: warnaTeks,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          tombolBulat(Icons.shopping_cart),
          const SizedBox(width: 6),
          tombolBulat(Icons.email),
          const SizedBox(width: 6),
          // tombol bahasa
          Container(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: sudahScroll ? Colors.white : const Color(0x26FFFFFF),
              border: Border.all(
                color: sudahScroll ? const Color(0xFFB9C6F5) : Colors.white54,
              ),
            ),
            child: Row(
              children: [
                // bendera Indonesia
                Container(
                  width: 18,
                  height: 12,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12, width: 0.5),
                  ),
                  child: Column(
                    children: [
                      Expanded(child: Container(color: const Color(0xFFE53935))),
                      Expanded(child: Container(color: Colors.white)),
                    ],
                  ),
                ),
                const SizedBox(width: 6),
                Text('ID', style: TextStyle(color: warnaTeks, fontSize: 15)),
                Icon(Icons.keyboard_arrow_down,
                    color: sudahScroll ? biru : Colors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ungu dan card kaipay
  Widget aksiKaiPay(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: biru, size: 28),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Color(0xFF4A5568),
          ),
        ),
      ],
    );
  }

  Widget kartuKaiPay() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: garis),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        children: [
          IntrinsicHeight(
            child: Row(
              children: [
                // saldo
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/images/kaipay.png', width: 28),
                            const SizedBox(width: 6),
                            const Text('KAIPay',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Row(
                          children: [
                            Text('Rp0',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold)),
                            SizedBox(width: 4),
                            Icon(Icons.chevron_right, color: biru),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const VerticalDivider(width: 1, color: garis),
                // tombol scan, top up, riwayat
                Expanded(
                  flex: 6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      aksiKaiPay(Icons.qr_code_scanner, 'Scan'),
                      aksiKaiPay(Icons.add_card, 'Top Up'),
                      aksiKaiPay(Icons.history, 'Riwayat'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1, color: garis),
          // railpoin + premium
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Image.asset('assets/images/railpoin.png', width: 28),
                const SizedBox(width: 6),
                const Text('0',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFE67E00))),
                const Text(' Railpoin',
                    style: TextStyle(fontSize: 16, color: Color(0xFF6B7280))),
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF3CC),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.workspace_premium,
                          color: Color(0xFFB8860B), size: 22),
                      const SizedBox(width: 4),
                      const Text('Premium',
                          style: TextStyle(
                              color: Color(0xFFB8860B),
                              fontWeight: FontWeight.bold,
                              fontSize: 15)),
                      const SizedBox(width: 6),
                      Container(
                        width: 18,
                        height: 18,
                        decoration: const BoxDecoration(
                          color: Color(0xFFD4A017),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.chevron_right,
                            color: Colors.white, size: 14),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget bagianAtas(double topPad) {
    return Stack(
      children: [
        // latar ungu
        Container(
          height: topPad + 170,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF5B2BD0), Color(0xFF9A4DF0)],
            ),
          ),
        ),
        // kartu KAIPay menimpa bagian ungu
        Padding(
          padding: EdgeInsets.only(top: topPad + 100),
          child: kartuKaiPay(),
        ),
      ],
    );
  }

  // menu
  Widget menuAtas() {
    final skala =
        (MediaQuery.of(context).size.width / 393).clamp(0.9, 2.0).toDouble();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        children: [
          MenuBulat(
            label: 'Antar Kota',
            skala: skala,
            icon: Icons.directions_railway_filled,
            warna1: const Color(0xFF5B6CF0),
            warna2: const Color(0xFF1E1FB5),
            onTap: () {
            // pindah ke halaman Kereta Antar Kota
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const KeretaAntarKotaPage()),
            );
          }),
          MenuBulat(
            label: 'Lokal',
            skala: skala,
            icon: Icons.directions_railway_filled,
            warna1: const Color(0xFFFFC53D),
            warna2: const Color(0xFFFF8A00),
          ),
          MenuBulat(
            label: 'Komuter',
            skala: skala,
            icon: Icons.directions_subway_filled,
            warna1: const Color(0xFFFF7A1A),
            warna2: const Color(0xFFE8260C),
          ),
          MenuBulat(
            label: 'LRT',
            skala: skala,
            icon: Icons.directions_railway_filled,
            warna1: const Color(0xFFE020B0),
            warna2: const Color(0xFFB5009A),
          ),
          MenuBulat(
            label: 'Bandara',
            skala: skala,
            icon: Icons.flight,
            warna1: const Color(0xFF4FC3F7),
            warna2: const Color(0xFF1E88E5),
          ),
          MenuBulat(
            label: 'Whoosh',
            skala: skala,
            icon: Icons.train,
            warna1: const Color(0xFFEF3B2F),
            warna2: const Color(0xFFB71C1C),
          ),
        ],
      ),
    );
  }

  Widget menuKecil(String label, IconData icon) {
    return SizedBox(
      width: 80,
      child: Column(
        children: [
          Container(
            width: 55,
            height: 55,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFEEF3FF),
            ),
            child: Icon(icon, color: biru, size: 30),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 13, color: gelap),
          ),
        ],
      ),
    );
  }

  Widget menuBawah() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Center(child: menuKecil('Space By\nKAI', Icons.home_rounded))),
          Expanded(child: Center(child: menuKecil('Grab', Icons.directions_car))),
          Expanded(child: Center(child: menuKecil('Kartu Multi\nTrip', Icons.credit_card))),
          Expanded(child: Center(child: menuKecil('Show more', Icons.grid_view_rounded))),
        ],
      ),
    );
  }

  // banner
  Widget bannerLive() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18),
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF6D3FF2), Color(0xFFB44FF0), Color(0xFFE055F0)],
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Stack(
          children: [
            // gambar kereta di kanan
            Positioned(
              right: 0,
              bottom: 4,
              child: Image.asset('assets/images/kereta_banner.png', width: 190),
            ),
            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text('Live Tracking',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 21,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Row(
                          children: [
                            Text('Baru',
                                style: TextStyle(
                                    color: Color(0xFFC026D3),
                                    fontWeight: FontWeight.w600)),
                            SizedBox(width: 2),
                            Icon(Icons.auto_awesome,
                                size: 14, color: Color(0xFFE11D48)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  const SizedBox(
                    width: 215,
                    child: Text(
                      'Lihat lokasi dan status perjalanan kereta kamu secara real-time.',
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: 208,
                    height: 26,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text('Buka Live Tracking',
                        style: TextStyle(
                            color: biru,
                            fontWeight: FontWeight.bold,
                            fontSize: 14)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // promo dan artikel
  Widget judulSection(String judul) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(judul,
              style: const TextStyle(
                  fontSize: 21, fontWeight: FontWeight.bold, color: gelap)),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: biru, width: 1.5),
            ),
            child: const Text('Lihat Semua',
                style: TextStyle(
                    color: biru, fontWeight: FontWeight.bold, fontSize: 14)),
          ),
        ],
      ),
    );
  }

  // kartu bergambar
  Widget kartu(String? gambar, String judul, double lebar, double tinggi) {
    return SizedBox(
      width: lebar,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: gambar == null
                ? Container(height: tinggi, color: const Color(0xFFF3F5FA))
                : Image.asset(gambar,
                    width: lebar, height: tinggi, fit: BoxFit.cover),
          ),
          const SizedBox(height: 12),
          Text(
            judul,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 16, color: gelap),
          ),
        ],
      ),
    );
  }

  Widget daftarPromo() {
    final lebar = MediaQuery.of(context).size.width * 0.8;
    final tinggi = lebar * 0.41;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kartu('assets/images/promo_derma.png', 'DERMA RICH WELLNESS', lebar,
              tinggi),
          const SizedBox(width: 18),
          kartu(null, 'AYAM BAKAR', lebar, tinggi),
        ],
      ),
    );
  }

  Widget daftarArtikel() {
    final lebar = MediaQuery.of(context).size.width * 0.68;
    final tinggi = lebar * 0.48;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kartu('assets/images/artikel_kai.png',
              'KAI Siapkan Suku Cadang Rp1,23 Triliun', lebar, tinggi),
          const SizedBox(width: 18),
          kartu(null, 'Distribusi Sentral Logistik', lebar, tinggi),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final topPad = MediaQuery.of(context).padding.top;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: sudahScroll ? SystemUiOverlayStyle.dark : SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            SingleChildScrollView(
              controller: scroll,
              child: Column(
                children: [
                  bagianAtas(topPad),
                  const SizedBox(height: 20),
                  menuAtas(),
                  const SizedBox(height: 28),
                  menuBawah(),
                  const SizedBox(height: 20),
                  bannerLive(),
                  const SizedBox(height: 30),
                  const IklanBanner(),
                  const SizedBox(height: 20),
                  judulSection('Promo Terbaru'),
                  const SizedBox(height: 20),
                  daftarPromo(),
                  const SizedBox(height: 40),
                  judulSection('Artikel Pilihan'),
                  const SizedBox(height: 20),
                  daftarArtikel(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            Positioned(top: 0, left: 0, right: 0, child: header(topPad)),
          ],
        ),
      ),
    );
  }
}