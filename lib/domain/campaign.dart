const bloodTypes = ['O+', 'O-', 'A+', 'A-', 'B+', 'B-', 'AB+', 'AB-'];
const states = ['SP', 'RJ', 'MG'];

class DonationLocation {
  final String id, name, city, state, address;
  const DonationLocation(
    this.id,
    this.name,
    this.city,
    this.state,
    this.address,
  );
}

// Deliberately fictional facilities: never used for directions or appointments.
const locations = [
  DonationLocation(
    'campinas',
    'Espaço Girassol',
    'Campinas',
    'SP',
    'Avenida Exemplo, 120 • endereço fictício',
  ),
  DonationLocation(
    'sao-paulo',
    'Casa do Encontro',
    'São Paulo',
    'SP',
    'Rua Demonstração, 45 • endereço fictício',
  ),
  DonationLocation(
    'rio',
    'Ponto Maré',
    'Rio de Janeiro',
    'RJ',
    'Praça Modelo, 80 • endereço fictício',
  ),
  DonationLocation(
    'bh',
    'Espaço Horizonte',
    'Belo Horizonte',
    'MG',
    'Rua Ilustração, 200 • endereço fictício',
  ),
];

class Campaign {
  final String id, title, city, state, blood, locationId, description;
  final bool local;
  Campaign({
    required this.id,
    required String title,
    required this.city,
    required this.state,
    required this.blood,
    required this.locationId,
    required String description,
    this.local = false,
  }) : title = title.trim(),
       description = description.trim() {
    if (id.isEmpty ||
        this.title.length < 5 ||
        this.title.length > 80 ||
        this.description.length < 10 ||
        this.description.length > 500 ||
        !bloodTypes.contains(blood) ||
        !states.contains(state) ||
        !locations.any(
          (l) => l.id == locationId && l.city == city && l.state == state,
        )) {
      throw const FormatException('Invalid campaign');
    }
  }
  DonationLocation get location =>
      locations.firstWhere((l) => l.id == locationId);
  Map<String, dynamic> toMap() => {
    'id': id,
    'title': title,
    'city': city,
    'state': state,
    'blood': blood,
    'locationId': locationId,
    'description': description,
    'local': local,
  };
  factory Campaign.fromMap(Map<String, dynamic> m) => Campaign(
    id: m['id'] as String,
    title: m['title'] as String,
    city: m['city'] as String,
    state: m['state'] as String,
    blood: m['blood'] as String,
    locationId: m['locationId'] as String,
    description: m['description'] as String,
    local: m['local'] as bool,
  );
  String get shareText =>
      '[DEMO • SYNTHETIC DATA]\n$title\n$city / $state • $blood\n'
      '$description\nFictional campaign. Do not travel to this location. '
      'Campanha fictícia. Não vá a este endereço.';
}

String normalize(String value) {
  var text = value.toLowerCase().trim();
  const accents = 'áàãâéêíóôõúç';
  const plain = 'aaaaeeiooouc';
  for (var i = 0; i < accents.length; i++) {
    text = text.replaceAll(accents[i], plain[i]);
  }
  return text;
}

List<Campaign> filterCampaigns(
  List<Campaign> campaigns, {
  String state = '',
  String city = '',
  String blood = '',
  String query = '',
}) => campaigns
    .where(
      (c) =>
          (state.isEmpty || c.state == state) &&
          (city.isEmpty || c.city == city) &&
          (blood.isEmpty || c.blood == blood) &&
          normalize('${c.title} ${c.city} ${c.state}')
              .contains(normalize(query)),
    )
    .toList();

final seedCampaigns = [
  Campaign(
    id: 'seed-1',
    title: 'Juntos pelo próximo',
    city: 'Campinas',
    state: 'SP',
    blood: 'O+',
    locationId: 'campinas',
    description: 'Uma campanha fictícia sobre o poder de mobilizar a comunidade. Explore, salve e compartilhe uma prévia de demonstração.',
  ),
  Campaign(
    id: 'seed-2',
    title: 'Uma cidade, muitos laços',
    city: 'São Paulo',
    state: 'SP',
    blood: 'A+',
    locationId: 'sao-paulo',
    description: 'Exemplo educativo de mobilização comunitária. Esta campanha não representa pacientes, doadores ou um serviço real.',
  ),
  Campaign(
    id: 'seed-3',
    title: 'Solidariedade que circula',
    city: 'Rio de Janeiro',
    state: 'RJ',
    blood: 'AB-',
    locationId: 'rio',
    description: 'Dados sintéticos para conhecer os filtros e a navegação. Nenhuma necessidade de sangue é anunciada por este exemplo.',
  ),
  Campaign(
    id: 'seed-4',
    title: 'Pequenos gestos conectam',
    city: 'Belo Horizonte',
    state: 'MG',
    blood: 'B-',
    locationId: 'bh',
    description: 'Uma iniciativa fictícia para experimentar o catálogo. A triagem e os critérios de doação pertencem ao hemocentro.',
  ),
];
