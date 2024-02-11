import 'package:Shinydeal/features/jewellery_order/dom/jewellery.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class JewelleryDetailsScreen extends StatefulWidget {
  const JewelleryDetailsScreen({super.key, required this.jewellery});
  final Jewellery jewellery;

  @override
  State<StatefulWidget> createState() => _JewelleryDetailsScreenState();
}

class _JewelleryDetailsScreenState extends State<JewelleryDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final _locale = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text('${widget.jewellery.name} ${_locale!.jewelleryDetail}')),
      body: Center(
        child: Column(
          children: [
            Hero(
              tag: widget.jewellery.picture,
              child: Image.asset(
                widget.jewellery.picture,
                width: 250,
                height: 250,
                )
            ),
            const Divider(),
            Text('${_locale.jewelleryPrice} ${widget.jewellery.price}€', style: const TextStyle(fontSize: 24)),
            const Divider(),
            Text('${_locale.jewelleryAccessory} ${widget.jewellery.accessory.name}', style: const TextStyle(fontSize: 24)),
            const Divider(),
            Text('${_locale.jewelleryType} ${widget.jewellery.type.name}', style: const TextStyle(fontSize: 24)),
          ]
        ),
      ),
    );
  }
}
