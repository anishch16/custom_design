import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_page_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageBloc(),
      child: BlocBuilder<HomePageBloc, HomePageState>(
        builder: (context, state) {
          if (state is CounterState) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Counter App'),
              ),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child: Column(
                    children: [
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Container(
                                height: 300,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        "https://img.freepik.com/free-photo/abstract-glowing-flame-drops-electric-illumination-generative-ai_188544-8092.jpg?w=360&t=st=1713874187~exp=1713874787~hmac=0350e9258c5400c8d5e15d925331917d82fd9f2fa30578729fc370a4a6aac553"),
                                  ),
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              const SizedBox(height: 12),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // ElevatedButton(
                                  //   onPressed: () {
                                  //     context.read<HomePageBloc>().add(IncrementEvent());
                                  //   },
                                  //   child: Text('+'),
                                  // ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          print('Toggle button pressed');
                                          context
                                              .read<HomePageBloc>()
                                              .add(LikeEvent());
                                          state.like
                                              ? context
                                                  .read<HomePageBloc>()
                                                  .add(DecrementEvent())
                                              : context
                                                  .read<HomePageBloc>()
                                                  .add(IncrementEvent());
                                        },
                                        child: AnimatedSwitcher(
                                            duration: const Duration(
                                                milliseconds: 100),
                                            switchInCurve: Curves.easeInOut,
                                            switchOutCurve: Curves.easeInOut,
                                            transitionBuilder:
                                                (child, animation) {
                                              return TweenAnimationBuilder(
                                                duration: const Duration(
                                                    milliseconds: 500),
                                                tween: Tween<double>(
                                                    begin: 0, end: 1),
                                                builder:
                                                    (context, value, child) {
                                                  final scaleValue = Curves
                                                      .elasticOut
                                                      .transform(value);
                                                  return Transform.scale(
                                                    scale: scaleValue,
                                                    child: child,
                                                  );
                                                },
                                                child: child,
                                              );
                                            },
                                            child: state.like
                                                ? Icon(
                                                    Icons.thumb_up_alt_rounded,
                                                    key: ValueKey<bool>(
                                                        state.like),
                                                    size: 32,
                                                    color: Colors.blue,
                                                  )
                                                : Icon(
                                                    Icons
                                                        .thumb_up_off_alt_outlined,
                                                    key: ValueKey<bool>(
                                                        !state.like),
                                                    size: 32,
                                                  )),
                                      ),
                                      const SizedBox(width: 6.0),
                                      Text(
                                        '${state.count}',
                                        key: ValueKey<String>(
                                            "Like_${state.count}"),
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(width: 6.0),
                                      const Text(
                                        'Like',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  // const Spacer(),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          print('Toggle button pressed');
                                          context
                                              .read<HomePageBloc>()
                                              .add(DisLikeEvent());
                                          state.dislikeBool
                                              ? context
                                                  .read<HomePageBloc>()
                                                  .add(DecrementEventDislike())
                                              : context
                                                  .read<HomePageBloc>()
                                                  .add(IncrementEventDislike());
                                        },
                                        child: AnimatedSwitcher(
                                            duration: const Duration(
                                                milliseconds: 100),
                                            switchInCurve: Curves.easeInOut,
                                            switchOutCurve: Curves.easeInOut,
                                            transitionBuilder:
                                                (child, animation) {
                                              return TweenAnimationBuilder(
                                                duration: const Duration(
                                                    milliseconds: 500),
                                                tween: Tween<double>(
                                                    begin: 0, end: 1),
                                                builder:
                                                    (context, value, child) {
                                                  final scaleValue = Curves
                                                      .elasticOut
                                                      .transform(value);
                                                  return Transform.scale(
                                                    scale: scaleValue,
                                                    child: child,
                                                  );
                                                },
                                                child: child,
                                              );
                                            },
                                            child: state.dislikeBool
                                                ? Icon(
                                                    Icons
                                                        .thumb_down_alt_rounded,
                                                    key: ValueKey<bool>(
                                                        state.dislikeBool),
                                                    size: 32,
                                                    color: Colors.blue,
                                                  )
                                                : Icon(
                                                    Icons
                                                        .thumb_down_off_alt_outlined,
                                                    key: ValueKey<bool>(
                                                        !state.dislikeBool),
                                                    size: 32,
                                                  )),
                                      ),
                                      const SizedBox(width: 6.0),
                                      Text(
                                        '${state.dislike}',
                                        key: ValueKey<String>(
                                            "dislike_${state.dislike}"),
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(width: 6.0),
                                      const Text(
                                        'Dislike',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  // ElevatedButton(
                                  //   onPressed: () {
                                  //     context.read<HomePageBloc>().add(DecrementEvent());
                                  //   },
                                  //   child: Text('-'),
                                  // ),
                                ],
                              ),
                              const SizedBox(height: 12),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
