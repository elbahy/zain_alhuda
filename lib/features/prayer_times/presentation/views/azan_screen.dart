import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AzanScreen extends StatefulWidget {
  final String prayerName;

  const AzanScreen({super.key, required this.prayerName});

  @override
  _AzanScreenState createState() => _AzanScreenState();
}

class _AzanScreenState extends State<AzanScreen> {
  final AudioPlayer audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    // تشغيل صوت الأذان
    audioPlayer.play(AssetSource('assets/audio/azan.mp3'));
  }

  @override
  void dispose() {
    // إيقاف الأذان عند إغلاق الشاشة
    audioPlayer.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green, // يمكنك تخصيص اللون أو الخلفية
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'حان وقت ${widget.prayerName}', // عرض اسم الصلاة
              style: const TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // إغلاق الشاشة وإيقاف الأذان
                Navigator.pop(context);
              },
              child: const Text('إيقاف الأذان'),
            ),
          ],
        ),
      ),
    );
  }
}
