import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_api_task/Controllers/home_controller.dart';
import 'package:movie_api_task/Model/movie_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.fetchMovie();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Center(child: Text('App Bar')),
          backgroundColor: Colors.purple,
        ),
        body: Center(
          child: FutureBuilder<List<Movie>>(
            // The future to which this builder is connected
            future: controller.fetchMovie(),
            // A callback that gets called with the latest snapshot of the asynchronous task
            builder: (index, AsyncSnapshot<List<Movie>> snapshot) {
              // Check the connection state of the Future
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Text('Press button to start.');
                case ConnectionState.active:
                case ConnectionState.waiting:
                  return Text('Awaiting result...');
                case ConnectionState.done:
                  // Check if the Future completed with an error
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    List<Movie>? movies = snapshot.data;
                    return ListView.builder(
                      itemCount: movies!.length,
                      itemBuilder: (context, index) {
                        Movie currentItem = movies[index];
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            height: context.height * 0.10,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: ListTile(
                                leading: SizedBox(
                                  width: 100,
                                  child: Row(
                                    children: [
                                      Container(
                                          width: 20,
                                          child: Center(
                                            child: Text(
                                                movies[index].id.toString()),
                                          )),
                                      Container(
                                        child: Image(image: NetworkImage(
                                            // "${snapshot.data![index].imdbUrl.toString() + snapshot.data![index].image.toString()}",
                                            // scale: 1.0
                                            "https://images.pexels.com/photos/1547813/pexels-photo-1547813.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")),
                                      ),
                                    ],
                                  ),
                                ),
                                title: Text(movies[index].movie.toString()),
                                trailing: GetBuilder<HomeController>(
                                    id: 'updateButton',
                                    builder: (context) {
                                      return IconButton(
                                          onPressed: () {
                                            if (controller.favoriteMovies
                                                .contains(currentItem)) {
                                              controller.favoriteMovies
                                                  .remove(currentItem);
                                            } else {
                                              controller.favoriteMovies
                                                  .add(currentItem);
                                            }
                                            setState(() {});
                                            // snapshot.data![index].faverout == true
                                            //     ? snapshot
                                            //             .data![index].faverout ==
                                            //         false
                                            //     : snapshot
                                            //             .data![index].faverout ==
                                            //         true;
                                            // controller.faverout();

                                            // print(
                                            //     "in button.. ${snapshot.data![index].faverout.toString()}");
                                            // controller.update(['updateButton']);
                                          },
                                          icon: Icon(
                                            Icons.favorite,
                                            color: controller.favoriteMovies
                                                    .contains(currentItem)
                                                ? Colors.red
                                                : Colors.grey,
                                          ));
                                    }),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
              }
            },
          ),
        ),
        //  Column(
        //   children: [
        //     Center(
        //       child: Text(controller.gnText),
        //     )
        //   ],
        // ),
      ),
    );
  }
}
