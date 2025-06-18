import 'package:flutter/material.dart';
import 'package:shoes_app/src/widgets/widgets.dart';

class ZapatoPage extends StatelessWidget {
  const ZapatoPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          CustomAppbar(texto: 'For you'),
          ZapatoSizePreview(),
        ],
      ),
    );
  }
}
