import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_blood/app/modules/locations/controllers/location_controller.dart';
import 'package:my_blood/app/modules/login/controllers/account_controller.dart';
import 'package:my_blood/app/themes/app_theme.dart';
import 'package:provider/provider.dart';

import 'app/modules/campaigns/controllers/campaign_controller.dart';
import 'app/shared/global/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MultiProvider(
      providers: [
        Provider<AccountController>.value(value: AccountController()),
        Provider<CampaignController>.value(value: CampaignController()),
        Provider<LocationController>.value(value: LocationController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My Blood',
        theme: appTheme,
        initialRoute: '/',
        routes: appRoutes,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: [const Locale('pt', 'BR')],
      ),
    );
  }
}
