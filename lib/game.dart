import 'package:flutter/material.dart';
// import 'package:flutter_icons/flutter_icons.dart';

void main() {
  runApp(GamesApp());
}

class GamesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Jogos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GamesPage(),
      routes: {
        '/gameDetails': (context) => GameDetailsPage(),
      },
    );
  }
}

class GamesPage extends StatelessWidget {
  final List<Game> games = [
    Game(
      ourTeamLogoUrl: 'https://example.com/our_team_logo.png',
      ourTeamName: 'Vacilou Já Era',
      opponentTeamLogoUrl: 'https://example.com/opponent_team_logo.png',
      opponentTeamName: 'Red Bull Contagem',
      ourTeamGoals: 2,
      opponentTeamGoals: 1,
      date: '20/05/2023',
      time: '14:30',
      location: 'aaaa',
      playersPresent: ['Jogador 1', 'Jogador 2', 'Jogador 3'],
      goalsScored: ['Jogador 1', 'Jogador 2'],
      assists: ['Jogador 3'],
      yellowCards: ['Jogador 1'],
      redCards: ['Jogador 2'],
      goalsConceded: ['Jogador 3'],
    ),
    Game(
      ourTeamLogoUrl: 'https://example.com/our_team_logo.png',
      ourTeamName: 'Vacilou Já Era',
      opponentTeamLogoUrl: 'https://example.com/opponent_team_logo.png',
      opponentTeamName: 'Red Bull',
      ourTeamGoals: 3,
      opponentTeamGoals: 0,
      date: '22/05/2023',
      time: '16:00',
      location: 'Estádio Y',
      playersPresent: ['Jogador 1', 'Jogador 2', 'Jogador 3', 'Jogador 4'],
      goalsScored: ['Jogador 1', 'Jogador 2', 'Jogador 3'],
      assists: ['Jogador 4'],
      yellowCards: [],
      redCards: [],
      goalsConceded: [],
    ),
    // Adicione mais jogos aqui
  ];

  String getInitials(String name) {
    List<String> words = name.split(' ');
    String initials = '';
    for (String word in words) {
      if (word.isNotEmpty) {
        initials += word[0];
      }
    }
    return initials;
  }

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
            Text('Jogos'),
          ],
        ),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20.0), // Espaço abaixo da AppBar
        child: ListView.separated(
          itemCount: games.length,
          separatorBuilder: (context, index) => SizedBox(height: 20.0),
          itemBuilder: (context, index) {
            final game = games[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(game.ourTeamLogoUrl),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    game.ourTeamName.length > 15
                        ? getInitials(game.ourTeamName)
                        : game.ourTeamName,
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    '${game.ourTeamGoals} X ${game.opponentTeamGoals}',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    game.opponentTeamName.length > 15
                        ? getInitials(game.opponentTeamName)
                        : game.opponentTeamName,
                  ),
                ],
              ),

              trailing: CircleAvatar(
                backgroundImage: NetworkImage(game.opponentTeamLogoUrl),
              ),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 8.0),
                  Text('Data: ${game.date}'),
                  SizedBox(height: 5.0),
                  Text('Hora: ${game.time}'),
                  SizedBox(height: 5.0),
                  Text('Local: ${game.location}'),

                ],
              ),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/gameDetails',
                  arguments: game,
                );
              },
            );
          },
        ),
      ),
    );
  }
}


class GameDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Game game = ModalRoute.of(context)!.settings.arguments as Game;

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
            Text('Jogo'),
          ],
        ),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(game.ourTeamLogoUrl),
                  radius: 40.0,
                ),
                SizedBox(width: 16.0),
                Text('${game.ourTeamGoals} X ${game.opponentTeamGoals}', style: TextStyle(fontSize: 24.0)),
                SizedBox(width: 16.0),
                CircleAvatar(
                  backgroundImage: NetworkImage(game.opponentTeamLogoUrl),
                  radius: 40.0,
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Text('Data: ${game.date}'),
            SizedBox(height: 10.0),
            Text('Hora: ${game.time}'),
            SizedBox(height: 10.0),
            Text('Local: ${game.location}'),
            SizedBox(height: 20.0),
            Expanded(
              child: DefaultTabController(
                length: 6, // Número de itens do submenu
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TabBar(
                      indicatorColor: Colors.green,
                      tabs: [
                        Tab(
                          icon: Icon(Icons.person, color: Colors.black)
                        ),
                        Tab(
                          icon: Icon(Icons.sports_soccer, color: Colors.green)
                        ),
                        Tab(
                          icon: Icon(Icons.check_circle, color: Colors.black)
                        ),
                        Tab(
                            icon: Icon(Icons.square, color: Colors.yellow)
                        ),
                        Tab(
                            icon: Icon(Icons.square, color: Colors.red)
                        ),
                        Tab(
                            icon: Icon(Icons.sports_soccer, color: Colors.red)
                        ),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          PlayerList(players: game.playersPresent),
                          PlayerList(players: game.goalsScored),
                          PlayerList(players: game.assists),
                          PlayerList(players: game.yellowCards),
                          PlayerList(players: game.redCards),
                          PlayerList(players: game.goalsConceded),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlayerList extends StatelessWidget {
  final List<String> players;

  PlayerList({required this.players});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: players.length,
      itemBuilder: (context, index) {
        final player = players[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage('https://example.com/player_avatar.png'), // Substitua pela URL real da imagem do jogador
          ),
          title: Text(player),
          subtitle: Text('${getPlayerFunction(player)}'), // Substitua pela função real do jogador
        );
      },
    );
  }

  String getPlayerFunction(String playerName) {
    // Lógica para obter a função do jogador com base no nome
    return 'Função do Jogador';
  }
}

class Game {
  final String ourTeamLogoUrl;
  final String ourTeamName;




  final String opponentTeamLogoUrl;
  final String opponentTeamName;
  final int ourTeamGoals;
  final int opponentTeamGoals;
  final String date;
  final String time;
  final String location;
  final List<String> playersPresent;
  final List<String> goalsScored;
  final List<String> assists;
  final List<String> yellowCards;
  final List<String> redCards;
  final List<String> goalsConceded;

  Game({
    required this.ourTeamLogoUrl,
    required this.ourTeamName,
    required this.opponentTeamLogoUrl,
    required this.opponentTeamName,
    required this.ourTeamGoals,
    required this.opponentTeamGoals,
    required this.date,
    required this.time,
    required this.location,
    required this.playersPresent,
    required this.goalsScored,
    required this.assists,
    required this.yellowCards,
    required this.redCards,
    required this.goalsConceded,
  });
}
