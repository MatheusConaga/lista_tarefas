import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informações'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
        iconTheme: const IconThemeData(color: Colors.white, size: 35),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/');
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 58),
            Container(
              height: 180,
              width: 480,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Column(
                children: [
                  SizedBox(height: 28),
                  Row(
                    children: [
                      SizedBox(width: 2),
                      Text(
                        'Disciplina: Programação para \n Dispositivos Móveis',
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontFamily: 'roboco'),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                  SizedBox(height: 28),
                  Row(
                    children: [
                      SizedBox(width: 2),
                      Text(
                        'Professor: Marcel',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),
            Container(
              height: 350,
              width: 970,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Center(
                      child: Text(
                    'Alunos',
                    style: TextStyle(fontSize: 22, color: Colors.white),
                    textAlign: TextAlign.center,
                  )),
                  Row(
                    children: [
                      SizedBox(height: 125),
                      CircleAvatar(
                        radius: 35,
                        backgroundImage: NetworkImage(
                            'https://avatars.githubusercontent.com/u/122986914?s=96&v=4'),
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Milena sotero',
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontFamily: 'Roboto'),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  SizedBox(height: 18),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundImage: NetworkImage(
                            'https://media.licdn.com/dms/image/D4D03AQGMWWi3G9FGgQ/profile-displayphoto-shrink_100_100/0/1697495188201?e=1717632000&v=beta&t=cnIizEuIEdM3P5SdC9z7fqCu-o8wETjxixBB992dmro'),
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Matheus lula',
                        style: TextStyle(fontSize: 22, color: Colors.white),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
