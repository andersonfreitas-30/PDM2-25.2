import 'dart:async';
import 'dart:io';
import 'dart:math';

Future<void> main() async {
  final socket = await Socket.connect('127.0.0.1', 4040);
  print('📡 Sensor IoT conectado ao servidor!\n');

  final random = Random();

  Timer.periodic(Duration(seconds: 10), (timer) {
    final temperatura = 20 + random.nextInt(10);
    final mensagem = 'Temperatura: $temperatura°C';
    socket.writeln(mensagem);
    print('🌡️ Enviando leitura -> $mensagem');
  });
}
