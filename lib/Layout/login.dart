import 'package:flutter/material.dart';
import 'package:proyecto_movil_navegacion/Layout/account.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  static const _background = Color(0xFFFFFCF7);
  static const _fieldColor = Color(0xFFF4EEE2);
  static const _green = Color(0xFF398640);
  static const _buttonColor = Color(0xFFB9674A);

  @override
  Widget build(BuildContext context) {
    final horizontalPadding = MediaQuery.sizeOf(context).width < 380
        ? 24.0
        : 34.0;

    return Scaffold(
      backgroundColor: _background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(
            horizontalPadding,
            31,
            horizontalPadding,
            34,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const _MarketIllustration(),
              const SizedBox(height: 52),
              const Text(
                'Bienvenido de vuelta',
                style: TextStyle(
                  color: Color(0xFF282721),
                  fontSize: 29,
                  fontWeight: FontWeight.w700,
                  height: 1.12,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Inicia sesión para ver tus pedidos y tu carrito\nguardado.',
                style: TextStyle(
                  color: Color(0xFF7D7568),
                  fontSize: 17,
                  height: 1.28,
                ),
              ),
              const SizedBox(height: 38),
              const _FieldLabel('Correo electrónico'),
              const SizedBox(height: 10),
              const _LoginTextField(
                hintText: 'nombre@correo.com',
                prefixIcon: Icons.mail_outline_rounded,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 19),
              const _FieldLabel('Contraseña'),
              const SizedBox(height: 10),
              _LoginTextField(
                hintText: '••••••••',
                prefixIcon: Icons.lock_outline_rounded,
                obscureText: true,
                suffixIcon: const Icon(
                  Icons.visibility_off_outlined,
                  color: Color(0xFF918878),
                  size: 21,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: _green,
                    padding: const EdgeInsets.only(top: 14, bottom: 13),
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: const Text(
                    '¿Olvidaste tu contraseña?',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              SizedBox(
                height: 68,
                child: ElevatedButton(
                  onPressed: () => _openAccount(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _buttonColor,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17),
                    ),
                  ),
                  child: const Text(
                    'Iniciar sesión',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              const _DividerText('o continúa con'),
              const SizedBox(height: 19),
              SizedBox(
                height: 68,
                child: OutlinedButton.icon(
                  onPressed: () => _openAccount(context),
                  icon: const Text(
                    'G',
                    style: TextStyle(
                      color: Color(0xFF4285F4),
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  label: const Text(
                    'Continuar con Google',
                    style: TextStyle(
                      color: Color(0xFF292720),
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFFE4C6B9)),
                    backgroundColor: const Color(0xFFFFF8F4),
                    elevation: 2,
                    shadowColor: const Color(0x24000000),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 29),
              Center(
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(color: Color(0xFF7D7568), fontSize: 16),
                    children: [
                      TextSpan(text: '¿No tienes cuenta?  '),
                      TextSpan(
                        text: 'Regístrate',
                        style: TextStyle(
                          color: _green,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openAccount(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const Account(userName: 'Camila Restrepo'),
      ),
    );
  }
}

class _FieldLabel extends StatelessWidget {
  const _FieldLabel(this.text);

  final String text;

  @override
  Widget build(BuildContext context) => Text(
    text,
    style: const TextStyle(
      color: Color(0xFF282721),
      fontSize: 15.5,
      fontWeight: FontWeight.w700,
    ),
  );
}

class _MarketIllustration extends StatelessWidget {
  const _MarketIllustration();

  @override
  Widget build(BuildContext context) => ClipRRect(
    borderRadius: BorderRadius.circular(27),
    child: AspectRatio(
      aspectRatio: 404 / 206,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF7D9C4), Color(0xFFE9B899)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: -42,
              right: -24,
              child: _Circle(color: Color(0x55FFF8E7), size: 155),
            ),
            Positioned(
              bottom: -58,
              left: -14,
              child: _Circle(color: Color(0x556B9271), size: 180),
            ),
            Positioned(
              top: 30,
              left: 43,
              child: Transform.rotate(
                angle: -.16,
                child: const Icon(
                  Icons.eco_rounded,
                  size: 92,
                  color: Color(0xFF4E8060),
                ),
              ),
            ),
            const Positioned(
              right: 49,
              bottom: 27,
              child: Icon(
                Icons.local_florist_rounded,
                size: 86,
                color: Color(0xFFAE5B4F),
              ),
            ),
            const Positioned(
              left: 146,
              bottom: 41,
              child: Icon(
                Icons.spa_rounded,
                size: 44,
                color: Color(0xFF5D8B64),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class _Circle extends StatelessWidget {
  const _Circle({required this.color, required this.size});

  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) => Container(
    width: size,
    height: size,
    decoration: BoxDecoration(color: color, shape: BoxShape.circle),
  );
}

class _LoginTextField extends StatelessWidget {
  const _LoginTextField({
    required this.hintText,
    required this.prefixIcon,
    this.keyboardType,
    this.obscureText = false,
    this.suffixIcon,
  });

  final String hintText;
  final IconData prefixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) => TextField(
    keyboardType: keyboardType,
    obscureText: obscureText,
    style: const TextStyle(color: Color(0xFF282721), fontSize: 17),
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(color: Color(0xFF82796B), fontSize: 17),
      filled: true,
      fillColor: Login._fieldColor,
      contentPadding: const EdgeInsets.symmetric(vertical: 20),
      prefixIcon: Icon(prefixIcon, color: const Color(0xFF918878), size: 21),
      suffixIcon: suffixIcon,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(17),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(17),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(17),
        borderSide: const BorderSide(color: Login._green, width: 1.5),
      ),
    ),
  );
}

class _DividerText extends StatelessWidget {
  const _DividerText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      const Expanded(child: Divider(color: Color(0xFFE5D9C4), thickness: 1)),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          text,
          style: const TextStyle(color: Color(0xFF7D7568), fontSize: 14),
        ),
      ),
      const Expanded(child: Divider(color: Color(0xFFE5D9C4), thickness: 1)),
    ],
  );
}
