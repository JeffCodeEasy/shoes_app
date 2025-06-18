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
          SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  ZapatoSizePreview(),

                  ZapatoDescription(
                    titulo: 'Nike Air Max 720',
                    descripcion:
                        "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
