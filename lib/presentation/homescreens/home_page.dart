
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/application/controller/controller_movie.dart';
import 'package:netflix/core/colors.dart';
import 'package:netflix/presentation/Downloads/widgets/refactored_widgets/baground_card_mainpage.dart';
import 'package:netflix/presentation/Downloads/widgets/refactored_widgets/home_main_card.dart';
import 'package:netflix/presentation/Downloads/widgets/refactored_widgets/number_titile_card.dart';

// ignore: non_constant_identifier_names
ValueNotifier<bool> ScrollNotifier = ValueNotifier(true);

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List nowplaying = [];
  List toprated = [];
  List popular = [];
  List upcommingMovies=[];
  List clone=[];
  Future getAllMovie() async {
    nowplaying = await MovieService.getNowPlayingMovies();
    toprated = await MovieService.getTopRatedMovies();
    popular = await MovieService.getPopularMovies();
    upcommingMovies=await MovieService.getUpCommingmovies();
    clone=await MovieService.getUpCommingmovies();
    setState(() {});
  }

  @override
  void initState() {
    getAllMovie();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
            valueListenable: ScrollNotifier,
            builder: (BuildContext context, index, _) {
              return NotificationListener<UserScrollNotification>(
                onNotification: (notification) {
                  final ScrollDirection direction = notification.direction;
                  print(direction);
                  if (direction == ScrollDirection.reverse) {
                    ScrollNotifier.value = false;
                  } else if (direction == ScrollDirection.forward) {
                    ScrollNotifier.value = true;
                  }

                  return true;
                },
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          
                          const Bagroundcard(),
                          Maincardhome(
                            movies: toprated,
                            title: 'Released in the past year',
                          ),
                          kheight,
                          Maincardhome(
                            movies: nowplaying,
                            title: 'Trending Now',
                          ),
                          kheight,
                           NumberWidget(
                            popular: clone,
                           ),
                          Maincardhome(
                              movies: popular, title: "Tense Dramas"),
                          kheight,
                          Maincardhome(
                              movies: upcommingMovies, title: "South Indian Cinema"),
                          kheight,
                        ],
                      ),
                    ),
                    ScrollNotifier.value == true
                        ? AnimatedContainer(
                            duration: const Duration(milliseconds: 1000),
                            child: Container(
                              width: double.infinity,
                              height: 115,
                              color: Colors.black.withOpacity(.3),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/netflix-logo-png-hd-116606008027stwkbpdxc-removebg-preview.png',
                                        height: 85,
                                        width: 85,
                                      ),
                                      const Spacer(),
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
                                  ),
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "TV Shows",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text("Movies",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold)),
                                      Text("Categories",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        : kheight
                  ],
                ),
              );
            }));
  }
}
