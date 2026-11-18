import 'package:material_ui/material_ui.dart';

import '../domain/campaign.dart';

class CampaignEditor extends StatefulWidget {
  final Campaign? campaign;
  final bool english;
  const CampaignEditor({super.key, this.campaign, required this.english});
  @override
  State<CampaignEditor> createState() => _CampaignEditorState();
}

class _CampaignEditorState extends State<CampaignEditor> {
  final form = GlobalKey<FormState>();
  late final title = TextEditingController(text: widget.campaign?.title);
  late final description = TextEditingController(
    text: widget.campaign?.description,
  );
  late String blood = widget.campaign?.blood ?? 'O+';
  late String locationId = widget.campaign?.locationId ?? locations.first.id;
  String t(String pt, String en) => widget.english ? en : pt;
  @override
  void dispose() {
    title.dispose();
    description.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Dialog(
    child: ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 560),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: form,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      t(
                        widget.campaign == null
                            ? 'Nova campanha'
                            : 'Editar campanha',
                        widget.campaign == null
                            ? 'New campaign'
                            : 'Edit campaign',
                      ),
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  IconButton(
                    tooltip: t('Fechar', 'Close'),
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                t(
                  'Publicação local de demonstração. Use apenas informações fictícias, sem nomes de pacientes ou contatos.',
                  'Local demo publication. Use fictional information only, without patient names or contact details.',
                ),
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: title,
                maxLength: 80,
                decoration: InputDecoration(
                  labelText: t('Título da campanha', 'Campaign title'),
                ),
                validator: (v) => v == null || v.trim().length < 5
                    ? t(
                        'Informe ao menos 5 caracteres',
                        'Enter at least 5 characters',
                      )
                    : null,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                initialValue: locationId,
                isExpanded: true,
                decoration: InputDecoration(
                  labelText: t(
                    'Local fictício • cidade/estado',
                    'Fictional location • city/state',
                  ),
                ),
                items: locations
                    .map(
                      (l) => DropdownMenuItem(
                        value: l.id,
                        child: Text(
                          '${l.city} / ${l.state} • ${l.name}',
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (v) => setState(() => locationId = v!),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                initialValue: blood,
                decoration: InputDecoration(
                  labelText: t(
                    'Tipo sanguíneo do exemplo',
                    'Example blood type',
                  ),
                ),
                items: bloodTypes
                    .map((b) => DropdownMenuItem(value: b, child: Text(b)))
                    .toList(),
                onChanged: (v) => setState(() => blood = v!),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: description,
                maxLength: 500,
                minLines: 3,
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: t('Descrição fictícia', 'Fictional description'),
                ),
                validator: (v) => v == null || v.trim().length < 10
                    ? t(
                        'Informe ao menos 10 caracteres',
                        'Enter at least 10 characters',
                      )
                    : null,
              ),
              const SizedBox(height: 16),
              FilledButton.icon(
                icon: const Icon(Icons.check),
                label: Text(
                  t('Salvar nesta demonstração', 'Save in this demo'),
                ),
                onPressed: () {
                  if (!form.currentState!.validate()) return;
                  final l = locations.firstWhere((l) => l.id == locationId);
                  Navigator.pop(
                    context,
                    Campaign(
                      id:
                          widget.campaign?.id ??
                          'local-${DateTime.now().microsecondsSinceEpoch}',
                      title: title.text,
                      city: l.city,
                      state: l.state,
                      blood: blood,
                      locationId: l.id,
                      description: description.text,
                      local: true,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
