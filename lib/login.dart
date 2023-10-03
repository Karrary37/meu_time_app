//        PAGINA DE LOGIN

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
// import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Página de Login',
      theme: ThemeData(
        primarySwatch: Colors.green,
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.green), // Cor do rótulo
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.green), // Cor da borda quando não está em foco
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.green), // Cor da borda quando está em foco
          ),
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.green, // Cor do cursor
        ),
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/Vacilou_Ja_Era_Verde.png',
              width: 50,
              height: 50,
            ),
            SizedBox(width: 8),
            Text('Login'),
          ],
        ),
        backgroundColor: Colors.green, // Definindo a cor de fundo da AppBar como verde
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.black45), // Cor do rótulo
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black45), // Cor da borda quando não está em foco
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black45), // Cor da borda quando está em foco
                ),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Senha',
                labelStyle: TextStyle(color: Colors.black45), // Cor do rótulo
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black45), // Cor da borda quando não está em foco
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black45), // Cor da borda quando está em foco
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isObscure ? Icons.visibility_off : Icons.visibility, color: Colors.green
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                ),
              ),
              obscureText: _isObscure,
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              child: Text('Entrar'),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
              onPressed: () {
                // Lógica de autenticação aqui
                String email = _emailController.text;
                String password = _passwordController.text;
                // Realizar autenticação usando o email e senha fornecidos
                if (email.isEmpty || password.isEmpty) {
                  // Verifica se algum dos campos está vazio
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Campos vazios'),
                        content: Text('Por favor, preencha todos os campos.'),
                        actions: [
                          TextButton(
                            child: Text('Fechar'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  // Se os campos não estiverem vazios, realiza a autenticação
                  logar();
                }
              },
            ),
            SizedBox(height: 8.0),
            TextButton(
              child: Text(
                'Cadastrar',
                style: TextStyle(color: Colors.green),
              ),
              onPressed: () {
                // Lógica para redirecionar para a página de cadastro aqui
                Navigator.pushNamed(context, '/register');
              },
            ),
          ],
        ),
      ),
    );
  }

  logar() async {
    var url = 'https://backoffice-staging.happyconsig.com.br/api/auth/login/'; // substitua com a URL correta da sua API

    var response = await http.post(
      Uri.parse(url),
      body: {
        "identifier": _emailController.text,
        "password": _passwordController.text,
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      Navigator.pushReplacementNamed(context, '/dashboard');
    } else {
      // Autenticação falhou
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Falha na autenticação'),
            content: Text('Falha na autenticação, tente novamente.'),
            actions: [
              TextButton(
                child: Text('Fechar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      print('Falha na autenticação');
    }
  }
}
