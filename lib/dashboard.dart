//         PAGINA DASHBOARD

import 'package:flutter/material.dart';

void main() {
  runApp(DashboardApp());
}

class DashboardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: DashboardPage(),
    );
  }
}

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

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
            Text('Dashboard'),
          ],
        ),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.sports_soccer),
            title: Text('Jogos'),
            onTap: () {
              // Lógica para navegar para a página de jogos
              Navigator.pushNamed(context, '/game');
            },
          ),
          ListTile(
            leading: Icon(Icons.analytics),
            title: Text('Estatísticas'),
            onTap: () {
              // Lógica para navegar para a página de estatísticas
              Navigator.pushNamed(context, '/statistics');
            },
          ),
          ListTile(
            leading: Icon(Icons.attach_money),
            title: Text('Financeiros'),
            onTap: () {
              // Lógica para navegar para a página financeira
              Navigator.pushNamed(context, '/finance');
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Avisos'),
            onTap: () {
              // Lógica para navegar para a página de avisos
              Navigator.pushNamed(context, '/notice');
            },
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Participantes'),
            onTap: () {
              // Lógica para navegar para a página de participantes
              Navigator.pushNamed(context, '/member-detail');
            },
          ),
          ListTile(
            leading: Icon(Icons.person_add),
            title: Text('Convidar amigos'),
            onTap: () {
              // Lógica para navegar para a página de convite de amigos
              print('Cliquei em Convidar amigos');
            },
          ),
        ],
      ),
    );
  }
}