import 'package:flutter/material.dart';
import 'db_helper.dart';
import 'penutup_page.dart';

class DoaPage extends StatefulWidget {
  const DoaPage({super.key});

  @override
  State<DoaPage> createState() => _DoaPageState();
}

class _DoaPageState extends State<DoaPage> {
  String nama = '';

  @override
  void initState() {
    super.initState();
    loadNama();
  }

  Future<void> loadNama() async {
    final data = await DBHelper.getLastData();
    setState(() {
      nama = data['nama'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Doa Ziarah Kubur")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              "Doa untuk $nama",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  '''
اَلسَّلَامُ عَلَيْكُمْ أَهْلَ الدِّيَارِ مِنَ الْمُؤْمِنِيْنَ وَالْمُسْلِمِيْنَ
وَإِنَّا إِنْ شَاءَ اللهُ بِكُمْ لَاحِقُوْنَ
اَللّٰهُمَّ اغْفِرْ لَهُمْ وَارْحَمْهُمْ
وَعَافِهِمْ وَاعْفُ عَنْهُمْ
وَأَكْرِمْ نُزُلَهُمْ وَوَسِّعْ مُدْخَلَهُمْ

إِلَى حَضْرَةِ النَّبِيِّ الْمُصْطَفَى سَيِّدِنَا مُحمَّدٍ صَلَّى اللهُ عَلَيْهِ وَسَلَّمَ وَاٰلِهِ وَأَزْوَاجِهِ وَأَوْلَادِهِ وَذُرِّيَّاتِهِ الْفَــاتِحَةُ

ثُمَّ إِلَى حَضْرَةِ إِخْوَانِهِ مِنَ الْأَنْبِيَاءِ وَالْمُرْسَلِيْنَ وَالْأَوْلِيَاءِ وَالشُّهَدَاءِ وَالصَّالِحِيْنَ وَالصَّحَابَةِ وَالتَّابِعِيْنَ وَالْعُلَمَاءِ الْعَامِلِيْنَ وَالْمُصَنِّفِيْنَ الْمُخْلِصِيْنَ وَجَمِيْعِ الْمَلَائِكَةِ الْمُقَرَّبِيْنَ، خُصُوْصًا إِلَى سَيِّدِنَا الشَّيْخِ عَبْدِ الْقَادِرِ الْجِيْلَانِي وَخُصُوْصًا إِلَى مُؤَسِّسِيْ جَمْعِيَّةِ نَهْضَةِ الْعُلَمَاءِ الْفَــاتِحَةُ

ثُمَّ إِلَى جَمِيْعِ أَهْلِ الْقُبُوْرِ مِنَ الْمُسْلِمِيْنَ وَالْمُسْلِمَاتِ وَالْمُؤْمِنِيْنَ وَالْمُؤْمِنَاتِ مِنْ مَشَارِقِ الْأَرْضِ إِلَى مَغَارِبِهَا بَرِّهَا وَبَحْرِهَا خُصُوْصًا إِلَى اٰبَائِنَا وَأُمَّهَاتِنَا وَأَجْدَادِنَا وَجَدَّاتِنَا وَمَشَايِخِنَا وَمَشَايِخِ مَشَايِخِنَا وَأَسَاتِذَةِ أَسَاتِذَتِنَا وَلِمَنْ أَحْسَنَ إِلَيْنَا وَلِمَنِ اجْتَمَعْنَا هٰهُنَا بِسَبَبِهِ الْفَاتِحَةُ

ثُمَّ إِلَى جَمِيْعِ أهْلِ الْقُبُوْرِ مِمَّنْ ذُكِرَتْ أَسْمَاؤُهُ فِيْ هٰذِهِ الرِّسَالَةِ حَضْرَةِ رُوْحِ … وَحَضْرَةِ رُوْحِ … وَحَضْرَةِ رُوْحِ … رَحِمَهُمُ اللهُ وَغَفَرَهُمْ، الْفَاتِحَةُ
                  ''',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 22, height: 1.8),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const PenutupPage()),
                );
              },
              child: const Text("Penutup"),
            ),
          ],
        ),
      ),
    );
  }
}
