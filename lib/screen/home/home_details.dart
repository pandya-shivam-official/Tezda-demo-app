import 'package:flutter/material.dart';
import 'package:demo_application/model/home_model.dart';

class HomeDetails extends StatelessWidget {
  HomeDetails({super.key, required this.homeModel});
  final HomeModel homeModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image(
                  image: NetworkImage(homeModel.url),
                  errorBuilder: (context, error, stackTrace) {
                    return const SizedBox(
                      height: 200,
                      width: 200,
                      child: Text(
                        'No Images found',
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 25),
            Text(
              homeModel.name,
              style: const TextStyle(color: Colors.black, fontSize: 25),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              child: Text(
                homeModel.power,
                style: const TextStyle(color: Colors.black, fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
