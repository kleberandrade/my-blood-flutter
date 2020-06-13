import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_blood/app/modules/campaigns/controllers/campaign_location_controller.dart';
import 'package:my_blood/app/modules/campaigns/widgets/campaign_bottom_sheet.dart';
import 'package:my_blood/app/modules/campaigns/widgets/campaign_location_card.dart';
import 'package:my_blood/app/modules/profile/controllers/profile_controller.dart';
import 'package:my_blood/app/shared/helpers/date_helper.dart';
import 'package:my_blood/app/shared/helpers/snackbar_helper.dart';
import 'package:my_blood/app/shared/widgets/containers/busy_container.dart';
import 'package:provider/provider.dart';
import 'package:my_blood/app/modules/campaigns/widgets/campaign_donation_dialog.dart';

import 'editor_campaign_location_page.dart';

class CampaignLocationPage extends StatefulWidget {
  @override
  _CampaignLocationPageState createState() => _CampaignLocationPageState();
}

class _CampaignLocationPageState extends State<CampaignLocationPage> {
  CampaignLocationController _controller;
  ProfileController _profileController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _profileController ??= Provider.of<ProfileController>(context);
    _controller ??= Provider.of<CampaignLocationController>(context);
    _controller.fetch();
  }

  _navigatorToNewCampaignLocation() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditorCampaignLocationPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _navigatorToNewCampaignLocation,
      ),
      body: Observer(
        builder: (_) {
          return BusyContainer(
            busy: _controller.busy,
            child: ListView.builder(
              padding: EdgeInsets.all(10.0),
              shrinkWrap: true,
              itemCount: _controller.campaigns.length,
              itemBuilder: (context, index) {
                final campaign = _controller.campaigns[index];
                return CampaignLocationCard(
                  campaign: campaign,
                  onShare: () {
                    CampaignBottomSheet.show(
                      context,
                      '${campaign.name} precisa de doação de sangue do tipo ${campaign.bloodType}\n\nInformações para quem puder doar:\n${campaign.location}',
                      _controller.campaigns[index].imagePath ?? '',
                    );
                  },
                  onDonation: () {
                    CampaignDonationDialog.show(
                      context,
                      nextDonationDate:
                          _profileController.user.dateToNextDonation(),
                      onConfirm: _onConfirmDonation,
                    );
                  },
                );
              },
            ),
            length: _controller.campaigns.length,
            icon: Icons.sentiment_dissatisfied,
          );
        },
      ),
    );
  }

  _onConfirmDonation() {
    _profileController.user.lastDonationDate =
        DateHelper.format(DateTime.now());
    _profileController.save();
    SnackBarHelper.showSuccessMessage(
      context,
      title: 'Obrigado',
      message: 'Doação de sangue cadastrada com sucesso!',
    );
  }
}
