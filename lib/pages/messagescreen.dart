import 'package:flutter/material.dart';

import '../components/message_card.dart';

class MessageScreen extends StatelessWidget{
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pranešimai'),
      ),
      body: Center(
        child: ListView(
          children: [
            MessageCard(
              senderName: 'VU IS automatinis siuntėjas',
              messageSnippet: 'Kviečiame sudalyvauti VU Sumaniosios ',
              fullMessage:'praktikos komandos kartu su Igničio grupe atliekamame tyrime apie žalias investicijas ir užpildyti šią anketą: https://forms.office.com/e/zFubJGfT9v' ,
              time: '12:45',
              isUnread: true,
            ),
            MessageCard(
              senderName: 'VU Administratorius',
              messageSnippet: 'Primename apie rytojaus paskaitą.',
              fullMessage:'Nepamiršk pateikti projekto iki penktadienio 18:00 val. Jei reikia pagalbos, susisiek su manimi.' ,
              time: '10:15',
            ),
          ],
        )
      ),
    );
  }
}