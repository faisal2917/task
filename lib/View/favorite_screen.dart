import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:movie_api_task/Controllers/home_controller.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Center(child: Text("favorite screen      ")),
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView.builder(
        itemCount: controller.favoriteMovies.length,
        itemBuilder: (context, index) {
          return controller.favoriteMovies.isEmpty
              ? Text("You have no favorite movie")
              : ListTile(
                  leading: SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        Container(
                            width: 20,
                            child: Center(
                              child: Text(controller.favoriteMovies[index].id
                                  .toString()),
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
                  title:
                      Text(controller.favoriteMovies[index].movie.toString()),
                  trailing:
                      Text(controller.favoriteMovies[index].rating.toString()),
                );
        },
      ),
    ));
  }
}
