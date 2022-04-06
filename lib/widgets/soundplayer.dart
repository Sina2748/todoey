import 'package:audioplayers/audioplayers.dart';
import 'dart:math';

AudioCache audioPlayer = AudioCache();
var rnd = Random();
int noteNumber = 2;

void playSound(int noteNumber) {
  int noteNumber = 2 + rnd.nextInt(6);
  print(noteNumber);
  audioPlayer.play('note$noteNumber.wav');
}
