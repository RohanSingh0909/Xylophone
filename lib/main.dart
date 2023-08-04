// import 'package:flutter/material.dart';
// import 'package:audioplayers/audioplayers.dart';

// void main() => runApp(XylophoneApp());

// class XylophoneApp extends StatelessWidget {
//   void playSound(int soundNumber){
//       final player = AudioPlayer(playerId: 'note$soundNumber.wav');
//   }
//   Expanded buildkey({color, soundNumber}){
//     return Expanded(
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                 primary: color,
//               ),
//                   child: SizedBox(),
//                   onPressed: () {
//                     playSound(soundNumber);
//                   },
//                 ),
//               );
//   }
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.black,
//         body: SafeArea(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               buildkey(color: Colors.red, soundNumber: 1),
//               buildkey(color: Colors.orange, soundNumber: 2),
//               buildkey(color: Colors.yellow, soundNumber: 3),
//               buildkey(color: Colors.green, soundNumber: 4),
//               buildkey(color: Colors.teal, soundNumber: 5),
//               buildkey(color: Colors.blue, soundNumber: 6),
//               buildkey(color: Colors.purple, soundNumber: 7),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// ignore_for_file: depend_on_referenced_packages

import 'package:just_audio/just_audio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Xylophone());
}

class Xylophone extends StatefulWidget {
  @override
  _XylophoneState createState() => _XylophoneState();
}

class _XylophoneState extends State<Xylophone> {
  late AudioPlayer audioPlayer;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  void playNote(int soundNumber) async {
    await audioPlayer.setAsset('assets/note'+ soundNumber.toString() + '.wav');
    audioPlayer.play();
  }

  Expanded buildKey(Color color, int soundNumber) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: color),
        onPressed: () {
          playNote(soundNumber);
        },
        child: SizedBox.shrink(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                buildKey(Colors.red, 1),
                buildKey(Colors.orange, 2),
                buildKey(Colors.yellow, 3),
                buildKey(Colors.green, 4),
                buildKey(Colors.blue, 5),
                buildKey(Colors.indigo, 6),
                buildKey(Colors.deepPurple, 7),
              ],
            ),
          ),
        ));
  }
}