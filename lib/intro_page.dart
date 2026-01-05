import 'package:flutter/material.dart';
import 'db_helper.dart';
import 'doa_page.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final TextEditingController namaController = TextEditingController();

  Future<void> lanjut() async {
    if (namaController.text.isEmpty) return;

    await DBHelper.deleteAll();
    await DBHelper.insertNama(namaController.text);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const DoaPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ziarah Kubur")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/foto/megawati.jpeg'),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: namaController,
              decoration: const InputDecoration(
                labelText: 'Nama Almarhum / Almarhumah',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: lanjut,
              child: const Text("Lanjutkan Doa"),
            ),
          ],
        ),
      ),
    );
  }
}
