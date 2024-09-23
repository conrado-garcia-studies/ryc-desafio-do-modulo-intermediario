import 'package:flutter/material.dart';
import 'package:my_marvel_list/screens/series_selection_screen.dart';

class MoreSeriesSymbolFilters extends StatelessWidget {
  const MoreSeriesSymbolFilters({super.key});

  @override
  Widget build(final BuildContext context) {
    final Map<String, dynamic> commonSpecificQueryParameters =
        <String, dynamic>{};
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        top: 50,
        bottom: 30,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<Function()?>(
          items: <DropdownMenuItem<Function()?>>[
            _buildMenuItem(
              context,
              'More (click to select)',
              null,
            ),
            _buildMenuItem(
              context,
              'Thanos',
              _buildOnTap(
                context,
                'Thanos Comic Series',
                '/characters/1009652/series',
                '/thanos-series-selection',
                commonSpecificQueryParameters,
              ),
            ),
            _buildMenuItem(
              context,
              'Loki',
              _buildOnTap(
                context,
                'Loki Comic Series',
                '/characters/1009407/series',
                '/loki-series-selection',
                commonSpecificQueryParameters,
              ),
            ),
            _buildMenuItem(
              context,
              'Deadpool',
              _buildOnTap(
                context,
                'Deadpool Comic Series',
                '/characters/1009268/series',
                '/deadpool-series-selection',
                commonSpecificQueryParameters,
              ),
            ),
            _buildMenuItem(
              context,
              'Guardians of the Galaxy',
              _buildOnTap(
                context,
                'Guardians of the Galaxy Comic Series',
                '/characters/1011299/series',
                '/guardians-of-the-galaxy-series-selection',
                commonSpecificQueryParameters,
              ),
            ),
            _buildMenuItem(
              context,
              'Magneto',
              _buildOnTap(
                context,
                'Magneto Comic Series',
                '/characters/1009417/series',
                '/magneto-series-selection',
                commonSpecificQueryParameters,
              ),
            ),
            _buildMenuItem(
              context,
              'Scarlet Witch',
              _buildOnTap(
                context,
                'Scarlet Witch Comic Series',
                '/characters/1009562/series',
                '/scarlet-witch-series-selection',
                commonSpecificQueryParameters,
              ),
            ),
            _buildMenuItem(
              context,
              'Black Panther',
              _buildOnTap(
                context,
                'Black Panther Comic Series',
                '/characters/1009187/series',
                '/black-panther-series-selection',
                commonSpecificQueryParameters,
              ),
            ),
            _buildMenuItem(
              context,
              'Storm',
              _buildOnTap(
                context,
                'Storm Comic Series',
                '/characters/1009629/series',
                '/storm-series-selection',
                commonSpecificQueryParameters,
              ),
            ),
            _buildMenuItem(
              context,
              'Black Widow',
              _buildOnTap(
                context,
                'Black Widow Comic Series',
                '/characters/1009189/series',
                '/black-widow-series-selection',
                commonSpecificQueryParameters,
              ),
            ),
            _buildMenuItem(
              context,
              'Hawkeye',
              _buildOnTap(
                context,
                'Hawkeye Comic Series',
                '/characters/1009338/series',
                '/hawkeye-series-selection',
                commonSpecificQueryParameters,
              ),
            ),
            _buildMenuItem(
              context,
              'Ms. Marvel',
              _buildOnTap(
                context,
                'Ms. Marvel Comic Series',
                '/characters/1017577/series',
                '/ms-marvel-series-selection',
                commonSpecificQueryParameters,
              ),
            ),
            _buildMenuItem(
              context,
              'Miles Morales',
              _buildOnTap(
                context,
                'Spider-Man (Miles Morales) Comic Series',
                '/characters/1016181/series',
                '/miles-morales-series-selection',
                commonSpecificQueryParameters,
              ),
            ),
            _buildMenuItem(
              context,
              'Doctor Strange',
              _buildOnTap(
                context,
                'Doctor Strange Comic Series',
                '/characters/1009282/series',
                '/doctor-strange-series-selection',
                commonSpecificQueryParameters,
              ),
            ),
            _buildMenuItem(
              context,
              'Rogue',
              _buildOnTap(
                context,
                'Rogue Comic Series',
                '/characters/1009546/series',
                '/rogue-series-selection',
                commonSpecificQueryParameters,
              ),
            ),
            _buildMenuItem(
              context,
              'Cyclops',
              _buildOnTap(
                context,
                'Cyclops Comic Series',
                '/characters/1009257/series',
                '/cyclops-series-selection',
                commonSpecificQueryParameters,
              ),
            ),
            _buildMenuItem(
              context,
              'Ant-Man',
              _buildOnTap(
                context,
                'Ant-Man (Scott Lang) Comic Series',
                '/characters/1010801/series',
                '/ant-man-series-selection',
                commonSpecificQueryParameters,
              ),
            ),
            _buildMenuItem(
              context,
              'Gambit',
              _buildOnTap(
                context,
                'Gambit Comic Series',
                '/characters/1009313/series',
                '/gambit-series-selection',
                commonSpecificQueryParameters,
              ),
            ),
            _buildMenuItem(
              context,
              'Blade',
              _buildOnTap(
                context,
                'Blade Comic Series',
                '/characters/1009191/series',
                '/blade-series-selection',
                commonSpecificQueryParameters,
              ),
            ),
            _buildMenuItem(
              context,
              'Winter Soldier',
              _buildOnTap(
                context,
                'Winter Soldier Comic Series',
                '/characters/1010740/series',
                '/winter-soldier-series-selection',
                commonSpecificQueryParameters,
              ),
            ),
            _buildMenuItem(
              context,
              'Captain Marvel',
              _buildOnTap(
                context,
                'Captain Marvel (Carol Danvers) Comic Series',
                '/characters/1010338/series',
                '/captain-marvel-series-selection',
                commonSpecificQueryParameters,
              ),
            ),
            _buildMenuItem(
              context,
              'Shang-Chi',
              _buildOnTap(
                context,
                'Shang-Chi Comic Series',
                '/characters/1009577/series',
                '/shang-chi-series-selection',
                commonSpecificQueryParameters,
              ),
            ),
            _buildMenuItem(
              context,
              'Wasp',
              _buildOnTap(
                context,
                'Wasp Comic Series',
                '/characters/1009707/series',
                '/wasp-series-selection',
                commonSpecificQueryParameters,
              ),
            ),
            _buildMenuItem(
              context,
              'Eternals',
              _buildOnTap(
                context,
                'Eternals Comic Series',
                '/characters/1010807/series',
                '/eternals-series-selection',
                commonSpecificQueryParameters,
              ),
            ),
            _buildMenuItem(
              context,
              'Nick Fury',
              _buildOnTap(
                context,
                'Nick Fury Comic Series',
                '/characters/1009471/series',
                '/nick-fury-series-selection',
                commonSpecificQueryParameters,
              ),
            ),
            _buildMenuItem(
              context,
              'Jessica Jones',
              _buildOnTap(
                context,
                'Jessica Jones Comic Series',
                '/characters/1009378/series',
                '/jessica-jones-series-selection',
                commonSpecificQueryParameters,
              ),
            ),
            _buildMenuItem(
              context,
              'Luke Cage',
              _buildOnTap(
                context,
                'Luke Cage Comic Series',
                '/characters/1009215/series',
                '/luke-cage-series-selection',
                commonSpecificQueryParameters,
              ),
            ),
            _buildMenuItem(
              context,
              'S.H.I.E.L.D.',
              _buildOnTap(
                context,
                'S.H.I.E.L.D. Comic Series',
                '/characters/1009552/series',
                '/shield-series-selection',
                commonSpecificQueryParameters,
              ),
            ),
            _buildMenuItem(
              context,
              'Captain Carter',
              _buildOnTap(
                context,
                'Captain Carter Comic Series',
                '/characters/1017857/series',
                '/captain-carter-series-selection',
                commonSpecificQueryParameters,
              ),
            ),
            _buildMenuItem(
              context,
              'Moon Knight',
              _buildOnTap(
                context,
                'Moon Knight Comic Series',
                '/characters/1009452/series',
                '/moon-knight-series-selection',
                commonSpecificQueryParameters,
              ),
            ),
            _buildMenuItem(
              context,
              'Cloak',
              _buildOnTap(
                context,
                'Cloak Comic Series',
                '/characters/1009241/series',
                '/cloak-series-selection',
                commonSpecificQueryParameters,
              ),
            ),
            _buildMenuItem(
              context,
              'Dagger',
              _buildOnTap(
                context,
                'Dagger Comic Series',
                '/characters/1009258/series',
                '/dagger-series-selection',
                commonSpecificQueryParameters,
              ),
            ),
            _buildMenuItem(
              context,
              'Runaways',
              _buildOnTap(
                context,
                'Runaways Comic Series',
                '/characters/1010747/series',
                '/runaways-series-selection',
                commonSpecificQueryParameters,
              ),
            ),
            _buildMenuItem(
              context,
              'She-Hulk',
              _buildOnTap(
                context,
                'She-Hulk (Jennifer Walters) Comic Series',
                '/characters/1009583/series',
                '/she-hulk-series-selection',
                commonSpecificQueryParameters,
              ),
            ),
            _buildMenuItem(
              context,
              'Agatha Harkness',
              _buildOnTap(
                context,
                'Agatha Harkness Comic Series',
                '/characters/1012717/series',
                '/agatha-harkness-series-selection',
                commonSpecificQueryParameters,
              ),
            ),
            _buildMenuItem(
              context,
              'Defenders',
              _buildOnTap(
                context,
                'Defenders Comic Series',
                '/characters/1011023/series',
                '/defenders-series-selection',
                commonSpecificQueryParameters,
              ),
            ),
            _buildMenuItem(
              context,
              'Echo',
              _buildOnTap(
                context,
                'Echo Comic Series',
                '/characters/1010785/series',
                '/echo-series-selection',
                commonSpecificQueryParameters,
              ),
            ),
            _buildMenuItem(
              context,
              'Iron Fist',
              _buildOnTap(
                context,
                'Iron Fist (Danny Rand) Comic Series',
                '/characters/1009367/series',
                '/iron-fist-series-selection',
                commonSpecificQueryParameters,
              ),
            ),
            _buildMenuItem(
              context,
              'Inhumans',
              _buildOnTap(
                context,
                'Inhumans Comic Series',
                '/characters/1009365/series',
                '/inhumans-series-selection',
                commonSpecificQueryParameters,
              ),
            ),
          ],
          onChanged: _invokeValue,
          iconDisabledColor: Theme.of(context).colorScheme.primary,
          iconEnabledColor: Theme.of(context).colorScheme.primary,
          iconSize: 0,
        ),
      ),
    );
  }

  DropdownMenuItem<Function()?> _buildMenuItem(
      final BuildContext context, final String label, final Function()? value) {
    return DropdownMenuItem<Function()?>(
      value: value,
      child: Text(
        label,
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }

  void Function() _buildOnTap(
      final BuildContext context,
      final String title,
      final String specificSubpath,
      final String routeName,
      final Map<String, dynamic> specificQueryParameters) {
    return () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => SeriesSelectionScreen(
              title: title,
              routeName: routeName,
              specificSubpath: specificSubpath,
              specificQueryParameters: specificQueryParameters,
            ),
            settings: RouteSettings(
              name: routeName,
            ),
          ),
        );
  }

  void _invokeValue(final Function()? value) {
    if (value != null) {
      value();
    }
  }
}
