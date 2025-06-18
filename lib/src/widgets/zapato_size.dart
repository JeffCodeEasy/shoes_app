import 'package:flutter/material.dart';

class ZapatoSizePreview extends StatelessWidget {
  const ZapatoSizePreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      child: Container(
        width: double.infinity,
        height: 430,
        decoration: BoxDecoration(
          color: Color(0xffFFCF53),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Column(
          children: [
            // Zapato con su sombra
            _ZapatoConSombra(),
            // Tallas
            _ZapatosTallas(),
          ],
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
    return Container(
      alignment: Alignment.center,
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: (numero == 9) ? Color(0xffF1A23A) : Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          if (numero == 9)
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
          color: (numero == 9) ? Colors.white : Color(0xffF1A23A),
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _ZapatoConSombra extends StatelessWidget {
  const _ZapatoConSombra();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Stack(
        children: [
          Positioned(bottom: 10, right: 0, child: _ZapatoSombra()),
          Image.asset('assets/imgs/amarillo.png'),
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
