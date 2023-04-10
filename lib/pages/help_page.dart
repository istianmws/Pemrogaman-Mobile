import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basic Usage'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selamat DATANG!',
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(height: 16),
            Text(
              'Untuk melanjutkan, ikuti langkah-langkah berikut ini:',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(height: 16),
            Text(
              'Step 1: Ada 4 menu utama pada home screen',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(height: 8),
            Text(
              'Tap untuk mebukanya.',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            SizedBox(height: 16),
            Text(
              'Step 2: Terdapat tombol logout pada atas dan bawah',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(height: 8),
            Text(
              'Tap untuk keluar app.',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            SizedBox(height: 16),
            Text(
              'Step 3: Silahkan download saja',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(height: 8),
            Text(
              'ada di github istianmws repo Pemrogaman-Mobile.',
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),
      ),
    );
  }
}
