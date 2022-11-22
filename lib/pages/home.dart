import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:m3/routes/router.gr.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  final String title = "My Home Page";

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: [
        CounterRoute(),
        const TweetRoute(),
        const AnimationRoute(),
        const Animation2Route(),
        const Animation3Route(),
      ],
      builder: (context, child, animation) {
        final tabRouter = AutoTabsRouter.of(context);

        return Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: FadeTransition(
            opacity: animation,
            child: child,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabRouter.activeIndex,
            onTap: (index) {
              tabRouter.setActiveIndex(index);
            },
            items: const [
              BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: 'Tweet',
                icon: Icon(Icons.message),
              ),
              BottomNavigationBarItem(
                label: 'Anim',
                icon: Icon(Icons.animation),
              ),
              BottomNavigationBarItem(
                label: 'Anim 2',
                icon: Icon(Icons.abc),
              ),
              BottomNavigationBarItem(
                label: 'Anim 3',
                icon: Icon(Icons.timer),
              ),
            ],
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.blue,
            selectedItemColor: Colors.amber,
          ),
        );
      },
    );
  }
}
