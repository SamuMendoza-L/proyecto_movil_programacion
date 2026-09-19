import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  static const _background = Color(0xFFFFFCF7);
  static const _fieldColor = Color(0xFFF4EEE2);
  static const _green = Color(0xFF398640);
  bool _hidePassword = true;

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
              ClipRRect(
                borderRadius: BorderRadius.circular(27),
                child: AspectRatio(
                  aspectRatio: 404 / 206,
                  child: Image.asset(
                    'assets/images/login_market_header.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
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
                obscureText: _hidePassword,
                suffixIcon: IconButton(
                  tooltip: _hidePassword
                      ? 'Mostrar contraseña'
                      : 'Ocultar contraseña',
                  onPressed: () =>
                      setState(() => _hidePassword = !_hidePassword),
                  icon: Icon(
                    _hidePassword
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: const Color(0xFF918878),
                    size: 21,
                  ),
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
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _green,
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
                  onPressed: () {},
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
                    side: const BorderSide(color: Color(0xFFE8DDCB)),
                    backgroundColor: Colors.white,
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
      fillColor: _LoginState._fieldColor,
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
        borderSide: const BorderSide(color: _LoginState._green, width: 1.5),
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
