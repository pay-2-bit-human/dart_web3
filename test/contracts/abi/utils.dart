import 'dart:typed_data';

import 'package:dart_web3/contracts.dart';
import 'package:dart_web3/crypto.dart';
import 'package:dart_web3/src/utils/length_tracking_byte_sink.dart';
import 'package:test/test.dart';

void expectEncodes<T>(AbiType<T> type, T data, String encoded) {
  final buffer = LengthTrackingByteSink();
  type.encode(data, buffer);

  expect(bytesToHex(buffer.asBytes(), include0x: false), encoded);
}

ByteBuffer bufferFromHex(String hex) {
  return hexToBytes(hex).buffer;
}
