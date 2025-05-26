import 'package:flutter/material.dart';
import 'dart:convert';
import 'mago.dart';
import 'mago_detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Magos',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const ListaMagosPage(),
    );
  }
}

class ListaMagosPage extends StatelessWidget {
  const ListaMagosPage({super.key});

  Future<List<Mago>> carregarMagos() async {
    final String jsonStr = '''
{
  "magos": [
    {
      "nome": "Arcturus",
      "idade": 120,
      "nivelMagico": 95,
      "inteligencia": 97.5,
      "mana": 850.0,
      "afinidadeFogo": 75,
      "afinidadeAgua": 60,
      "afinidadeTerra": 85,
      "afinidadeAr": 50,
      "feitico1": "Bola de Fogo",
      "feitico2": "Terremoto",
      "feitico3": "Cura Avançada"
    },
    {
      "nome": "Selene",
      "idade": 98,
      "nivelMagico": 88,
      "inteligencia": 93.0,
      "mana": 790.0,
      "afinidadeFogo": 55,
      "afinidadeAgua": 90,
      "afinidadeTerra": 40,
      "afinidadeAr": 85,
      "feitico1": "Gelo Congelante",
      "feitico2": "Nevoeiro Mágico",
      "feitico3": "Escudo de Vento"
    },
    {
      "nome": "Thalos",
      "idade": 135,
      "nivelMagico": 99,
      "inteligencia": 99.0,
      "mana": 920.0,
      "afinidadeFogo": 95,
      "afinidadeAgua": 30,
      "afinidadeTerra": 70,
      "afinidadeAr": 40,
      "feitico1": "Inferno Flamejante",
      "feitico2": "Muralha de Pedra",
      "feitico3": "Explosão Arcana"
    }
  ]
}
''';
    final data = json.decode(jsonStr);
    final List magosJson = data['magos'];
    return magosJson.map((e) => Mago.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Magos')),
      body: FutureBuilder<List<Mago>>(
        future: carregarMagos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nenhum mago encontrado.'));
          } else {
            final magos = snapshot.data!;
            return ListView.builder(
              itemCount: magos.length,
              itemBuilder: (context, index) {
                final mago = magos[index];
                return ListTile(
                  title: Text(mago.nome),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MagoDetailPage(mago: mago),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
