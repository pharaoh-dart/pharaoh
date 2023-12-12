import 'package:pharaoh/pharaoh.dart';
import 'package:spookie/spookie.dart';

void main() {
  group('pharaoh_core', () {
    test('should initialize without onError callback', () async {
      final app = Pharaoh()
        ..get('/', (req, res) => throw ArgumentError('Some weird error'));

      await (await request(app))
          .get('/')
          .expectStatus(500)
          .expectBody({'error': "Invalid argument(s): Some weird error"}).test();
    });
  });
}
