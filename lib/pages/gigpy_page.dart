import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class GiphyPage extends StatefulWidget {
  const GiphyPage({super.key});

  @override
  State<GiphyPage> createState() => _GiphyPageState();
}

class _GiphyPageState extends State<GiphyPage> {
  Future<Map> buscarGifs() async {
    var api = dotenv.env['API_KEY'];
    http.Response res = await http.get(Uri.parse(
        'https://api.giphy.com/v1/gifs/trending?api_key=$api&limit=25&offset=0&rating=g&bundle=messaging_non_clips'));

    if (res.statusCode == 200) {
      return json.decode(res.body);
    } else {
      return {'erro': 'erro'};
    }
  }

  @override
  void initState() {
    buscarGifs().then((value) => print(value));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        appBar: AppBar(
          title: Image.network(
              'https://developers.giphy.com/branch/master/static/header-logo-0fec0225d189bc0eae27dac3e3770582.gif'),
          centerTitle: true,
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const TextField(
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                decoration: InputDecoration(
                  labelText: 'Buscar gifs',
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: FutureBuilder(
                  future: buscarGifs(),
                  builder: ((context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return const Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.blueGrey),
                            strokeAlign: 5,
                          ),
                        );
                      default:
                        if (snapshot.hasError || snapshot.data == null || snapshot.data!['erro'] != null) {
                          return const Center(
                            child: Text('Erro ao buscar gifs'),
                          );
                        } else {
                          var gifs = snapshot.data!["data"];
                          if (gifs == null || gifs.isEmpty) {
                            return const Center(
                              child: Text('Nenhum gif encontrado'),
                            );
                          } else {
                            return GridView.builder(
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 6,
                                mainAxisSpacing: 6,
                              ),
                              itemCount: gifs.length,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  child: Image.network(
                                    gifs[index]["images"]["fixed_height"]["url"],
                                    fit: BoxFit.cover,
                                    height: 300,
                                  ),
                                  onTap: () {},
                                );
                              },
                            );
                          }
                        }
                    }
                  }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
