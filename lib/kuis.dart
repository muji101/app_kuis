import 'package:flutter/material.dart';

import './jawaban.dart';
import './pertanyaan.dart';

class Kuis extends StatelessWidget {
  // const Kuis({Key key}) : super(key: key);

  Function jawaban;
  List<Map<String, Object>> pertanyaan;
  int soalIndex;

  //positional argument
  Kuis({
    @required this.jawaban,
    @required this.pertanyaan,
    @required this.soalIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Pertanyaan(pertanyaan[soalIndex]),
        //...di pastikan widget
        ...(pertanyaan[soalIndex]['jawaban'] as List<Map<String, Object>>)
            .map((jawabanText) {
          return Jawaban(
              () => jawaban(jawabanText['skor']), jawabanText['teks']);
        }).toList(),
      ],
    );
  }
}
