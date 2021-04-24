import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/user_manager.dart';

class CustomDrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(50, 20, 20, 1),
      height: 280,
      child: Consumer<UserManager>(
        builder: (_, userManager, __) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.all(
                    Radius.circular(70),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFC5B8B8),
                      offset: Offset(5, 5),
                      blurRadius: 10,
                    ),
                    BoxShadow(
                      color: Color(0xFFFFFFFF),
                      offset: Offset(-5, -5),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: CircularProfileAvatar(
                  'https://cdn.donmai.us/original/12/97/__miyamoto_frederica_idolmaster_and_1_more_drawn_by_uraichishi__1297e5df929de847606afe22d6b52df8.jpg',
                  radius: 60,
                  borderWidth: 15,
                  borderColor: const Color(0xFF85E227),
                  onTap: () {
                    //print('Avatar');
                  },
                  showInitialTextAbovePicture: true,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Green Store',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4A544C),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Hello, ${userManager.user?.name ?? ''}',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 13,
              ),
              GestureDetector(
                onTap: () {
                  if (userManager.isLoggedIn) {
                    userManager.signOut();
                  } else {
                    Navigator.of(context).pushNamed('/login');
                  }
                },
                child: Text(
                  userManager.isLoggedIn ? 'Logout' : 'Sign in or Sign up >',
                  style: const TextStyle(
                    color: Color(0xFFAF7BF0),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
