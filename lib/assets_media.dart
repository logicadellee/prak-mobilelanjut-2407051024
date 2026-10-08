import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:video_player/video_player.dart';

class AssetsMediaPage extends StatefulWidget {
  const AssetsMediaPage({super.key});

  @override
  State<AssetsMediaPage> createState() => _AssetsMediaPageState();
}

class _AssetsMediaPageState extends State<AssetsMediaPage> {
  final AudioPlayer player = AudioPlayer();
  bool isPlaying = false;

  late VideoPlayerController videoController;
  bool isVideoPlaying = false;

  @override
  void initState() {
    super.initState();

    videoController = VideoPlayerController.asset(
      'assets/videos/video.mp4',
    );

    videoController.initialize().then((_) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  void playAudio() async {
    if (isPlaying) {
      await player.pause();
    } else {
      await player.play(
        AssetSource('audios/music.mp3'),
      );
    }

    setState(() {
      isPlaying = !isPlaying;
    });
  }

  void playVideo() {
    if (!videoController.value.isInitialized) {
      return;
    }

    setState(() {
      if (videoController.value.isPlaying) {
        videoController.pause();
        isVideoPlaying = false;
      } else {
        videoController.play();
        isVideoPlaying = true;
      }
    });
  }

  @override
  void dispose() {
    player.dispose();
    videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F6FC),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),

                decoration: BoxDecoration(
                  color: const Color(0xFFF7F5FB),
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),

                child: Column(
                  children: [
                    // FOTO PROFILE
                    ClipOval(
                      child: Image.asset(
                        'assets/images/IT.png',
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(height: 15),

                    // NAMA
                    const Text(
                      'Adelia Agus Safitri',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),

                decoration: BoxDecoration(
                  color: const Color(0xFFF7F5FB),
                  borderRadius: BorderRadius.circular(14),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    const Text(
                      'Audio Motivasi',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 15),

                    Container(
                      padding: const EdgeInsets.all(10),

                      decoration: BoxDecoration(
                        color: const Color(0xFFE1E5FF),
                        borderRadius: BorderRadius.circular(15),
                      ),

                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 27,
                            backgroundColor: const Color(0xFF4D63D9),

                            child: IconButton(
                              onPressed: playAudio,

                              icon: Icon(
                                isPlaying
                                    ? Icons.pause
                                    : Icons.play_arrow,
                                color: Colors.white,
                              ),
                            ),
                          ),

                          const SizedBox(width: 12),

                          // PROGRESS AUDIO
                          const Expanded(
                            child: LinearProgressIndicator(
                              minHeight: 6,
                              backgroundColor: Color(0xFFC8CDEF),

                              valueColor: AlwaysStoppedAnimation(
                                Color(0xFF4D63D9),
                              ),
                            ),
                          ),

                          const SizedBox(width: 10),

                          // ICON VOLUME
                          const Icon(
                            Icons.volume_up,
                            color: Color(0xFF202342),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),

                decoration: BoxDecoration(
                  color: const Color(0xFFF7F5FB),
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    // JUDUL VIDEO
                    const Text(
                      'Video Motivasi',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 15),

                    if (videoController.value.isInitialized)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),

                        child: AspectRatio(
                          aspectRatio:
                              videoController.value.aspectRatio,

                          child: VideoPlayer(
                            videoController,
                          ),
                        ),
                      )
                    else
                      const SizedBox(
                        height: 200,

                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),

                    const SizedBox(height: 15),

                    SizedBox(
                      width: double.infinity,
                      height: 50,

                      child: ElevatedButton.icon(
                        onPressed:
                            videoController.value.isInitialized
                                ? playVideo
                                : null,

                        icon: Icon(
                          isVideoPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
                        ),

                        label: Text(
                          isVideoPlaying
                              ? 'Pause Video'
                              : 'Play Video',
                        ),

                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color(0xFF4D63D9),

                          foregroundColor: Colors.white,

                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}