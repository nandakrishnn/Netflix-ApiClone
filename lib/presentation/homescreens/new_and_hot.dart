import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/application/controller/controller_movie.dart';
import 'package:netflix/presentation/Downloads/widgets/refactored_widgets/eveyonr_iswatching_new_hot.dart';
import 'comming_soon_home.dart';

class NewandHot extends StatefulWidget {
  const NewandHot({Key? key}) : super(key: key);

  @override
  State<NewandHot> createState() => _NewandHotState();
}

class _NewandHotState extends State<NewandHot> {
  List upcommingMovies = [];
  List popularMovies = [];
  bool isLoading = true;
  bool isError = false;

  Future<void> upComminngMovies() async {
    try {
      List movies = await MovieService.getUpCommingmovies();
      List popular = await MovieService.getPopularMovies();
      if (mounted) {
        setState(() {
          upcommingMovies = movies;
          popularMovies = popular;
          isLoading = false;
        });
      }
    } catch (e) {
      print('Error fetching upcoming movies: $e');
      if (mounted) {
        setState(() {
          isError = true;
          isLoading = false;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    upComminngMovies();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: const Text(
              'New & Hot',
              style: TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            actions: [
              const Icon(
                Icons.cast,
                color: Colors.white,
                size: 32,
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                width: 30,
                height: 30,
                color: Colors.blue,
              ),
              const SizedBox(
                width: 10,
              )
            ],
            bottom: TabBar(
              isScrollable: false,
              dividerColor: Colors.transparent,
              unselectedLabelColor: Colors.white,
              labelColor: Colors.black,
              labelStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              indicator: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(32),
              ),
              labelPadding: const EdgeInsets.symmetric(horizontal: 5),
              tabs: const [
                Tab(
                  text: ' 🍿 Coming Soon  ',
                ),
                Tab(text: " 👀 Everyone's watching      ")
              ],
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: TabBarView(
          children: [
            isLoading
                ? const Center(
                    child: CupertinoActivityIndicator(
                    radius: 25,
                    color: Colors.white,
                  ))
                : isError
                    ? const Center(child: Text('Error fetching data'))
                    : BuildCommingSoon(commingSoon: upcommingMovies),
            BuildEveyoneIsWatching(
              popularMovies: popularMovies,
            ),
          ],
        ),
      ),
    );
  }
}

class BuildCommingSoon extends StatelessWidget {
  final List commingSoon;
  const BuildCommingSoon({super.key, required this.commingSoon});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: commingSoon.length,
        itemBuilder: (BuildContext context, index) => CommingSoonWidget(
              upcomming: commingSoon[index],
            ));
  }
}

class BuildEveyoneIsWatching extends StatelessWidget {
  final List popularMovies;
  const BuildEveyoneIsWatching({super.key, required this.popularMovies});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, index) => EveryonewatchingWidget(
              everyone: popularMovies[index],
            ));
  }
}
