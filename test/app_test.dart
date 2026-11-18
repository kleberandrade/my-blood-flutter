import 'package:material_ui/material_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_blood/data/repository.dart';
import 'package:my_blood/ui/app.dart';

class MemoryRepository implements CampaignRepository {
  DemoData value = DemoData.initial();
  bool failSave = false, failLoad = false;
  @override
  Future<DemoData> load() async {
    if (failLoad) throw StateError('read failed');
    return value;
  }

  @override
  Future<void> save(DemoData data) async {
    if (failSave) throw StateError('full');
    value = data;
  }

  @override
  Future<void> clear() async {
    value = DemoData.initial();
  }
}

void main() {
  testWidgets(
    'create validates, publishes locally, edits, and survives language change',
    (tester) async {
      tester.view.physicalSize = const Size(1400, 1100);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      final repo = MemoryRepository();
      await tester.pumpWidget(BloodApp(repository: repo));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Criar campanha demo'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Salvar nesta demonstração'));
      await tester.pumpAndSettle();
      expect(find.text('Informe ao menos 5 caracteres'), findsOneWidget);
      await tester.enterText(
        find.byType(TextFormField).first,
        'Laços da comunidade',
      );
      await tester.enterText(
        find.byType(TextFormField).last,
        'Uma campanha totalmente fictícia para o teste.',
      );
      await tester.tap(find.text('Salvar nesta demonstração'));
      await tester.pumpAndSettle();
      expect(repo.value.campaigns.first.title, 'Laços da comunidade');
      await tester.tap(find.byTooltip('Switch to English'));
      await tester.pumpAndSettle();
      expect(repo.value.english, isTrue);
      expect(repo.value.campaigns.first.title, 'Laços da comunidade');
      await tester.ensureVisible(find.text('Explore →').first);
      await tester.tap(find.text('Explore →').first);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Edit'));
      await tester.pumpAndSettle();
      await tester.enterText(
        find.byType(TextFormField).first,
        'Updated fictional campaign',
      );
      await tester.tap(find.text('Save in this demo'));
      await tester.pumpAndSettle();
      expect(repo.value.campaigns.first.title, 'Updated fictional campaign');
      expect(tester.takeException(), isNull);
    },
  );
  testWidgets(
    'mobile bookmarks persist and failed save retains previous data',
    (tester) async {
      tester.view.physicalSize = const Size(390, 844);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      final repo = MemoryRepository();
      await tester.pumpWidget(BloodApp(repository: repo));
      await tester.pumpAndSettle();
      await tester.ensureVisible(find.byTooltip('Salvar campanha').first);
      await tester.tap(find.byTooltip('Salvar campanha').first);
      await tester.pumpAndSettle();
      expect(repo.value.saved, {'seed-1'});
      repo.failSave = true;
      await tester.tap(find.byTooltip('Remover dos salvos').first);
      await tester.pumpAndSettle();
      expect(repo.value.saved, {'seed-1'});
      expect(
        find.text(
          'Não foi possível salvar. Seus dados anteriores foram mantidos.',
        ),
        findsOneWidget,
      );
      await tester.tap(find.text('Meu espaço'));
      await tester.pumpAndSettle();
      expect(find.text('Juntos pelo próximo'), findsOneWidget);
      expect(tester.takeException(), isNull);
    },
  );
  testWidgets('read failure offers explicit retry without destroying data', (
    tester,
  ) async {
    final repo = MemoryRepository()..failLoad = true;
    await tester.pumpWidget(BloodApp(repository: repo));
    await tester.pumpAndSettle();
    expect(find.text('Tentar novamente / Retry'), findsOneWidget);
    repo.failLoad = false;
    await tester.tap(find.text('Tentar novamente / Retry'));
    await tester.pumpAndSettle();
    expect(find.text('Criar campanha demo'), findsOneWidget);
  });
}
