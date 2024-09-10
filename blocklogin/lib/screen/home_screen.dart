import 'package:blocklogin/bloc/auth_bloc.dart';
import 'package:blocklogin/pallete.dart';
import 'package:blocklogin/screen/login_screen.dart';
import 'package:blocklogin/screen/profile_screen.dart';
import 'package:blocklogin/screen/sereach_screen.dart';
import 'package:blocklogin/screen/team_screen.dart';
import 'package:blocklogin/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    SearchScreen(),
    TeamScreen(),
    ProfileScreen(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        // body: BlocConsumer<AuthBloc, AuthState>(
        //   listener: (context, state) {
        //     if (state is AuthInitial) {
        //       Navigator.pushAndRemoveUntil(
        //         context,
        //         MaterialPageRoute(
        //           builder: (context) => const LoginScreen(),
        //         ),
        //         (route) => false,
        //       );
        //     }
        //   },
        //   builder: (context, state) {
        //     if (state is AuthLoading) {
        //       return const Center(
        //         child: CircularProgressIndicator(),
        //       );
        //     }

        //     return Center(
        //       child: Column(
        //         children: [
        //           Text((state as AuthSuccess).uid),
        //           GradientButton(
        //             onPressed: () {
        //               context.read<AuthBloc>().add(AuthLogoutRequested());
        //             },
        //           ),
        //         ],
        //       ),
        //     );
        //   },
        // ),
        body: _widgetOptions.elementAt(_selectedIndex),

        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.car_crash,
                color: Palette.gradient1,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.commute),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
