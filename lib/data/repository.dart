import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../domain/campaign.dart';

class DemoData {
  final List<Campaign> campaigns;
  final Set<String> saved;
  final bool english;
  DemoData({
    required this.campaigns,
    required this.saved,
    this.english = false,
  });
  Map<String, dynamic> toMap() => {
    'version': 1,
    'campaigns': campaigns.map((c) => c.toMap()).toList(),
    'saved': saved.toList(),
    'english': english,
  };
  factory DemoData.initial() =>
      DemoData(campaigns: [...seedCampaigns], saved: {});
  factory DemoData.fromMap(Map<String, dynamic> map) {
    if (map['version'] != 1) {
      throw const FormatException('Unknown storage version');
    }
    final campaigns = (map['campaigns'] as List)
        .map((c) => Campaign.fromMap(Map<String, dynamic>.from(c as Map)))
        .toList();
    if (campaigns.map((c) => c.id).toSet().length != campaigns.length) {
      throw const FormatException('Duplicate campaigns');
    }
    final saved = (map['saved'] as List).cast<String>().toSet();
    if (!saved.every((id) => campaigns.any((c) => c.id == id))) {
      throw const FormatException('Unknown saved campaign');
    }
    return DemoData(
      campaigns: campaigns,
      saved: saved,
      english: map['english'] as bool,
    );
  }
}

abstract interface class CampaignRepository {
  Future<DemoData> load();
  Future<void> save(DemoData data);
  Future<void> clear();
}

class LocalCampaignRepository implements CampaignRepository {
  static const storageKey = 'my_blood_demo_v1';
  final SharedPreferencesAsync preferences;
  LocalCampaignRepository({SharedPreferencesAsync? preferences})
    : preferences = preferences ?? SharedPreferencesAsync();
  @override
  Future<DemoData> load() async {
    final raw = await preferences.getString(storageKey);
    return raw == null
        ? DemoData.initial()
        : DemoData.fromMap(jsonDecode(raw) as Map<String, dynamic>);
  }

  @override
  Future<void> save(DemoData data) =>
      preferences.setString(storageKey, jsonEncode(data.toMap()));
  @override
  Future<void> clear() => preferences.remove(storageKey);
}
