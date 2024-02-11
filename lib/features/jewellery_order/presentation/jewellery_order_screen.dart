import 'package:Shinydeal/features/jewellery_order/app/jewelleries.dart';
import 'package:Shinydeal/features/jewellery_order/presentation/jewellery_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class JewelleryOrderScreen extends ConsumerWidget {
  const JewelleryOrderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jewelleries = ref.watch(jewelleryProvider);
    final _locale = AppLocalizations.of(ref.context);

    return Scaffold(
      appBar: AppBar(
        title: Text(_locale!.jewelleryList),
        centerTitle: true,
        actions: const [],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(8.0),
              itemCount: jewelleries.length,
              separatorBuilder: (context, index) => const VerticalDivider(),
              itemBuilder: (context, index) => ListTile(
                title: Text(jewelleries[index].name),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => JewelleryDetailsScreen(
                    jewellery: jewelleries[index],
                  ),
                )),
                leading: Hero(
                  tag: jewelleries[index].picture,
                  child: Image.asset(jewelleries[index].picture,
                      width: 64, height: 64),
                ),
                trailing: Text('${jewelleries[index].price}€'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
