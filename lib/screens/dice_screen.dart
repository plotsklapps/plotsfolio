// import 'dart:math';
//
// import 'package:flex_color_scheme/flex_color_scheme.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// import 'package:signals/signals_flutter.dart';
//
// // Int signals for the left and right dice values.
// final Signal<int> sLeftDice = signal<int>(1);
// final Signal<int> sRightDice = signal<int>(1);
//
// class DiceScreen extends StatelessWidget {
//   const DiceScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     // Set random values for the left and right dice signals.
//     void rollDice() {
//       sLeftDice.value = Random().nextInt(6) + 1;
//       sRightDice.value = Random().nextInt(6) + 1;
//     }
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Dicee'),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Row(
//               children: <Widget>[
//                 Expanded(
//                   child: ElevatedButton(
//                     onPressed: rollDice,
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: FlexColor.outerSpaceLightPrimary,
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 16),
//                       child:
//                       // Fetch the dice image based on the left dice signal
//                       // value.
//                       Image.asset(
//                         'assets/images/dice/dice${sLeftDice.watch(context)}'
//                             '.png',
//                       ),
//                     ),
//                   ),
//                 ).animate().flip(delay: 0.ms, duration: 1000.ms),
//                 const SizedBox(
//                   width: 16,
//                 ),
//                 Expanded(
//                   child: ElevatedButton(
//                     onPressed: rollDice,
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: FlexColor.outerSpaceLightPrimary,
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 16),
//                       child:
//                       // Fetch the dice image based on the right dice signal
//                       // value.
//                       Image.asset(
//                         'assets/images/dice/dice${sRightDice.watch(context)}.png',
//                       ),
//                     ),
//                   ),
//                 ).animate().flip(delay: 1000.ms, duration: 1000.ms),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
