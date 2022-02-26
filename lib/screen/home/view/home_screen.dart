import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_it/screen/home/home.dart';
import 'package:watch_it/screen/list/view/list_screen.dart';
import 'package:watch_it/page_2.dart';
import 'package:watch_it/screen/profile/view/profile_screen.dart';
import 'package:watch_it/screen/suggestion/view/suggestion_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final List<Widget> _children = [
    const SuggestionScreen(),
    // const Page2(
    //   color: Colors.green,
    // ),
    const ListScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    final selectedTab = context.select((HomeCubit cubit) => cubit.state.tab);
    return Scaffold(
      body: _children[selectedTab.index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedTab.index,
        onTap: (value) =>
            context.read<HomeCubit>().setTab(HomeTab.values[value]),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Suggestion",
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.search),
          //   label: "Recherche",
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "Vos listes",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profil",
          ),
        ],
      ),
    );
  }
}
