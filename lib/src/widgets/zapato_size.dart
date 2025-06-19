import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/src/models/zapato_model.dart';
import 'package:shoes_app/src/pages/pages.dart';

class ZapatoSizePreview extends StatelessWidget {
  final bool fullScreen;
  const ZapatoSizePreview({super.key, this.fullScreen = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!fullScreen) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ZapatoDescPage()),
          );
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: (fullScreen) ? 5 : 30,
          vertical: (fullScreen) ? 0 : 30,
        ),
        child: Container(
          width: double.infinity,
          height: (fullScreen) ? 410 : 430,
          decoration: BoxDecoration(
            color: Color(0xffFFCF53),
            borderRadius: (!fullScreen)
                ? BorderRadius.circular(50)
                : BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
          ),
          child: Column(
            children: [
              // Zapato con su sombra
              _ZapatoConSombra(),
              // Tallas
              if (!fullScreen) _ZapatosTallas(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ZapatosTallas extends StatelessWidget {
  const _ZapatosTallas();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _TallaZapatoCaja(7),
          _TallaZapatoCaja(7.5),
          _TallaZapatoCaja(8),
          _TallaZapatoCaja(8.5),
          _TallaZapatoCaja(9),
          _TallaZapatoCaja(9.5),
        ],
      ),
    );
  }
}

class _TallaZapatoCaja extends StatelessWidget {
  final double numero;

  const _TallaZapatoCaja(this.numero);

  @override
  Widget build(BuildContext context) {
    final zapatoModel = context.watch<ZapatoModel>();

    return GestureDetector(
      onTap: () {
        context.read<ZapatoModel>().talla = numero;
      },
      child: Container(
        alignment: Alignment.center,
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: (numero == zapatoModel.talla)
              ? Color(0xffF1A23A)
              : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            if (numero == zapatoModel.talla)
              BoxShadow(
                color: Color(0xffF1A23A),
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
          ],
        ),
        child: Text(
          numero.toString().replaceAll('.0', ''),
          style: TextStyle(
            color: (numero == zapatoModel.talla)
                ? Colors.white
                : Color(0xffF1A23A),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class _ZapatoConSombra extends StatelessWidget {
  const _ZapatoConSombra();

  @override
  Widget build(BuildContext context) {
    final zapatoModel = context.watch<ZapatoModel>();

    return Padding(
      padding: const EdgeInsets.all(50),
      child: Stack(
        children: [
          Positioned(bottom: 10, right: 0, child: _ZapatoSombra()),
          Image.asset(zapatoModel.assetImage),
        ],
      ),
    );
  }
}

class _ZapatoSombra extends StatelessWidget {
  const _ZapatoSombra();

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 200,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          boxShadow: [BoxShadow(color: Color(0xffEAA14E), blurRadius: 40)],
        ),
      ),
    );
  }
}
