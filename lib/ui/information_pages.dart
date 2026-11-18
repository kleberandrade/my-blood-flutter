import 'package:material_ui/material_ui.dart';

import '../domain/campaign.dart';
import 'common.dart';

const officialUrl =
    'https://www.gov.br/saude/pt-br/composicao/saes/doacao-de-sangue/doacao-de-sangue/';
const faqUrl =
    'https://www.gov.br/saude/pt-br/composicao/saes/doacao-de-sangue/faq';
const red = Color(0xffb83249);

class LocationsPage extends StatelessWidget {
  final bool english;
  final ValueChanged<String> onOpen;
  const LocationsPage({super.key, required this.english, required this.onOpen});
  String t(String pt, String en) => english ? en : pt;
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      sectionHeading(
        t('Perto da comunidade', 'Close to the community'),
        t(
          'Locais fictícios para explorar o aplicativo. Não se desloque até esses endereços.',
          'Fictional locations to explore the app. Do not travel to these addresses.',
        ),
      ),
      for (final l in locations)
        Card(
          margin: const EdgeInsets.only(bottom: 14),
          child: Padding(
            padding: const EdgeInsets.all(22),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.location_on_outlined, color: red),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l.name,
                        style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${l.city} / ${l.state}\n${l.address}',
                        style: const TextStyle(height: 1.7),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        t(
                          'DEMO • Sem horário de atendimento ou agendamento',
                          'DEMO • No opening hours or appointments',
                        ),
                        style: const TextStyle(color: red, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      const SizedBox(height: 12),
      Text(
        t(
          'Para uma doação real, consulte os canais oficiais e confirme endereço, horário e orientações diretamente com o hemocentro.',
          'For an actual donation, consult official channels and confirm the address, hours and guidance directly with the blood center.',
        ),
      ),
      const SizedBox(height: 16),
      Align(
        alignment: Alignment.centerLeft,
        child: FilledButton.icon(
          onPressed: () => onOpen(officialUrl),
          icon: const Icon(Icons.open_in_new),
          label: Text(
            t('Consultar Ministério da Saúde', 'Brazilian Ministry of Health'),
          ),
        ),
      ),
    ],
  );
}

class DonationInformationPage extends StatelessWidget {
  final bool english;
  final ValueChanged<String> onOpen;
  const DonationInformationPage({
    super.key,
    required this.english,
    required this.onOpen,
  });
  String t(String pt, String en) => english ? en : pt;
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      sectionHeading(
        t('Informação que acolhe', 'Information that cares'),
        t(
          'Informações gerais. A avaliação individual é feita pelo hemocentro.',
          'General information. Individual assessment belongs to the blood center.',
        ),
      ),
      for (final pair in [
        (
          t(
            'Este app diz se posso doar?',
            'Does this app tell me if I can donate?',
          ),
          t(
            'Não. Não realizamos diagnóstico, triagem, avaliação de aptidão nem cálculo de compatibilidade. A equipe do serviço de hemoterapia avalia cada pessoa.',
            'No. We do not diagnose, screen, assess eligibility or calculate compatibility. The blood service team assesses each person.',
          ),
        ),
        (
          t(
            'Como me preparar para uma doação?',
            'How can I prepare for a donation?',
          ),
          t(
            'Consulte as orientações atualizadas do Ministério da Saúde e do hemocentro escolhido antes de se deslocar. Condições individuais e critérios específicos devem ser discutidos com o serviço.',
            'Consult current Ministry of Health and blood center guidance before travelling. Discuss individual circumstances and specific criteria with the service.',
          ),
        ),
        (
          t(
            'As campanhas e os locais são reais?',
            'Are campaigns and locations real?',
          ),
          t(
            'Não. Todos os exemplos são sintéticos e os endereços são fictícios. Salvar uma campanha não registra uma doação nem faz um agendamento.',
            'No. All examples are synthetic and addresses are fictional. Saving a campaign does not record a donation or book an appointment.',
          ),
        ),
        (
          t(
            'Meus dados saem do dispositivo?',
            'Does my data leave this device?',
          ),
          t(
            'As campanhas criadas e os favoritos ficam no armazenamento deste navegador. Não há conta, rastreamento ou Firebase ativo. Links oficiais abrem sites externos. Ao copiar um texto, você controla onde ele será usado.',
            'Created campaigns and bookmarks stay in browser storage. There is no account, tracking or active Firebase. Official links open external websites. When copying text, you control where it is used.',
          ),
        ),
      ])
        Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ExpansionTile(
            title: Text(
              pair.$1,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            childrenPadding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
            children: [Text(pair.$2, style: const TextStyle(height: 1.6))],
          ),
        ),
      const SizedBox(height: 24),
      Text(
        t(
          'FONTES OFICIAIS • CONSULTADAS EM 17/11/2026',
          'OFFICIAL SOURCES • CHECKED 17 NOV 2026',
        ),
        style: const TextStyle(
          fontSize: 11,
          letterSpacing: 1.2,
          fontWeight: FontWeight.bold,
          color: red,
        ),
      ),
      const SizedBox(height: 12),
      Wrap(
        spacing: 12,
        runSpacing: 12,
        children: [
          OutlinedButton.icon(
            onPressed: () => onOpen(officialUrl),
            icon: const Icon(Icons.open_in_new),
            label: Text(
              t(
                'Doação de sangue • Ministério da Saúde',
                'Blood donation • Ministry of Health',
              ),
            ),
          ),
          OutlinedButton.icon(
            onPressed: () => onOpen(faqUrl),
            icon: const Icon(Icons.open_in_new),
            label: Text(
              t(
                'Perguntas frequentes oficiais',
                'Official frequently asked questions',
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
