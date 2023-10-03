import 'package:flutter/material.dart';

void main() {
  runApp(MembersApp());
}

class MembersApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Membros',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MembersPage(),
    );
  }
}

class MembersPage extends StatelessWidget {
  final List<Member> members = [
    Member(
      photoUrl: 'https://example.com/member1.jpg',
      name: 'John Doe',
      role: 'Diretor',
    ),
    Member(
      photoUrl: 'https://example.com/member2.jpg',
      name: 'Jane Smith',
      role: 'Zagueiro',
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
            Text('Membros'),
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
              // Lógica para exibir detalhes do membro ou navegar para outra página
              Navigator.pushNamed(context, '/member-detail');
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

  Member({
    required this.photoUrl,
    required this.name,
    required this.role,
  });
}