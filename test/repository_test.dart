import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_platform_interface/in_memory_shared_preferences_async.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_async_platform_interface.dart';
import 'package:my_blood/data/repository.dart';
import 'package:my_blood/domain/campaign.dart';

void main() {
  setUp(() {
    SharedPreferencesAsyncPlatform.instance =
        InMemorySharedPreferencesAsync.empty();
  });
  test(
    'local adapter persists campaigns, bookmarks and language across instances',
    () async {
      final c = Campaign(
        id: 'local-test',
        title: 'Campanha de exemplo',
        city: 'Campinas',
        state: 'SP',
        blood: 'O-',
        locationId: 'campinas',
        description: 'Uma descrição sintética de exemplo.',
        local: true,
      );
      await LocalCampaignRepository().save(
        DemoData(campaigns: [c], saved: {c.id}, english: true),
      );
      final restored = await LocalCampaignRepository().load();
      expect(restored.campaigns.single.toMap(), c.toMap());
      expect(restored.saved, {c.id});
      expect(restored.english, isTrue);
      await LocalCampaignRepository().clear();
      expect((await LocalCampaignRepository().load()).campaigns.length, 4);
    },
  );
  test('corrupt storage fails visibly without overwriting it', () async {
    final prefs = SharedPreferencesAsync();
    await prefs.setString(LocalCampaignRepository.storageKey, 'broken json');
    await expectLater(LocalCampaignRepository().load(), throwsFormatException);
    expect(
      await prefs.getString(LocalCampaignRepository.storageKey),
      'broken json',
    );
  });
  test('unknown schema and duplicate ids are rejected', () {
    final map = DemoData.initial().toMap();
    expect(
      () => DemoData.fromMap({...map, 'version': 2}),
      throwsFormatException,
    );
    expect(
      () => DemoData.fromMap({
        ...map,
        'campaigns': [seedCampaigns.first.toMap(), seedCampaigns.first.toMap()],
      }),
      throwsFormatException,
    );
    expect(
      DemoData.fromMap(jsonDecode(jsonEncode(map)) as Map<String, dynamic>)
          .campaigns
          .length,
      4,
    );
  });
}
