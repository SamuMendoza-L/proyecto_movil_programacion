import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  static const _background = Color(0xFFFFFCF7);
  static const _text = Color(0xFF2B2923);
  static const _muted = Color(0xFF7B7467);
  static const _iconGreen = Color(0xFF619866);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(30, 54, 30, 30),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(31),
                      child: Image.asset(
                        'assets/images/profile_avatar.png',
                        width: 102,
                        height: 102,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 21),
                    const Text(
                      'Camila Restrepo',
                      style: TextStyle(
                        color: _text,
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'camila.restrepo@correo.com',
                      style: TextStyle(color: _muted, fontSize: 16),
                    ),
                    const SizedBox(height: 17),
                    FilledButton(
                      onPressed: () {},
                      style: FilledButton.styleFrom(
                        backgroundColor: const Color(0xFFF1EBDD),
                        foregroundColor: _text,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 22,
                          vertical: 10,
                        ),
                        minimumSize: Size.zero,
                        shape: const StadiumBorder(),
                      ),
                      child: const Text(
                        'Editar perfil',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(height: 36),
                    const Row(
                      children: [
                        Expanded(
                          child: _StatsCard(
                            number: '14',
                            label: 'Pedidos',
                            background: Color(0xFFE1F1DD),
                            numberColor: Color(0xFF397240),
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: _StatsCard(
                            number: '5',
                            label: 'Productos\nfavoritos',
                            background: Color(0xFFF9E4D2),
                            numberColor: Color(0xFFE3743F),
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: _StatsCard(
                            number: '2',
                            label: 'Alertas activas',
                            background: Color(0xFFF6DFEB),
                            numberColor: Color(0xFFB24476),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 31),
                    _SettingsCard(
                      items: const [
                        _SettingItem(
                          'Mis pedidos',
                          Icons.receipt_long_outlined,
                        ),
                        _SettingItem(
                          'Puntos de entrega',
                          Icons.location_on_outlined,
                        ),
                        _SettingItem(
                          'Preferencias de notificación',
                          Icons.notifications_none_rounded,
                        ),
                        _SettingItem('Apariencia', Icons.nightlight_round),
                        _SettingItem(
                          'Ayuda y soporte',
                          Icons.help_outline_rounded,
                        ),
                      ],
                    ),
                    const SizedBox(height: 31),
                    SizedBox(
                      width: double.infinity,
                      height: 61,
                      child: FilledButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.logout_rounded, size: 20),
                        label: const Text(
                          'Cerrar sesión',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        style: FilledButton.styleFrom(
                          backgroundColor: const Color(0xFFF2EBDD),
                          foregroundColor: const Color(0xFFC5513A),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(30, 0, 30, 24),
              child: _BottomNavigation(),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatsCard extends StatelessWidget {
  const _StatsCard({
    required this.number,
    required this.label,
    required this.background,
    required this.numberColor,
  });

  final String number;
  final String label;
  final Color background;
  final Color numberColor;

  @override
  Widget build(BuildContext context) => Container(
    height: 76,
    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 11),
    decoration: BoxDecoration(
      color: background,
      borderRadius: BorderRadius.circular(19),
      boxShadow: const [
        BoxShadow(
          color: Color(0x16000000),
          blurRadius: 8,
          offset: Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          number,
          style: TextStyle(
            color: numberColor,
            fontSize: 21,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          textAlign: TextAlign.center,
          maxLines: 2,
          style: const TextStyle(
            color: Account._muted,
            fontSize: 12,
            height: 1.08,
          ),
        ),
      ],
    ),
  );
}

class _SettingItem {
  const _SettingItem(this.label, this.icon);

  final String label;
  final IconData icon;
}

class _SettingsCard extends StatelessWidget {
  const _SettingsCard({required this.items});

  final List<_SettingItem> items;

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(23),
      border: Border.all(color: const Color(0xFFE9DFCF)),
      boxShadow: const [
        BoxShadow(
          color: Color(0x14000000),
          blurRadius: 12,
          offset: Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      children: [
        for (var index = 0; index < items.length; index++) ...[
          _SettingsRow(item: items[index]),
          if (index != items.length - 1)
            const Divider(height: 1, color: Color(0xFFE9E0D2)),
        ],
      ],
    ),
  );
}

class _SettingsRow extends StatelessWidget {
  const _SettingsRow({required this.item});

  final _SettingItem item;

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: () {},
    borderRadius: BorderRadius.circular(23),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: const Color(0xFFF2EBDD),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(item.icon, color: Account._iconGreen, size: 21),
          ),
          const SizedBox(width: 17),
          Expanded(
            child: Text(
              item.label,
              style: const TextStyle(
                color: Account._text,
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const Icon(
            Icons.chevron_right_rounded,
            color: Color(0xFF9B9385),
            size: 22,
          ),
        ],
      ),
    ),
  );
}

class _BottomNavigation extends StatelessWidget {
  const _BottomNavigation();

  @override
  Widget build(BuildContext context) => Container(
    height: 78,
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(39),
      border: Border.all(color: const Color(0xFFE9DFCF)),
      boxShadow: const [
        BoxShadow(
          color: Color(0x12000000),
          blurRadius: 12,
          offset: Offset(0, 3),
        ),
      ],
    ),
    child: const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _NavItem('Inicio', Icons.home_outlined),
        _NavItem('Pedidos', Icons.receipt_long_outlined),
        _NavItem('Alertas', Icons.notifications_none_rounded),
        _NavItem('Cuenta', Icons.person_outline_rounded, selected: true),
      ],
    ),
  );
}

class _NavItem extends StatelessWidget {
  const _NavItem(this.label, this.icon, {this.selected = false});

  final String label;
  final IconData icon;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    const accent = Color(0xFFE77B43);
    final color = selected ? accent : const Color(0xFF756F63);

    return Container(
      width: 70,
      height: 61,
      decoration: BoxDecoration(
        color: selected ? const Color(0xFFFBE3D3) : Colors.transparent,
        borderRadius: BorderRadius.circular(17),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
