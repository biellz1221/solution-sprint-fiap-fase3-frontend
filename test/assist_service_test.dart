import 'dart:convert';
import 'dart:io';

import 'package:abc_tech_app/model/assist.dart';
import 'package:abc_tech_app/provider/assist_provider.dart';
import 'package:abc_tech_app/service/assist_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get_connect.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'assist_service_test.mocks.dart';

@GenerateMocks([AssistProviderInterface])
void main() {
  late AssistService service;
  late MockAssistProviderInterface provider;
  setUp(() async {
    provider = MockAssistProviderInterface();
    service = await AssistService().init(provider);
    var json =
        File("${Directory.current.path}/test/resources/assist_response.json")
            .readAsStringSync();
    when(provider.getAssist()).thenAnswer((_) async => Future.sync(
        () => Response(statusCode: HttpStatus.ok, body: jsonDecode(json))));
  });

  test('test assist service', () async {
    List<Assist> response = await service.getAssists();
    expect(response.length, 4);
  });

  test('test assist 1', () async {
    List<Assist> response = await service.getAssists();
    expect(response[0].id, 1);
    expect(response[0].name, "Manutenção 1");
  });
}
