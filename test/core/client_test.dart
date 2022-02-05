import 'package:test/test.dart';
import 'package:web3_dart/web3_dart.dart';

import '../mock_client.dart';

void main() {
  test('getClientVersion', () async {
    final client = MockClient(expectAsync2((method, data) {
      expect(method, 'web3_clientVersion');
      return 'dart-web3_dart-test';
    }));
    final web3 = Web3Client('', client);
    addTearDown(web3.dispose);

    expect(web3.getClientVersion(), completion('dart-web3_dart-test'));
  });
}
