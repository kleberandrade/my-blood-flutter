import 'package:material_ui/material_ui.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/repository.dart';
import '../domain/campaign.dart';
import 'campaign_editor.dart';
import 'language_button.dart';
import 'common.dart';
import 'information_pages.dart';

const ink = Color(0xff302529);
const red = Color(0xffb83249);
const paper = Color(0xfffaf8f5);

class BloodApp extends StatefulWidget {
  final CampaignRepository repository;
  const BloodApp({super.key, required this.repository});
  @override
  State<BloodApp> createState() => _BloodAppState();
}

class _BloodAppState extends State<BloodApp> {
  DemoData? data;
  bool failed = false, busy = false;
  int page = 0;
  String state = '', city = '', blood = '', query = '';
  final search = TextEditingController();
  bool get en => data?.english ?? false;
  String t(String pt, String english) => en ? english : pt;
  final messenger = GlobalKey<ScaffoldMessengerState>();
  @override
  void initState() {
    super.initState();
    load();
  }

  @override
  void dispose() {
    search.dispose();
    super.dispose();
  }

  Future<void> load() async {
    setState(() => failed = false);
    try {
      final result = await widget.repository.load();
      if (mounted) setState(() => data = result);
    } catch (_) {
      if (mounted) setState(() => failed = true);
    }
  }

  void notice(String text) =>
      messenger.currentState?.showSnackBar(SnackBar(content: Text(text)));
  Future<bool> commit(DemoData next) async {
    if (busy) return false;
    setState(() => busy = true);
    try {
      await widget.repository.save(next);
      if (mounted) setState(() => data = next);
      return true;
    } catch (_) {
      notice(
        t(
          'Não foi possível salvar. Seus dados anteriores foram mantidos.',
          'Could not save. Your previous data was kept.',
        ),
      );
      return false;
    } finally {
      if (mounted) setState(() => busy = false);
    }
  }

  Future<void> language() async {
    final d = data!;
    await commit(
      DemoData(campaigns: d.campaigns, saved: d.saved, english: !en),
    );
  }

  Future<void> saveCampaign(Campaign c) async {
    final d = data!;
    final saved = {...d.saved};
    saved.contains(c.id) ? saved.remove(c.id) : saved.add(c.id);
    await commit(DemoData(campaigns: d.campaigns, saved: saved, english: en));
  }

  Future<void> edit(BuildContext context, [Campaign? campaign]) async {
    final result = await showDialog<Campaign>(
      context: context,
      builder: (_) => CampaignEditor(campaign: campaign, english: en),
    );
    if (result == null || !mounted) return;
    final next = [...data!.campaigns];
    final index = next.indexWhere((c) => c.id == result.id);
    index < 0 ? next.insert(0, result) : next[index] = result;
    if (await commit(
      DemoData(campaigns: next, saved: data!.saved, english: en),
    )) {
      notice(
        t(
          'Campanha salva somente neste navegador.',
          'Campaign saved only in this browser.',
        ),
      );
    }
  }

  Future<void> openOfficial(String url) async {
    try {
      if (!await launchUrl(
        Uri.parse(url),
        mode: LaunchMode.externalApplication,
      )) {
        throw StateError('No launcher');
      }
    } catch (_) {
      notice(
        t(
          'Não foi possível abrir a fonte. Tente novamente.',
          'Could not open the source. Please try again.',
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
    scaffoldMessengerKey: messenger,
    debugShowCheckedModeBanner: false,
    title: 'My Blood • Community',
    locale: Locale(en ? 'en' : 'pt', en ? 'GB' : 'BR'),
    supportedLocales: const [Locale('pt', 'BR'), Locale('en', 'GB')],
    localizationsDelegates: GlobalMaterialLocalizations.delegates,
    theme: ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: paper,
      colorScheme: ColorScheme.fromSeed(
        seedColor: red,
        primary: red,
        surface: paper,
      ),
      textTheme: ThemeData.light().textTheme.apply(
        bodyColor: ink,
        displayColor: ink,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 18,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xffddd6d3)),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size(48, 50),
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(minimumSize: const Size(48, 48)),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(minimumSize: const Size(48, 48)),
      ),
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: Color(0xffe9e3e0)),
        ),
      ),
    ),
    home: Builder(
      builder: (context) {
        final wide =
            MediaQuery.sizeOf(context).width >= 950 &&
            MediaQuery.textScalerOf(context).scale(1) < 1.3;
        final brand = const Text(
          'my blood',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 25,
            letterSpacing: -1,
          ),
        );
        return Scaffold(
          bottomNavigationBar: wide || data == null
              ? null
              : NavigationBar(
                  selectedIndex: page,
                  onDestinationSelected: (v) => setState(() => page = v),
                  destinations: destinations(),
                ),
          body: SafeArea(
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(color: Color(0xffe9e3e0)),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: wide ? 40 : 20,
                    vertical: 14,
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: red,
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: const Icon(
                          Icons.bloodtype_rounded,
                          color: Colors.white,
                          size: 27,
                        ),
                      ),
                      const SizedBox(width: 12),
                      if (wide) brand else Expanded(child: brand),
                      if (wide) ...[
                        const SizedBox(width: 48),
                        ...List.generate(
                          4,
                          (i) => Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: TextButton(
                              onPressed: data == null
                                  ? null
                                  : () => setState(() => page = i),
                              style: TextButton.styleFrom(
                                foregroundColor: page == i ? red : ink,
                                backgroundColor: page == i
                                    ? const Color(0xffffeef0)
                                    : null,
                              ),
                              child: Text(labels()[i]),
                            ),
                          ),
                        ),
                      ],
                      if (wide) const Spacer(),
                      if (data != null)
                        LanguageButton(
                          english: en,
                          onPressed: busy ? () {} : language,
                        ),
                    ],
                  ),
                ),
                if (busy) const LinearProgressIndicator(minHeight: 2),
                Expanded(
                  child: data == null
                      ? loading(context)
                      : SingleChildScrollView(
                          child: Center(
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 1240),
                              child: Padding(
                                padding: EdgeInsets.all(wide ? 40 : 20),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.science_outlined,
                                          size: 17,
                                          color: red,
                                        ),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          child: Text(
                                            t(
                                              'MODO DEMONSTRAÇÃO • DADOS SINTÉTICOS',
                                              'DEMONSTRATION MODE • SYNTHETIC DATA',
                                            ),
                                            style: const TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w700,
                                              letterSpacing: 1.3,
                                              color: red,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 24),
                                    switch (page) {
                                      0 => catalog(context),
                                      1 => LocationsPage(
                                        english: en,
                                        onOpen: openOfficial,
                                      ),
                                      2 => DonationInformationPage(
                                        english: en,
                                        onOpen: openOfficial,
                                      ),
                                      _ => profilePage(context),
                                    },
                                    const SizedBox(height: 40),
                                    const Divider(),
                                    const SizedBox(height: 16),
                                    Text(
                                      t(
                                        'Feito para conectar a comunidade. Nenhuma campanha é real.',
                                        'Made to connect the community. No campaign is real.',
                                      ),
                                      style: const TextStyle(
                                        color: Color(0xff71656a),
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
  List<String> labels() => [
    t('Campanhas', 'Campaigns'),
    t('Locais', 'Locations'),
    t('Sobre a doação', 'About donation'),
    t('Meu espaço', 'My space'),
  ];
  List<NavigationDestination> destinations() => [
    for (final (i, icon) in [
      Icons.grid_view_rounded,
      Icons.location_on_outlined,
      Icons.favorite_outline,
      Icons.person_outline,
    ].indexed)
      NavigationDestination(icon: Icon(icon), label: labels()[i]),
  ];
  Widget loading(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: failed
            ? [
                const Icon(Icons.cloud_off_rounded, size: 48, color: red),
                const SizedBox(height: 16),
                const Text(
                  'Não foi possível ler os dados locais. / Could not read local data.',
                ),
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: load,
                  child: const Text('Tentar novamente / Retry'),
                ),
                TextButton(
                  onPressed: () => reset(context),
                  child: const Text('Apagar dados locais / Clear local data'),
                ),
              ]
            : [
                const CircularProgressIndicator(),
                const SizedBox(height: 16),
                const Text('Carregando demonstração / Loading demo'),
              ],
      ),
    ),
  );
  Widget catalog(BuildContext context) {
    final visible = filterCampaigns(
      data!.campaigns,
      state: state,
      city: city,
      blood: blood,
      query: query,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: const Color(0xff522332),
            borderRadius: BorderRadius.circular(24),
          ),
          child: LayoutBuilder(
            builder: (context, c) => Stack(
              children: [
                if (c.maxWidth > 650)
                  Positioned(
                    right: -40,
                    top: -55,
                    child: Transform.rotate(
                      angle: -.2,
                      child: Icon(
                        Icons.bloodtype_outlined,
                        size: 340,
                        color: Colors.white.withValues(alpha: .08),
                      ),
                    ),
                  ),
                Padding(
                  padding: EdgeInsets.all(c.maxWidth > 650 ? 36 : 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        t('CONEXÕES QUE IMPORTAM', 'CONNECTIONS THAT MATTER'),
                        style: const TextStyle(
                          color: Color(0xffffc4ce),
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(height: 18),
                      Text(
                        t(
                          'A solidariedade\ncorre entre nós.',
                          'Kindness flows\nbetween us.',
                        ),
                        style: TextStyle(
                          fontSize: c.maxWidth > 650 ? 42 : 32,
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -1,
                          height: 1.15,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 490),
                        child: Text(
                          t(
                            'Descubra como a comunidade pode se mobilizar. Explore campanhas fictícias e crie a sua demonstração.',
                            'Discover how communities can come together. Explore fictional campaigns and create your own demo.',
                          ),
                          style: const TextStyle(
                            color: Color(0xfff4dce1),
                            fontSize: 15,
                            height: 1.6,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      FilledButton.icon(
                        onPressed: busy ? null : () => edit(context),
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: const Color(0xff522332),
                        ),
                        icon: const Icon(Icons.add),
                        label: Text(
                          t('Criar campanha demo', 'Create demo campaign'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 32),
        sectionHeading(
          t('Encontre uma conexão', 'Find a connection'),
          t(
            'Filtre exemplos da comunidade por região e tipo sanguíneo.',
            'Filter community examples by region and blood type.',
          ),
        ),
        LayoutBuilder(
          builder: (context, c) => Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              SizedBox(
                width: c.maxWidth > 750 ? (c.maxWidth - 36) * .4 : c.maxWidth,
                child: TextField(
                  controller: search,
                  onChanged: (v) => setState(() => query = v),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    labelText: t(
                      'Buscar campanha ou cidade',
                      'Search campaign or city',
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: c.maxWidth > 750
                    ? (c.maxWidth - 36) * .18
                    : (c.maxWidth - 12) / 2,
                child: filter(
                  t('Estado', 'State'),
                  state,
                  states,
                  (v) => setState(() {
                    state = v;
                    city = '';
                  }),
                ),
              ),
              SizedBox(
                width: c.maxWidth > 750
                    ? (c.maxWidth - 36) * .24
                    : (c.maxWidth - 12) / 2,
                child: filter(
                  t('Cidade', 'City'),
                  city,
                  locations
                      .where((l) => state.isEmpty || l.state == state)
                      .map((l) => l.city)
                      .toList(),
                  (v) => setState(() => city = v),
                ),
              ),
              SizedBox(
                width: c.maxWidth > 750 ? (c.maxWidth - 36) * .18 : c.maxWidth,
                child: filter(
                  t('Sangue', 'Blood'),
                  blood,
                  bloodTypes,
                  (v) => setState(() => blood = v),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 22),
        Row(
          children: [
            Expanded(
              child: Text(
                t(
                  '${visible.length} campanhas de demonstração',
                  '${visible.length} demonstration campaigns',
                ),
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            if (state.isNotEmpty ||
                city.isNotEmpty ||
                blood.isNotEmpty ||
                query.isNotEmpty)
              TextButton(
                onPressed: clearFilters,
                child: Text(t('Limpar filtros', 'Clear filters')),
              ),
          ],
        ),
        const SizedBox(height: 14),
        if (visible.isEmpty)
          empty(
            t('Nenhuma campanha por aqui', 'No campaigns here'),
            t(
              'Experimente outra cidade ou limpe os filtros.',
              'Try another city or clear the filters.',
            ),
          ),
        LayoutBuilder(
          builder: (context, c) {
            final columns = c.maxWidth > 920
                ? 3
                : c.maxWidth > 620
                ? 2
                : 1;
            return Wrap(
              spacing: 18,
              runSpacing: 18,
              children: visible
                  .map(
                    (campaign) => SizedBox(
                      width: (c.maxWidth - 18 * (columns - 1)) / columns,
                      child: campaignCard(context, campaign),
                    ),
                  )
                  .toList(),
            );
          },
        ),
      ],
    );
  }

  void clearFilters() => setState(() {
    state = '';
    city = '';
    blood = '';
    query = '';
    search.clear();
  });
  Widget filter(
    String label,
    String value,
    List<String> options,
    ValueChanged<String> change,
  ) => DropdownButtonFormField<String>(
    key: ValueKey('$label:$value:${options.join()}'),
    initialValue: value,
    isExpanded: true,
    decoration: InputDecoration(labelText: label),
    items: [
      DropdownMenuItem(value: '', child: Text(t('Todos', 'All'))),
      ...options.map(
        (v) => DropdownMenuItem(
          value: v,
          child: Text(v, overflow: TextOverflow.ellipsis),
        ),
      ),
    ],
    onChanged: (v) => change(v!),
  );
  Widget campaignCard(BuildContext context, Campaign c) => Card(
    margin: EdgeInsets.zero,
    child: Padding(
      padding: const EdgeInsets.all(22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 13,
                  vertical: 11,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xffffeef0),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Text(
                  c.blood,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                    color: red,
                  ),
                ),
              ),
              const Spacer(),
              Text(
                'DEMO',
                style: TextStyle(
                  color: ink.withValues(alpha: .65),
                  fontSize: 10,
                  letterSpacing: 1.4,
                  fontWeight: FontWeight.w700,
                ),
              ),
              IconButton(
                onPressed: busy ? null : () => saveCampaign(c),
                tooltip: t(
                  data!.saved.contains(c.id)
                      ? 'Remover dos salvos'
                      : 'Salvar campanha',
                  data!.saved.contains(c.id)
                      ? 'Remove saved campaign'
                      : 'Save campaign',
                ),
                icon: Icon(
                  data!.saved.contains(c.id)
                      ? Icons.bookmark
                      : Icons.bookmark_border,
                  color: red,
                ),
              ),
            ],
          ),
          const SizedBox(height: 22),
          Text(
            c.title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              letterSpacing: -.4,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.location_on_outlined, size: 17, color: red),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  '${c.city}, ${c.state}',
                  style: const TextStyle(fontSize: 13),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            c.location.name,
            style: const TextStyle(color: Color(0xff71656a), fontSize: 13),
          ),
          const SizedBox(height: 22),
          const Divider(height: 1),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(
                Icons.science_outlined,
                size: 16,
                color: Color(0xff71656a),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  t(
                    c.local
                        ? 'Criada neste navegador'
                        : 'Exemplo da comunidade',
                    c.local ? 'Created in this browser' : 'Community example',
                  ),
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xff71656a),
                  ),
                ),
              ),
              TextButton(
                onPressed: () => details(context, c),
                child: Text(t('Explorar →', 'Explore →')),
              ),
            ],
          ),
        ],
      ),
    ),
  );
  Future<void> details(BuildContext context, Campaign c) async {
    await showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(c.title),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'DEMO • ${c.blood} • ${c.city}/${c.state}',
                style: const TextStyle(fontWeight: FontWeight.bold, color: red),
              ),
              const SizedBox(height: 20),
              Text(c.description),
              const SizedBox(height: 20),
              Text('${c.location.name}\n${c.location.address}'),
              const SizedBox(height: 20),
              Text(
                t(
                  'Campanha e endereço fictícios. Não há pacientes, agendamento ou solicitação real de doação. O tipo sanguíneo é apenas um filtro, não uma avaliação de compatibilidade.',
                  'Fictional campaign and address. No patients, appointments or actual donation requests. Blood type is a filter, not a compatibility assessment.',
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text(t('Fechar', 'Close')),
          ),
          if (c.local)
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
                edit(context, c);
              },
              child: Text(t('Editar', 'Edit')),
            ),
          FilledButton.icon(
            icon: const Icon(Icons.ios_share),
            label: Text(t('Prévia de compartilhamento', 'Sharing preview')),
            onPressed: () {
              Navigator.pop(dialogContext);
              share(context, c);
            },
          ),
        ],
      ),
    );
  }

  Future<void> share(BuildContext context, Campaign c) async {
    await showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(t('Compartilhar com cuidado', 'Share thoughtfully')),
        content: SingleChildScrollView(
          child: Semantics(
            label: c.shareText,
            child: ExcludeSemantics(child: SelectableText(c.shareText)),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(t('Fechar', 'Close')),
          ),
          FilledButton.icon(
            onPressed: () async {
              try {
                await Clipboard.setData(ClipboardData(text: c.shareText));
                notice(
                  t(
                    'Texto demo copiado. Nenhuma mensagem foi enviada.',
                    'Demo text copied. No message was sent.',
                  ),
                );
              } catch (_) {
                notice(
                  t(
                    'Não foi possível copiar. Selecione o texto da prévia.',
                    'Could not copy. Select the preview text.',
                  ),
                );
              }
            },
            icon: const Icon(Icons.copy),
            label: Text(t('Copiar texto demo', 'Copy demo text')),
          ),
        ],
      ),
    );
  }

  Widget empty(String title, String subtitle) => Container(
    padding: const EdgeInsets.all(32),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      children: [
        const Icon(Icons.favorite_outline, color: red, size: 40),
        const SizedBox(height: 16),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(height: 10),
        Text(subtitle, textAlign: TextAlign.center),
      ],
    ),
  );
  Widget profilePage(BuildContext context) {
    final saved = data!.campaigns
        .where((c) => data!.saved.contains(c.id))
        .toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        sectionHeading(
          t('Seu espaço, neste navegador', 'Your space, in this browser'),
          t(
            'Sem cadastro. Sem dados de saúde. Apenas suas conexões salvas.',
            'No registration. No health data. Just your saved connections.',
          ),
        ),
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: const Color(0xfff3e9e6),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 26,
                child: Icon(Icons.person_outline, color: red),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      t('Visitante da demonstração', 'Demo visitor'),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      t(
                        '${saved.length} salvas • ${data!.campaigns.where((c) => c.local).length} criadas localmente',
                        '${saved.length} saved • ${data!.campaigns.where((c) => c.local).length} created locally',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        if (saved.isEmpty)
          empty(
            t(
              'Sua próxima conexão começa aqui',
              'Your next connection starts here',
            ),
            t(
              'Toque no marcador de uma campanha para encontrá-la aqui.',
              'Tap the bookmark on a campaign to find it here.',
            ),
          ),
        for (final c in saved)
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: campaignCard(context, c),
          ),
        const SizedBox(height: 24),
        Text(
          t(
            'Os dados são mantidos neste navegador e nesta origem. Limpar os dados do navegador remove suas alterações. Não use nomes, contatos, documentos ou informações de pacientes.',
            'Data stays in this browser and origin. Clearing browser data removes changes. Do not use names, contacts, identity documents or patient information.',
          ),
          style: const TextStyle(height: 1.6),
        ),
        const SizedBox(height: 16),
        Align(
          alignment: Alignment.centerLeft,
          child: OutlinedButton.icon(
            onPressed: busy ? null : () => reset(context),
            icon: const Icon(Icons.delete_outline),
            label: Text(t('Apagar meus dados locais', 'Clear my local data')),
          ),
        ),
      ],
    );
  }

  Future<void> reset(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(t('Apagar dados locais?', 'Clear local data?')),
        content: Text(
          t(
            'Suas campanhas, favoritos e idioma serão removidos. Os exemplos iniciais voltarão.',
            'Your campaigns, bookmarks and language preference will be removed. Initial examples will return.',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(t('Cancelar', 'Cancel')),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(t('Apagar', 'Clear')),
          ),
        ],
      ),
    );
    if (confirmed != true || !mounted) return;
    setState(() => busy = true);
    try {
      await widget.repository.clear();
      if (mounted) {
        clearFilters();
        setState(() {
          data = DemoData.initial();
          failed = false;
          page = 0;
        });
      }
    } catch (_) {
      notice(t('Não foi possível apagar os dados.', 'Could not clear data.'));
    } finally {
      if (mounted) setState(() => busy = false);
    }
  }
}
