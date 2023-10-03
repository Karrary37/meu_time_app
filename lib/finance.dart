import 'package:flutter/material.dart';

void main() {
  runApp(FinanceApp());
}

class FinanceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Financeiro',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FinancePage(),
    );
  }
}

class FinancePage extends StatelessWidget {
  final List<GameTransaction> transactions = [
    GameTransaction(
      gameName: 'Nosso Time x Time Adversário',
      income: 300.0,
      expense: 250.0,
    ),
    GameTransaction(
      gameName: 'Nosso Time x Time Adversário',
      income: 325.0,
      expense: 300.0,
    ),
    // Adicione mais transações aqui
  ];

  @override
  Widget build(BuildContext context) {
    double totalIncome = 0.0;
    double totalExpense = 0.0;

    for (var transaction in transactions) {
      totalIncome += transaction.income;
      totalExpense += transaction.expense;
    }

    List<DataRow> rows = transactions.map((transaction) {
      return DataRow(
        cells: [
          DataCell(Text(transaction.gameName)),
          DataCell(Text('R\$ ${transaction.income}')),
          DataCell(Text('R\$ ${transaction.expense}')),
        ],
      );
    }).toList();

    rows.add(DataRow(
      cells: [
        DataCell(Text('Total de Entrada', style: TextStyle(fontWeight: FontWeight.bold))),
        DataCell(Text('R\$ $totalIncome', style: TextStyle(fontWeight: FontWeight.bold))),
        DataCell(Text('')),
      ],
    ));

    rows.add(DataRow(
      cells: [
        DataCell(Text('Total de Saída', style: TextStyle(fontWeight: FontWeight.bold))),
        DataCell(Text('')),
        DataCell(Text('R\$ $totalExpense', style: TextStyle(fontWeight: FontWeight.bold))),
      ],
    ));

    double balance = totalIncome - totalExpense;

    rows.add(DataRow(
      cells: [
        DataCell(Text('Saldo do Caixa', style: TextStyle(fontWeight: FontWeight.bold))),
        DataCell(Text('')),
        DataCell(
          Text(
            'R\$ $balance',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: balance >= 0 ? Colors.green : Colors.red,
            ),
          ),
        ),
      ],
    ));

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
            Text('Financeiro'),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: DataTable(
          columns: [
            DataColumn(label: Text('Jogo')),
            DataColumn(label: Text('Entrada')),
            DataColumn(label: Text('Saída')),
          ],
          rows: rows,
        ),
      ),
    );
  }
}

class GameTransaction {
  final String gameName;
  final double income;
  final double expense;

  GameTransaction({
    required this.gameName,
    required this.income,
    required this.expense,
  });
}