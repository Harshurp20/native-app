import 'package:flutter/material.dart';
import 'package:gentlestudent/src/blocs/opportunity_navigation_bloc.dart';
import 'package:gentlestudent/src/views/main/opportunities/opportunities_list_page/opportunities_list_page.dart';
import 'package:gentlestudent/src/views/main/opportunities/opportunities_map_page/opportunities_map_page.dart';
import 'package:provider/provider.dart';

class OpportunitiesPage extends StatelessWidget {
  final List<Widget> _pages = [
    OpportunitiesMapPage(),
    OpportunitiesListPage(),
  ];

  final List<String> _titles = [
    "Map",
    "Leerkansen",
  ];

  final List<IconData> _icons = [
    Icons.list,
    Icons.map,
  ];

  final List<String> _tooltips = [
    "Klik hier om naar de lijst van leerkansen te gaan",
    "Klik hier om naar de map met leerkansen te gaan",
  ];

  @override
  Widget build(BuildContext context) {
    final _opportunitiesNavigationBloc =
        Provider.of<OpportunityNavigationBloc>(context);

    return StreamBuilder(
      stream: _opportunitiesNavigationBloc.currentIndex,
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        int index = snapshot.hasData ? snapshot.data : 0;

        return Scaffold(
          appBar: opportunitiesAppBar(index, _opportunitiesNavigationBloc),
          body: _pages[index],
        );
      },
    );
  }

  Widget opportunitiesAppBar(int index, OpportunityNavigationBloc bloc) =>
      AppBar(
        centerTitle: true,
        title: Text(_titles[index], style: TextStyle(color: Colors.white),),
        iconTheme: IconThemeData(color: Colors.white),
        actions: <Widget>[
          IconButton(
            icon: Icon(_icons[index]),
            onPressed: () => bloc.changeCurrentIndex(index == 0 ? 1 : 0),
            tooltip: _tooltips[index],
          ),
        ],
      );
}