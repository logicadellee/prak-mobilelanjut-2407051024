import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget statusBar() {
    const teks = TextStyle(color: Colors.white, fontSize: 17);
    const kecil = TextStyle(color: Colors.white, fontSize: 8);

    return Padding(
      padding:const EdgeInsets.fromLTRB(16, 12, 16, 0),
      child:Row(
        children:[
        const Text('14.28', style: teks),
        const SizedBox(width: 6),
        const Icon(Icons.access_time_filled, color: Colors.white, size: 16),
        const Spacer(),
        const Icon(Icons.volume_off, color: Colors.white, size: 16),
        const Column(
          children: [Text('Vo))', style: kecil), Text('LTE1', style: kecil)]),
        const SizedBox(width: 4),
        const Icon(Icons.signal_cellular_4_bar, color: Colors.white, size: 17),
        const Icon(Icons.signal_cellular_4_bar, color: Colors.white, size: 17),
        const SizedBox(width: 6),
        const Text('50%', style: teks),
        const RotatedBox(
          quarterTurns: 1,
          child: Icon(Icons.battery_4_bar, color: Colors.white, size: 18),
          )
        ]
      ),
    );
  }

  Widget WidgetCuaca(){
    return Column(
      children: [
        Image.asset('assets/images/cuaca.png', width: 70),
        const SizedBox(height: 4),
        const Text(
          'Ketuk untuk info Cuaca',
          style:TextStyle(color: Colors.white, fontSize: 17),
        )
      ],
    );
  }

  Widget searchBar() {
    const warnaIcon= Color(0xFFB3D4FF);

    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        color: const Color(0xE61F3340),
        borderRadius: BorderRadius.circular(50),
      ),
      child:Row(
        children: [
          Image.asset('assets/images/google.png', width: 36),
          const Spacer(),
          const Icon(Icons.search, color: warnaIcon, size: 28),
          const SizedBox(width: 24),
          const Icon(Icons.mic, color: warnaIcon, size: 28),
          const SizedBox(width: 24),
          const Icon(Icons.center_focus_strong_outlined, color: warnaIcon, size: 28),
        ],)
    );
  }

  Widget pageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:List.generate(7, (index) {
          return Container(
            width: 10,
            height: 10,
            margin: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index == 5 ? Colors.white : Colors.white54,
            ),
          );
        })
    );
  }

  Widget favoriteBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset('assets/images/telepon.png', width: 74),
        Image.asset('assets/images/pesan.png', width: 74),
        Image.asset('assets/images/whatsapp.png', width: 74),
        Image.asset('assets/images/kamera.png', width: 74),
      ],
    );
  }

  Widget navBar() {
    return SizedBox(
      height: 48,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: List.generate(3,(index) {
                  return Container(
                    width: 2.5,
                    height: 18,
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    color: Colors.white,
                    );
                }
                ),
            ),
            Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2.5),
                borderRadius: BorderRadius.circular(8),
                ),
              ),
            const Icon(Icons.arrow_back_ios_new, color: Colors.white, size:20),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/wallpaper.jpg', fit: BoxFit.cover),
          
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: statusBar(),
          ),
          Positioned(
            top: 100,
            left: 0,
            right: 0,
            child: WidgetCuaca(),
          ),
          Positioned(
            top: 190,
            left: 0,
            right: 0,
            child: searchBar(),
          ),
          Positioned(
            bottom: 128,
            left: 0,
            right: 0,
            child: pageIndicator(),
          ),
          Positioned(
            bottom: 52,
            left: 0,
            right: 0,
            child: favoriteBar(),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: navBar(),
          ),
        ],
      )
    );
  }
}