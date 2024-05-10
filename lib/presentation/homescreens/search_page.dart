import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/application/controller/controller_movie.dart';
import 'package:netflix/application/model/movie_model.dart';
import 'package:netflix/core/colors.dart';
import 'package:netflix/presentation/Downloads/widgets/main_page/widegts/search/search_idle.dart';
import 'package:netflix/presentation/Downloads/widgets/main_page/widegts/search/search_result_page.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final controller = TextEditingController();
  List<Movie> popoular = [];

  List<Movie> SearchResults = [];
  bool istapped = true;
  Future getPopular() async {
    if (mounted) {
      popoular = await MovieService.getPopularMovies();
      setState(() {});
    }
  }

  _onSearchChanges() async {
    if (controller.text.isEmpty) {
      setState(() {
        istapped = true;
        SearchResults.clear();
      });
    } else {
      await _featchdataFromServer(controller.text);
    }
  }

  Future _featchdataFromServer(String query) async {
    List<Movie> result = await searchfunction(query);
    setState(() {
      istapped = false;
      SearchResults = result;
    });
  }

  @override
  void initState() {
    if (mounted) {
      getPopular();
      controller.text = '';
      super.initState();
      controller.addListener(_onSearchChanges);
      getPopular();
    }
  }

  @override
  void dispose() {
    controller.removeListener(_onSearchChanges);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CupertinoSearchTextField(
                onChanged: (value) {
                  setState(() {
                    value.isEmpty ? istapped = true : istapped = false;
                    _featchdataFromServer(value);
                  });
                },
                backgroundColor: Colors.grey.withOpacity(.4),
                prefixIcon: const Icon(
                  CupertinoIcons.search,
                  color: Colors.grey,
                ),
                suffixIcon: const Icon(
                  CupertinoIcons.xmark_circle_fill,
                  color: Colors.grey,
                ),
                style: const TextStyle(color: Colors.white),
              ),
              kheight,
              _isEmpty(controller.text)
            ],
          ),
        ),
      ),
    );
  }

  Widget _isEmpty(String value) {
    return istapped
        ? Expanded(
            child: SearchIdle(
            result: popoular.isNotEmpty ? popoular : [],
          ))
        : Expanded(
            child: Searchresultresult(
            result: SearchResults,
          ));
  }

  Future<List<Movie>> searchfunction(String query) async {
    const apiKey = 'f0f46b532513ee4aab46515cf5603265';
    const baseUrl = 'https://api.themoviedb.org/3/search/movie';

    int maxtries = 3;
    int mintries = 0;
    while (maxtries > mintries) {
      try {
        final response =
            await http.get(Uri.parse('$baseUrl?api_key=$apiKey&query=$query'));

        if (response.statusCode == 200) {
          final List<dynamic> data = jsonDecode(response.body)['results'];
          return data
              .map((json) => Movie.fromJson(json))
              .toList()
              .cast<Movie>();
        }
      } catch (e) {
        print('Error in fetching the data');
      }
      mintries++;
    }
    return [];
  }
}
