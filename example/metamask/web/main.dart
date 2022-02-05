import 'dart:convert';
import 'dart:html';
import 'dart:typed_data';

import 'package:web3_dart/browser.dart';
import 'package:web3_dart/web3_dart.dart';

Future<void> main() async {
  final eth = window.ethereum;
  if (eth == null) {
    print('MetaMask is not available');
    return;
  }

  final client = Web3Client.custom(eth.asRpcService());
  final credentials = await eth.requestAccount();

  print('Using ${credentials.address}');
  print('Client is listening: ${await client.isListeningForNetwork()}');

  final message = Uint8List.fromList(utf8.encode('Hello from web3_dart'));
  final signature = await credentials.signPersonalMessage(message);
  print('Signature: ${base64.encode(signature)}');
}
