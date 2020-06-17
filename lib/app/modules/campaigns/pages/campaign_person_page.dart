import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_blood/app/modules/campaigns/controllers/campaign_person_controller.dart';
import 'package:my_blood/app/modules/campaigns/pages/editor_campaign_person_page.dart';
import 'package:my_blood/app/modules/campaigns/widgets/campaign_person_card.dart';
import 'package:my_blood/app/modules/profile/controllers/profile_controller.dart';
import 'package:my_blood/app/shared/helpers/date_helper.dart';
import 'package:my_blood/app/shared/helpers/snackbar_helper.dart';
import 'package:my_blood/app/shared/widgets/containers/busy_container.dart';
import 'package:provider/provider.dart';
import 'package:my_blood/app/modules/campaigns/widgets/campaign_bottom_sheet.dart';
import 'package:my_blood/app/modules/campaigns/widgets/campaign_donation_dialog.dart';

class CampaignPersonPage extends StatefulWidget {
  @override
  _CampaignPersonPageState createState() => _CampaignPersonPageState();
}

class _CampaignPersonPageState extends State<CampaignPersonPage> {
  CampaignPersonController _campaignController;
  ProfileController _profileController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _profileController ??= Provider.of<ProfileController>(context);
    _campaignController ??= Provider.of<CampaignPersonController>(context);
    _campaignController.fetch();
  }

  _navigatorToNewCampaignPerson() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditorCampaignPersonPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _navigatorToNewCampaignPerson,
      ),
      body: Observer(
        builder: (_) {
          return BusyContainer(
            busy: _campaignController.busy,
            child: ListView.builder(
              padding: EdgeInsets.all(10.0),
              shrinkWrap: true,
              itemCount: _campaignController.campaigns.length,
              itemBuilder: (context, index) {
                final campaign = _campaignController.campaigns[index];
                return CampaignPersonCard(
                  campaign: campaign,
                  onShare: () {
                    CampaignBottomSheet.show(
                      context,
                      '${campaign.name} precisa de doação de sangue do tipo ${campaign.bloodType}\n\nInformações para quem puder doar:\n${campaign.location}',
                      _campaignController.campaigns[index].photoPath ?? '',
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
            length: _campaignController.campaigns.length,
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
