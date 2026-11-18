import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';
import 'package:url_launcher_platform_interface/link.dart';
import 'package:my_blood/ui/app.dart';
import 'package:my_blood/ui/information_pages.dart';

import 'app_test.dart' show MemoryRepository;

class RecordingLauncher extends UrlLauncherPlatform {
  @override
  LinkDelegate? get linkDelegate => null;
  final List<String> opened = [];
  @override
  Future<bool> launchUrl(String url, LaunchOptions options) async {
    opened.add(url);
    return true;
  }
}

void main() {
  testWidgets(
    'official links resolve only to approved HTTPS sources without opening a browser',
    (tester) async {
      tester.view.physicalSize = const Size(1400, 1100);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      final old = UrlLauncherPlatform.instance;
      final recorder = RecordingLauncher();
      UrlLauncherPlatform.instance = recorder;
      addTearDown(() => UrlLauncherPlatform.instance = old);
      await tester.pumpWidget(BloodApp(repository: MemoryRepository()));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Sobre a doação'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Doação de sangue • Ministério da Saúde'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Perguntas frequentes oficiais'));
      await tester.pumpAndSettle();
      expect(recorder.opened, [officialUrl, faqUrl]);
    },
  );
  testWidgets('share preview copies demo text without dispatching a message', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(1400, 1100);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    String? copied;
    tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
      SystemChannels.platform,
      (call) async {
        if (call.method == 'Clipboard.setData') {
          copied = (call.arguments as Map)['text'] as String;
        }
        return null;
      },
    );
    addTearDown(
      () => tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
        SystemChannels.platform,
        null,
      ),
    );
    await tester.pumpWidget(BloodApp(repository: MemoryRepository()));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('Explorar →').first);
    await tester.tap(find.text('Explorar →').first);
    await tester.pumpAndSettle();
    final semantics = tester.ensureSemantics();
    await tester.tap(find.text('Prévia de compartilhamento'));
    await tester.pumpAndSettle();
    expect(
      find.bySemanticsLabel(RegExp(r'\[DEMO • SYNTHETIC DATA\]')),
      findsOneWidget,
    );
    semantics.dispose();
    expect(copied, isNull);
    await tester.tap(find.text('Copiar texto demo'));
    await tester.pumpAndSettle();
    expect(copied, contains('[DEMO • SYNTHETIC DATA]'));
    expect(copied, contains('Fictional campaign'));
    expect(copied, isNot(contains('https://')));
  });
}
