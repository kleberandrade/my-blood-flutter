import 'package:material_ui/material_ui.dart';

import 'data/repository.dart';
import 'ui/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(BloodApp(repository: LocalCampaignRepository()));
}
