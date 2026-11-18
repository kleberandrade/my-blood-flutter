import 'package:flutter_test/flutter_test.dart';
import 'package:my_blood/domain/campaign.dart';

void main() {
  test('filters combine state, city, blood and accent-insensitive search', () {
    expect(
      filterCampaigns(
        seedCampaigns,
        state: 'SP',
        city: 'Campinas',
        blood: 'O+',
      ).length,
      1,
    );
    expect(
      filterCampaigns(seedCampaigns, state: 'RJ', city: 'Campinas'),
      isEmpty,
    );
    expect(filterCampaigns(seedCampaigns, query: 'sao paulo').length, 1);
    expect(filterCampaigns(seedCampaigns, blood: 'AB-').length, 1);
  });
  test('campaign rejects malformed input and survives serialization', () {
    final c = seedCampaigns.first;
    expect(Campaign.fromMap(c.toMap()).toMap(), c.toMap());
    expect(
      () => Campaign(
        id: 'x',
        title: '',
        city: 'X',
        state: 'SP',
        blood: 'O+',
        locationId: 'campinas',
        description: 'Demo',
      ),
      throwsFormatException,
    );
    expect(
      () => Campaign.fromMap({...c.toMap(), 'blood': 'Z+'}),
      throwsFormatException,
    );
    expect(
      () => Campaign.fromMap({...c.toMap(), 'locationId': 'unknown'}),
      throwsFormatException,
    );
    expect(c.shareText, contains('DEMO'));
    expect(c.shareText, isNot(contains('https://')));
  });
}
