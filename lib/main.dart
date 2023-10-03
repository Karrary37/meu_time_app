import 'package:flutter/material.dart';

import 'package:primeiro_projeto/register.dart';
import 'package:primeiro_projeto/dashboard.dart';
import 'package:primeiro_projeto/login.dart';
import 'package:primeiro_projeto/member.dart';
import 'package:primeiro_projeto/member_detail.dart';
import 'package:primeiro_projeto/notice.dart';
import 'package:primeiro_projeto/game.dart';
import 'package:primeiro_projeto/statistics.dart';
import 'package:primeiro_projeto/finance.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu App',
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/dashboard': (context) => DashboardPage(),
        '/register': (context) => CadastroPage(),
        '/member': (context) => MembersPage(),
        '/member-detail': (context) => MembersDetailPage(),
        '/notice': (context) => NoticePage(),
        '/game': (context) => GamesPage(),
        '/gameDetails': (context) => GameDetailsPage(),
        '/statistics': (context) => StatisticsPage(),
        '/finance': (context) => FinancePage(),

      },
    );
  }
}






