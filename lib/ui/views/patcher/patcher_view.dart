import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:revanced_manager/app/app.locator.dart';
import 'package:revanced_manager/theme.dart';
import 'package:revanced_manager/ui/views/patcher/patcher_viewmodel.dart';
import 'package:revanced_manager/ui/widgets/app_selector_card.dart';
import 'package:revanced_manager/ui/widgets/patch_selector_card.dart';
import 'package:stacked/stacked.dart';

class PatcherView extends StatelessWidget {
  const PatcherView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PatcherViewModel>.reactive(
      disposeViewModel: false,
      viewModelBuilder: () => locator<PatcherViewModel>(),
      builder: (context, model, child) => Scaffold(
        floatingActionButton: Visibility(
          visible: locator<PatcherViewModel>().showFabButton,
          child: FloatingActionButton.extended(
            onPressed: () => model.navigateToInstaller(),
            label: I18nText('patcherView.fabButton'),
            icon: const Icon(Icons.build),
            backgroundColor: Theme.of(context).colorScheme.secondary,
            foregroundColor: Colors.white,
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                I18nText(
                  'patcherView.widgetTitle',
                  child: Text(
                    '',
                    style: GoogleFonts.inter(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 23),
                AppSelectorCard(
                  onPressed: model.navigateToAppSelector,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(height: 16),
                Opacity(
                  opacity: isDark
                      ? (model.dimPatchCard ? 0.5 : 1)
                      : (model.dimPatchCard ? 0.75 : 1),
                  child: PatchSelectorCard(
                    onPressed: model.navigateToPatchesSelector,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}