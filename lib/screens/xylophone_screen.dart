// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// import 'package:just_audio/just_audio.dart';
//
// class XylophoneScreen extends StatelessWidget {
//   const XylophoneScreen({super.key});
//
//   Future<void> playSound(int soundNumber) async {
//     // Use the just_audio package to first load the sound and then play it.
//     final AudioPlayer audioPlayer = AudioPlayer();
//     await audioPlayer.setAsset('assets/sounds/xylophone_note$soundNumber.wav');
//     await audioPlayer.play();
//   }
//
//   Expanded buildNotekey({required Color color, required int soundNumber}) {
//     return Expanded(
//       child: Padding(
//         padding: const EdgeInsets.all(8),
//         child: MaterialButton(
//           color: color,
//           onPressed: () async {
//             await playSound(soundNumber);
//           },
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: const Text('Xylophone'),
//         centerTitle: true,
//       ),
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             buildNotekey(color: Colors.red, soundNumber: 1)
//                 .animate()
//                 .fade(delay: 0.ms, duration: 1000.ms)
//                 .move(delay: 500.ms, duration: 1000.ms),
//             buildNotekey(color: Colors.orange, soundNumber: 2)
//                 .animate()
//                 .fade(delay: 500.ms, duration: 1000.ms)
//                 .move(delay: 1000.ms, duration: 1000.ms),
//             buildNotekey(color: Colors.yellow, soundNumber: 3)
//                 .animate()
//                 .fade(delay: 1000.ms, duration: 1000.ms)
//                 .move(delay: 1500.ms, duration: 1000.ms),
//             buildNotekey(color: Colors.green, soundNumber: 4)
//                 .animate()
//                 .fade(delay: 1500.ms, duration: 1000.ms)
//                 .move(delay: 2000.ms, duration: 1000.ms),
//             buildNotekey(color: Colors.teal, soundNumber: 5)
//                 .animate()
//                 .fade(delay: 2000.ms, duration: 1000.ms)
//                 .move(delay: 2500.ms, duration: 1000.ms),
//             buildNotekey(color: Colors.blue, soundNumber: 6)
//                 .animate()
//                 .fade(delay: 2500.ms, duration: 1000.ms)
//                 .move(delay: 3000.ms, duration: 1000.ms),
//             buildNotekey(color: Colors.purple, soundNumber: 7)
//                 .animate()
//                 .fade(delay: 3000.ms, duration: 1000.ms)
//                 .move(delay: 3500.ms, duration: 1000.ms),
//           ],
//         ),
//       ),
//     );
//   }
// }
