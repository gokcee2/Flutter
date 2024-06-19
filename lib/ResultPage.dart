import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String name;
  final String gender;
  final bool isAdult;
  final bool smokes;
  final double cigarettesPerDay;

  ResultPage({
    required this.name,
    required this.gender,
    required this.isAdult,
    required this.smokes,
    required this.cigarettesPerDay,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sonuçlar')),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Adınız ve Soyadınız: $name'),
            Text('Cinsiyetiniz: $gender'),
            Text('Reşit misiniz: ${isAdult ? 'Evet' : 'Hayır'}'),
            Text('Sigara kullanıyor musunuz: ${smokes ? 'Evet' : 'Hayır'}'),
            if (smokes)
              Text('Günde kaç tane sigara kullanıyorsunuz: $cigarettesPerDay'),
          ],
        ),
      ),
    );
  }
}
