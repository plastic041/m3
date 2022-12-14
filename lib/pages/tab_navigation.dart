import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:m3/routes/router.gr.dart';

class TabNavigationPage extends StatelessWidget {
  const TabNavigationPage({
    super.key,
  });

  final String title = "My Home Page";

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        PostsRootRouter(),
        FidgetRouter(),
      ],
      builder: (context, child, animation) {
        final tabRouter = AutoTabsRouter.of(context);

        return Scaffold(
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
                label: 'Tweet',
                icon: Icon(Icons.message),
              ),
              BottomNavigationBarItem(
                label: 'Anim',
                icon: Icon(Icons.animation),
              ),
            ],
            type: BottomNavigationBarType.fixed,
          ),
        );
      },
    );
  }
}
