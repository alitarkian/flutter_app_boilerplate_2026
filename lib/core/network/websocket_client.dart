import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

@lazySingleton
class WebSocketClient {
  WebSocketChannel? _channel;

  bool get isConnected => _channel != null;

  void connect(
    String url,
  ) {
    _channel = WebSocketChannel.connect(
      Uri.parse(url),
    );
  }

  Stream<dynamic> get stream {
    if (_channel == null) {
      throw Exception(
        'WebSocket is not connected.',
      );
    }

    return _channel!.stream;
  }

  void send(
    Map<String, dynamic> data,
  ) {
    _channel?.sink.add(
      jsonEncode(data),
    );
  }

  Future<void> disconnect() async {
    await _channel?.sink.close();

    _channel = null;
  }
}