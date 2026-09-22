import 'package:flutter/material.dart';

class Orders extends StatelessWidget {
  const Orders({required this.userName, super.key});

  /// Dato recibido desde Account mediante Navigator.push.
  final String userName;

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: const Color(0xFFFFFCF7),
    appBar: AppBar(
      backgroundColor: const Color(0xFFFFFCF7),
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        tooltip: 'Volver',
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back_rounded),
      ),
      title: const Text('Mis pedidos'),
    ),
    body: Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Pedidos de $userName',
            style: const TextStyle(
              color: Color(0xFF2B2923),
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Aquí encontrarás el estado de tus compras recientes.',
            style: TextStyle(color: Color(0xFF7B7467), fontSize: 16),
          ),
          const SizedBox(height: 28),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFFE9DFCF)),
            ),
            child: const Row(
              children: [
                Icon(Icons.inventory_2_outlined, color: Color(0xFF619866)),
                SizedBox(width: 14),
                Expanded(
                  child: Text(
                    'Pedido #014 · En camino',
                    style: TextStyle(
                      color: Color(0xFF2B2923),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          OutlinedButton.icon(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_rounded),
            label: const Text('Volver a mi cuenta'),
          ),
        ],
      ),
    ),
  );
}
