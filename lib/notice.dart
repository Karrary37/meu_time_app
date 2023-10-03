import 'package:flutter/material.dart';

void main() {
  runApp(NoticeApp());
}

class NoticeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Avisos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NoticePage(),
    );
  }
}

class NoticePage extends StatelessWidget {
  final List<Notice> notices = [
    Notice(
      title: 'Proximo jogo - dia 18/06',
      date: '20/05/2023',
      time: '10:00 AM',
    ),
    Notice(
      title: 'Compra do uniforme',
      date: '21/05/2023',
      time: '09:30 AM',
    ),
    Notice(
      title: 'Proximo jogo - dia 18/06',
      date: '20/05/2023',
      time: '10:00 AM',
    ),
    Notice(
      title: 'Compra do uniforme',
      date: '21/05/2023',
      time: '09:30 AM',
    ),
    Notice(
      title: 'Proximo jogo - dia 18/06',
      date: '20/05/2023',
      time: '10:00 AM',
    ),
    Notice(
      title: 'Compra do uniforme',
      date: '21/05/2023',
      time: '09:30 AM',
    ),
    Notice(
      title: 'Proximo jogo - dia 18/06',
      date: '20/05/2023',
      time: '10:00 AM',
    ),
    Notice(
      title: 'Compra do uniforme',
      date: '21/05/2023',
      time: '09:30 AM',
    ),
    // Adicione mais avisos aqui
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/Vacilou_Ja_Era_Verde.png',  // Caminho da imagem da logo
              width: 50,  // Largura da logo
              height: 50, // Altura da logo
            ),
            SizedBox(width: 8),  // Espaçamento entre a logo e o título
            Text('Avisos'),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: notices.length,
        itemBuilder: (context, index) {
          final notice = notices[index];
          return ListTile(
            title: Text(notice.title),
            subtitle: Text('${notice.date} às ${notice.time}'),
          );
        },
      ),
    );
  }
}

class Notice {
  final String title;
  final String date;
  final String time;

  Notice({
    required this.title,
    required this.date,
    required this.time,
  });
}