import 'dart:io';

Future<void> main() async {
  final server = await ServerSocket.bind('127.0.0.1', 4040);
  print('🖥️ Servidor IoT iniciado na porta 4040.');
  print('Aguardando conexões de sensores...\n');

  await for (final socket in server) {
    print('✅ Sensor conectado: ${socket.remoteAddress.address}');
    socket.listen(
      (data) {
        final mensagem = String.fromCharCodes(data).trim();
        print('📥 Temperatura recebida: $mensagem');
      },
      onError: (err) => print('❌ Erro no sensor: $err'),
      onDone: () => print('🔌 Sensor desconectado.\n'),
    );
  }
}

