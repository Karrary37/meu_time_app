import 'package:flutter/material.dart';

void main() {
  runApp(MembersDetailApp());
}

class MembersDetailApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Membros',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MembersDetailPage(),
    );
  }
}

class MembersDetailPage extends StatelessWidget {
  final List<Member> members = [
    Member(
      photoUrl: 'https://example.com/member1.jpg',
      name: 'John Doe',
      role: 'Diretor',
      games: 10,
      goals: 5,
      goalsConceded: 3,
      assists: 2,
      yellowCards: 2,
      redCards: 1,
      ballsFilled: 3,
      ballsDeflated: 1,
    ),
    Member(
      photoUrl: 'https://example.com/member2.jpg',
      name: 'Jane Smith',
      role: 'Goleiro',
      games: 8,
      goals: 2,
      goalsConceded: 4,
      assists: 4,
      yellowCards: 1,
      redCards: 0,
      ballsFilled: 2,
      ballsDeflated: 0,
    ),
    Member(
      photoUrl: 'https://example.com/member2.jpg',
      name: 'Jane Smith',
      role: 'Lateral',
      games: 8,
      goals: 2,
      goalsConceded: 4,
      assists: 4,
      yellowCards: 1,
      redCards: 0,
      ballsFilled: 2,
      ballsDeflated: 0,
    ),
    Member(
      photoUrl: 'https://example.com/member2.jpg',
      name: 'Jane Smith',
      role: 'Zagueiro',
      games: 8,
      goals: 2,
      goalsConceded: 4,
      assists: 4,
      yellowCards: 1,
      redCards: 0,
      ballsFilled: 2,
      ballsDeflated: 0,
    ),
    // Adicione mais membros aqui
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
              Text('Membro'),
            ],
          ),
      ),
      body: ListView.builder(
        itemCount: members.length,
        itemBuilder: (context, index) {
          final member = members[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(member.photoUrl),
            ),
            title: Text(member.name),
            subtitle: Text(member.role),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MemberDetailsPage(member: member),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class Member {
  final String photoUrl;
  final String name;
  final String role;
  final int games;
  final int goals;
  final int goalsConceded;
  final int assists;
  final int yellowCards;
  final int redCards;
  final int ballsFilled;
  final int ballsDeflated;

  Member({
    required this.photoUrl,
    required this.name,
    required this.role,
    required this.games,
    required this.goals,
    required this.goalsConceded,
    required this.assists,
    required this.yellowCards,
    required this.redCards,
    required this.ballsFilled,
    required this.ballsDeflated,
  });
}

class MemberDetailsPage extends StatelessWidget {
  final Member member;

  MemberDetailsPage({required this.member});

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
            Text('Temporada'),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(member.photoUrl),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              member.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              member.role,
              style: TextStyle(
                fontSize: 16,
                color: Colors.blueGrey[700],
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Estatísticas:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Icon(Icons.person, color: Colors.black), // Ícone antes de "Jogos"
                SizedBox(width: 8.0),
                Text('Jogos: ${member.games}'),
              ],
            ),
            Row(
              children: [
                Icon(Icons.sports_soccer, color: Colors.green), // Ícone antes de "Gols"
                SizedBox(width: 8.0),
                Text('Gols: ${member.goals}'),
              ],
            ),
            Row(
              children: [
                Icon(Icons.sports_soccer, color: Colors.red), // Ícone antes de "Gols Sofridos"
                SizedBox(width: 8.0),
                Text('Gols Sofridos: ${member.goalsConceded}'),
              ],
            ),
            Row(
              children: [
                Icon(Icons.check_circle, color: Colors.black), // Ícone antes de "Assistências"
                SizedBox(width: 8.0),
                Text('Assistências: ${member.assists}'),
              ],
            ),
            Row(
              children: [
                Icon(Icons.square, color: Colors.yellow), // Ícone antes de "Cartões Amarelos"
                SizedBox(width: 8.0),
                Text('Cartões Amarelos: ${member.yellowCards}'),
              ],
            ),
            Row(
              children: [
                Icon(Icons.square, color: Colors.red), // Ícone antes de "Cartões Vermelhos"
                SizedBox(width: 8.0),
                Text('Cartões Vermelhos: ${member.redCards}'),
              ],
            ),
            Row(
              children: [
                Icon(Icons.sports_soccer, color: Colors.black), // Ícone antes de "Bola Cheia"
                SizedBox(width: 8.0),
                Text('Bola Cheia: ${member.ballsFilled}'),
              ],
            ),
            Row(
              children: [
                Icon(Icons.sports_soccer, color: Colors.black38), // Ícone antes de "Bola Murcha"
                SizedBox(width: 8.0),
                Text('Bola Murcha: ${member.ballsDeflated}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
