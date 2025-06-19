import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:shoes_app/src/widgets/widgets.dart';

class ZapatoDescPage extends StatelessWidget {
  const ZapatoDescPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Hero(tag: 'zapato-1', child: ZapatoSizePreview(fullScreen: true)),
              Positioned(
                top: 30,
                child: FloatingActionButton(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  highlightElevation: 0,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.chevron_left,
                    color: Colors.white,
                    size: 60,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ZapatoDescription(
                    titulo: 'Nike Air Max 720',
                    descripcion:
                        "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                  ),
                  _MontoBuyNow(),
                  SizedBox(height: 10),
                  _ColoresYmas(),
                  _BotonesLikeCartSettings(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BotonesLikeCartSettings extends StatelessWidget {
  const _BotonesLikeCartSettings();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _BotonSombreado(Icon(Icons.star, color: Colors.red, size: 25)),
          _BotonSombreado(
            Icon(
              Icons.add_shopping_cart,
              color: Colors.grey.withAlpha(70),
              size: 25,
            ),
          ),

          _BotonSombreado(
            Icon(Icons.settings, color: Colors.grey.withAlpha(70), size: 25),
          ),
        ],
      ),
    );
  }
}

class _BotonSombreado extends StatelessWidget {
  final Icon icon;
  const _BotonSombreado(this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: -5,
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: icon,
    );
  }
}

class _ColoresYmas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(left: 90, child: _BotonColor(Color(0xffC6D642), 4)),
                Positioned(left: 60, child: _BotonColor(Color(0xffFFAD29), 3)),
                Positioned(left: 30, child: _BotonColor(Color(0xff2099F1), 2)),
                _BotonColor(Color(0xff364D56), 1),
              ],
            ),
          ),

          // Spacer(),
          BotonNaranja(
            texto: 'More related items',
            alto: 40,
            ancho: 170,
            color: Color(0xffFFC675),
          ),
        ],
      ),
    );
  }
}

class _BotonColor extends StatelessWidget {
  final Color color;
  final int index;

  const _BotonColor(this.color, this.index);

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: index * 100),
      duration: Duration(milliseconds: 300),
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}

class _MontoBuyNow extends StatelessWidget {
  const _MontoBuyNow();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      margin: EdgeInsets.only(top: 15),
      child: Row(
        children: [
          Text(
            '\$180.0',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Bounce(
            delay: Duration(seconds: 1),
            from: 8,
            child: BotonNaranja(texto: 'Buy now', ancho: 120, alto: 40),
          ),
        ],
      ),
    );
  }
}
