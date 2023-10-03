import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'game.dart';

void main() {
  runApp(GamesApp());
}

class GamesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stastistica',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StatisticsPage(),
    );
  }
}

class StatisticsPage extends StatelessWidget {
  final List<Game> games = [
    Game(
      ourTeamLogoUrl: 'https://example.com/our_team_logo.png',
      ourTeamName: 'Nosso Time',
      opponentTeamLogoUrl: 'https://example.com/opponent_team_logo.png',
      opponentTeamName: 'Time Adversário',
      ourTeamGoals: 2,
      opponentTeamGoals: 1,
      date: '20/05/2023',
      time: '14:30',
      location: 'Estádio X',
      playersPresent: ['Jogador 1', 'Jogador 2', 'Jogador 3'],
      goalsScored: ['Jogador 1'],
      assists: ['Jogador 3'],
      yellowCards: ['Jogador 1', 'Jogador 1'],
      redCards: ['Jogador 2'],
      goalsConceded: ['Jogador 3'],
    ),
    Game(
      ourTeamLogoUrl: 'https://example.com/our_team_logo.png',
      ourTeamName: 'Nosso Time',
      opponentTeamLogoUrl: 'https://example.com/opponent_team_logo.png',
      opponentTeamName: 'Time Adversário',
      ourTeamGoals: 0,
      opponentTeamGoals: 3,
      date: '22/05/2023',
      time: '16:00',
      location: 'Estádio Y',
      playersPresent: ['Jogador 1', 'Jogador 2', 'Jogador 3', 'Jogador 4'],
      goalsScored: ['Jogador 1', 'Jogador 2', 'Jogador 3'],
      assists: ['Jogador 4'],
      yellowCards: ['Jogador 1', 'Jogador 3'],
      redCards: [],
      goalsConceded: [],
    ),
    Game(
      ourTeamLogoUrl: 'https://example.com/our_team_logo.png',
      ourTeamName: 'Nosso Time',
      opponentTeamLogoUrl: 'https://example.com/opponent_team_logo.png',
      opponentTeamName: 'Time Adversário',
      ourTeamGoals: 0,
      opponentTeamGoals: 3,
      date: '22/05/2023',
      time: '16:00',
      location: 'Estádio Y',
      playersPresent: ['Jogador 1', 'Jogador 2', 'Jogador 3', 'Jogador 4'],
      goalsScored: ['Jogador 1', 'Jogador 2', 'Jogador 3'],
      assists: ['Jogador 4'],
      yellowCards: ['Jogador 1', 'Jogador 3'],
      redCards: [],
      goalsConceded: [],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // Calculating statistics
    int victories = 0;
    int defeats = 0;
    Map<String, int> goalsCount = {};
    Map<String, int> assistsCount = {};
    Map<String, int> cardsYellow = {};
    Map<String, int> cardsRed = {};

    for (final game in games) {
      if (game.ourTeamGoals > game.opponentTeamGoals) {
        victories++;
      } else {
        defeats++;
      }

      for (final player in game.goalsScored) {
        if (goalsCount.containsKey(player)) {
          goalsCount[player] = goalsCount[player]! + 1;
        } else {
          goalsCount[player] = 1;
        }
      }

      for (final player in game.assists) {
        if (assistsCount.containsKey(player)) {
          assistsCount[player] = assistsCount[player]! + 1;
        } else {
          assistsCount[player] = 1;
        }
      }

      for (final player in game.yellowCards) {
        if (cardsYellow.containsKey(player)) {
          cardsYellow[player] = cardsYellow[player]! + 1;
        } else {
          cardsYellow[player] = 1;
        }
      }

      for (final player in game.redCards) {
        if (cardsRed.containsKey(player)) {
          cardsRed[player] = cardsRed[player]! + 1;
        } else {
          cardsRed[player] = 1;
        }
      }
    }

    // Sorting players by goals count
    List<PlayerStatistic> topScorers = goalsCount.entries
        .map((entry) => PlayerStatistic(
      player: entry.key,
      goals: entry.value,
    ))
        .toList();
    topScorers.sort((a, b) => b.goals.compareTo(a.goals));

    // Sorting players by cards count
    List<PlayerStatistic> cardLeadersYellow = cardsYellow.entries
        .map((entry) => PlayerStatistic(
      player: entry.key,
      cards: entry.value,
    ))
        .toList();
    cardLeadersYellow.sort((a, b) => b.cards.compareTo(a.cards));


    // Sorting players by cards count
    List<PlayerStatistic> cardLeadersRed = cardsRed.entries
        .map((entry) => PlayerStatistic(
      player: entry.key,
      cards: entry.value,
    ))
        .toList();
    cardLeadersRed.sort((a, b) => b.cards.compareTo(a.cards));


    // Sorting players by cards count
    List<PlayerStatistic> topAssists = assistsCount.entries
        .map((entry) => PlayerStatistic(
      player: entry.key,
      assists: entry.value,
    ))
        .toList();
    topAssists.sort((a, b) => b.assists.compareTo(a.assists));


    // Create chart series for victories
    final victorySeries = [
      charts.Series<PlayerStatistic, String>(
        id: 'Victories',
        data: [
          PlayerStatistic(player: 'Vitórias', goals: victories),
          PlayerStatistic(player: 'Derrotas', goals: defeats),
        ],
        domainFn: (PlayerStatistic player, _) => player.player,
        measureFn: (PlayerStatistic player, _) => player.goals,
      ),
    ];

    // Create chart series for top goal scorers
    final topScorersSeries = [
      charts.Series<PlayerStatistic, String>(
        id: 'TopScorers',
        data: topScorers,
        domainFn: (PlayerStatistic player, _) => player.player,
        measureFn: (PlayerStatistic player, _) => player.goals,
      ),
    ];


    final cardYellowSeries = [
      charts.Series<PlayerStatistic, String>(
        id: 'cardLeadersYellow',
        data: cardLeadersYellow,
        domainFn: (PlayerStatistic player, _) => player.player,
        measureFn: (PlayerStatistic player, _) => player.cards,
      ),
    ];

    final cardRedSeries = [
      charts.Series<PlayerStatistic, String>(
        id: 'cardLeadersRed',
        data: cardLeadersRed,
        domainFn: (PlayerStatistic player, _) => player.player,
        measureFn: (PlayerStatistic player, _) => player.cards,
      ),
    ];

    final AssistsSeries = [
      charts.Series<PlayerStatistic, String>(
        id: 'topAssists',
        data: topAssists,
        domainFn: (PlayerStatistic player, _) => player.player,
        measureFn: (PlayerStatistic player, _) => player.assists,
      ),
    ];


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
            Text('Estatística'),
          ],
        ),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(16.0),
                height: 200,
                child: Column(
                  children: [
                    Text(
                      'Derrotas $defeats x $victories Vitórias',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: charts.PieChart(
                        victorySeries,
                        animate: true,
                      ),
                    ),
                  ],
                ),
              ),

              // Add the chart widget for top scorers
              Container(
                padding: EdgeInsets.all(16.0),
                height: 200,
                child: Column(
                  children: [
                    Text(
                      'Artilheiros',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: charts.BarChart(
                        topScorersSeries,
                        animate: true,
                      ),
                    ),
                  ],
                ),
              ),


              // Add the chart widget for top scorers
              Container(
                padding: EdgeInsets.all(16.0),
                height: 200,
                child: Column(
                  children: [
                    Text(
                      'Assistencias',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: charts.BarChart(
                        AssistsSeries,
                        animate: true,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.all(16.0),
                height: 200,
                child: Column(
                  children: [
                    Text(
                      'Cartoes Amarelos',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: charts.BarChart(
                        cardYellowSeries,
                        animate: true,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.all(16.0),
                height: 200,
                child: Column(
                  children: [
                    Text(
                      'Cartoes Vermelhos',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: charts.BarChart(
                        cardRedSeries,
                        animate: true,
                      ),
                    ),
                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );

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

class PlayerStatistic {
  final String player;
  final int goals;
  final int cards;
  final int assists;

  PlayerStatistic({
    required this.player,
    this.goals = 0,
    this.cards = 0,
    this.assists = 0,
  });
}

