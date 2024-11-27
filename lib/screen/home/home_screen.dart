import 'package:demo_application/screen/home/home_details.dart';
import 'package:flutter/material.dart';
import 'package:demo_application/model/home_model.dart';
import 'package:demo_application/services/home_servies.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<HomeModel> userdata = [];

  @override
  void initState() {
    fetchdata();
    super.initState();
  }

  Future<void> fetchdata() async {
    final response = await HomeScreenApi.fetchData();

    setState(() {
      userdata = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Super Hero',
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Montserrat",
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: userdata.length,
        itemBuilder: (context, index) {
          final user = userdata[index];
          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeDetails(homeModel: userdata[index]),
                ),
              );
            },
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image(
                image: NetworkImage(user.url),
                errorBuilder: (context, error, stackTrace) {
                  return const SizedBox(
                    height: 50,
                    width: 50,
                    child: Text(
                      'No Images found',
                      style: TextStyle(fontSize: 10),
                      textAlign: TextAlign.center,
                    ),
                  );
                },
                fit: BoxFit.fill,
                width: 50,
                height: 50,
              ),
            ),
            title: Text(user.name),
            subtitle: Text(
              user.power,
              maxLines: 2,
            ),
          );
        },
      ),
    );
  }
}
