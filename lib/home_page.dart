import 'package:custom/snackbar.dart';
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
                title: Text('Counter App'),
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Count:',
                      style: TextStyle(fontSize: 24),
                    ),
                    Text(
                      '${state.count}',
                      style:
                          TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            SSnackbarUtil.showSnackbar(
                                context, "Incremented", SnackbarType.info);
                            // ScaffoldMessenger.of(context).showSnackBar(
                            //   const SnackBar(
                            //     content: Text('Incremented'),
                            //   ),
                            // );
                            context.read<HomePageBloc>().add(IncrementEvent());
                          },
                          child: Text('+'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            SSnackbarUtil.showSnackbar(
                                context, "Decremented", SnackbarType.info);

                            // ScaffoldMessenger.of(context).showSnackBar(
                            //   const SnackBar(
                            //     content: Text('Decremented'),
                            //   ),
                            // );
                            context.read<HomePageBloc>().add(DecrementEvent());
                          },
                          child: Text('-'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Scaffold(
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
