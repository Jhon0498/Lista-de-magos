import 'package:flutter/material.dart';
import 'mago.dart';

class MagoDetailPage extends StatelessWidget {
  final Mago mago;

  const MagoDetailPage({super.key, required this.mago});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(mago.nome)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text('''
Idade: ${mago.idade}
Nível Mágico: ${mago.nivelMagico}
Inteligência: ${mago.inteligencia}
Mana: ${mago.mana}

Afinidades:
• Fogo: ${mago.afinidadeFogo}
• Água: ${mago.afinidadeAgua}
• Terra: ${mago.afinidadeTerra}
• Ar: ${mago.afinidadeAr}

Feitiços:
• ${mago.feitico1}
• ${mago.feitico2}
• ${mago.feitico3}
''', style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}
