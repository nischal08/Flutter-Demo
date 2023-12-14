import 'package:flutter/material.dart';
import 'counter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BLoC List Views Example'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            VerticalListView(),
            Divider(),
            HorizontalListView(),
            Divider(),
            VerticalListView(),
          ],
        ),
      ),
    );
  }
}

class VerticalListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: counterBloc.counterStream,
      builder: (context, snapshot) {
        return ListView.separated(
          separatorBuilder: (context, index) => const Divider(),
          physics: const ClampingScrollPhysics(),
          itemCount: 100,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Item ${index + 1}'),
            );
          },
        );
      },
    );
  }
}

class HorizontalListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: counterBloc.counterStream,
      builder: (context, snapshot) {
        return Container(
          height: 40.0,
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(width: 16),
            scrollDirection: Axis.horizontal,
            itemCount: 100,
            itemBuilder: (context, index) {
              return Card(
                
                  // decoration: BoxDecoration(border: Border.all()),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Item ${index + 1}'),
                  ));
            },
          ),
        );
      },
    );
  }
}
