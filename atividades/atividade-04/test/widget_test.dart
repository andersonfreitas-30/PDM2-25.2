import 'package:flutter/material.dart';

void main() => runApp(MeuApp());
class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu App Flutter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int contador = 0;

  void incrementar() => setState(() => contador++);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exemplo: embarcar no Android'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Você apertou o botão:', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('$contador', style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text('Olá!'),
                    content: Text('Este é um app Flutter rodando nativo no Android.'),
                    actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text('Fechar'))],
                  ),
                );
              },
              icon: Icon(Icons.phone_android),
              label: Text('Mostrar diálogo'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: incrementar,
        tooltip: 'Incrementar',
        child: Icon(Icons.add),
      ),
    );
  }
}
