import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/layout/cubit/cubit.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/modules/details_screen.dart';
import 'constants.dart';

Widget defaultButton({
  double width = 170.0,
  double height = 40,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 3.0,
  required Function() function,
  required String text,
  double shadowSpreadRadius = 0,
  double shadowBlurRadius = 0,
}) =>
    Container(
      height: height,
      child: MaterialButton(
        minWidth: width,
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset.zero,
            spreadRadius: shadowSpreadRadius,
            blurRadius: shadowBlurRadius,
          )
        ],
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,
      ),
    );

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

Widget buildCard(context, int index, MovieCubit cubit) {
  return Stack(
    children: [
      Container(
        width: MediaQuery.of(context).size.width * .90,
        height: MediaQuery.of(context).size.height * .57,
        child: PhysicalModel(
          color: Colors.white,
          elevation: 8,
          shadowColor: Colors.black,
          borderRadius: BorderRadius.circular(20),
          //  margin: EdgeInsets.all(10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image(
              fit: BoxFit.cover,
              image: NetworkImage(cubit.movies[index].poster.toString()),
            ),
          ),
        ),
      ),
      Positioned(
          top: 15,
          right: 15,
          child: IconButton(
            icon: Icon(
              Icons.favorite,
              size: 30,
              color: cubit.isFave ? Colors.red : Colors.white,
            ),
            onPressed: () {
              cubit.changeFavIcon();
            },
          )),
      Positioned(
          right: 50,
          top: 100,
          left: 50,
          bottom: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                cubit.movies[index].title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    cubit.movies[index].runtime,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Text(
                    cubit.movies[index].year,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              )
            ],
          )),
      Positioned(
        left: 15,
        top: 15,
        child: Stack(
          children: [
            Container(
              width: 55,
              height: 55,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.0),
                border: Border.all(color: Colors.white),
              ),
            ),
            Positioned(
              left: 7,
              bottom: 7,
              right: 7,
              top: 7,
              child: Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Center(
                    child: Text(
                  "${cubit.movies[index].rate}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                )),
              ),
            ),
          ],
        ),
      ),
      Positioned(
          bottom: 18,
          right: 20,
          child: defaultButton(
            text: 'Book',
            function: () {
              navigateTo(context, DetailsScreen(index));
            },
            background: Colors.orange,
            width: 90,
            isUpperCase: false,
            height: 35,
          )),
      Positioned(
        bottom: 20,
        left: 20,
        child: SizedBox(
          height: 30,
          width: 200,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index2) => Container(
              alignment: Alignment.center,
              height: 30,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white.withOpacity(0.0),
                border: Border.all(color: Colors.white, width: 2),
              ),

//Make the first letter capital
              child: Text(
                cubit.movies[index].category![index2].replaceFirst(
                    cubit.movies[index].category![index2][0],
                    cubit.movies[index].category![index2][0].toUpperCase()),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            separatorBuilder: (context, index2) => const SizedBox(
              width: 5,
            ),
            itemCount: cubit.movies[index].category!.length,
          ),
        ),
      ),
    ],
  );
}

Widget buildDetailsScreen(context, int index, MovieCubit cubit) {
  return Scaffold(
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .6,
              child: Image(
                image: NetworkImage(cubit.movies[index].poster),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
                top: 50,
                right: 15,
                child: IconButton(
                  icon: Icon(
                    Icons.favorite,
                    size: 30,
                    color: cubit.isFave ? Colors.red : Colors.white,
                  ),
                  onPressed: () {
                    cubit.changeFavIcon();
                  },
                )),
            Positioned(
                left: 20,
                bottom: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      cubit.movies[index].title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          cubit.movies[index].runtime,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Text(
                          cubit.movies[index].year,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 30,
                      width: 200,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index2) => Container(
                          alignment: Alignment.center,
                          height: 30,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white.withOpacity(0.0),
                            border: Border.all(color: Colors.white, width: 2),
                          ),

//Make the first letter capital
                          child: Text(
                            cubit.movies[index].category![index2].replaceFirst(
                                cubit.movies[index].category![index2][0],
                                cubit.movies[index].category![index2][0]
                                    .toUpperCase()),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        separatorBuilder: (context, index2) => const SizedBox(
                          width: 5,
                        ),
                        itemCount: cubit.movies[index].category!.length,
                      ),
                    ),
                  ],
                )),
            Positioned(
              left: 10,
              top: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_circle_left,
                        color: Colors.white,
                        size: 40,
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Stack(
                    children: [
                      Container(
                        width: 55,
                        height: 55,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.0),
                          border: Border.all(color: Colors.white),
                        ),
                      ),
                      Positioned(
                        left: 7,
                        bottom: 7,
                        right: 7,
                        top: 7,
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Center(
                              child: Text(
                            "${cubit.movies[index].rate}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          )),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Synopsis',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                  'The Lion King tells the story of Simba (Swahili for lion), a young lion who is to succeed his father, Mufasa, as King of the Pride Lands; however, after Simba s paternal uncle Scar murders Mufasa to seize the throne, Simba is manipulated into thinking he was responsible and flees into exile.'),
            ],
          ),
        ),
        const Spacer(),
        defaultButton(
            text: 'Book Now',
            function: () {},
            width: MediaQuery.of(context).size.width,
            height: 50,
            background: Colors.orange),
      ],
    ),
  );
}
