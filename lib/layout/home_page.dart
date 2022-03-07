import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/layout/cubit/cubit.dart';
import 'package:movie_app/layout/cubit/states.dart';
import 'package:movie_app/shared/components.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size? size = MediaQuery.of(context).size;

    return BlocConsumer<MovieCubit, MovieStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = MovieCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Movies',
                style: TextStyle(color: Colors.black, fontSize: 22),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.filter,
                    color: Colors.grey,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 5, right: 20, top: 10),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 20, // Image radius
                  backgroundImage: NetworkImage(
                      'https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                ),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      defaultButton(
                        text: 'Now Showing',
                        function: () {},
                        background: Colors.orange,
                        isUpperCase: false,
                        shadowBlurRadius: 2,
                        shadowSpreadRadius: 1,
                      ),
                      defaultButton(
                        text: 'Coming Soon',
                        function: () {},
                        background: Colors.grey,
                        isUpperCase: false,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: size.width * .90,
                    height: size.height * .80,
                    child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) =>
                          buildCard(context, index, cubit),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 20,
                      ),
                      itemCount: cubit.movies.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
