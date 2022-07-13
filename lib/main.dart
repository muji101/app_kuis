import 'package:flutter/material.dart';

import 'hasil.dart';
import 'kuis.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // const MyApp({super.key});
  var _soalIndex = 0;
  var totalSkor = 0;

  // var pertanyaan = [
  //   {
  //     'pertanyaan': 'Tempat apa yang anda kunjungi?',
  //     'jawaban': ['Pegunungan', 'Pantai', 'Hutan', 'Mall']
  //   },
  //   {
  //     'pertanyaan': 'Apa warna kesukaan anda?',
  //     'jawaban': ['Merah', 'Hijau', 'Kuning', 'Biru']
  //   },
  //   {
  //     'pertanyaan': 'Apa hobby anda?',
  //     'jawaban': ['Sepak bola', 'Volly', 'Renang', 'Ngoding']
  //   }
  // ];

  var pertanyaan = [
    {
      'pertanyaan': 'Tempat apa yang anda kunjungi?',
      'jawaban': [
        {'teks': 'Pegunungan', 'skor': 10},
        {'teks': 'Hutan', 'skor': 4},
        {'teks': 'Pantai', 'skor': 7},
        {'teks': 'Mall', 'skor': 1},
      ]
    },
    {
      'pertanyaan': 'Apa warna kesukaan anda?',
      'jawaban': [
        {'teks': 'Biru', 'skor': 10},
        {'teks': 'Hijau', 'skor': 4},
        {'teks': 'Pink', 'skor': 7},
        {'teks': 'Merah', 'skor': 1},
      ]
    },
    {
      'pertanyaan': 'Apa hobby anda?',
      'jawaban': [
        {'teks': 'Panahan', 'skor': 10},
        {'teks': 'Hocky', 'skor': 4},
        {'teks': 'Pencak silat', 'skor': 7},
        {'teks': 'Menggambar', 'skor': 1},
      ]
    }
  ];

  void resetKuis() {
    setState(() {
      _soalIndex = 0;
      totalSkor = 0;
    });
  }

  void _jawaban(int skor) {
    // print('Tombol sudah di tekan');
    totalSkor += skor;
    // mengbuild app ulang
    setState(() {
      _soalIndex += 1;
    });
    if (_soalIndex < pertanyaan.length) {}

    print(_soalIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Aplikasi Kuis'),
        ),
        body: _soalIndex < pertanyaan.length
            ? Kuis(
                jawaban: _jawaban,
                pertanyaan: pertanyaan,
                soalIndex: _soalIndex,
              )
            : Hasil(totalSkor, resetKuis),
      ),
    );
  }
}
