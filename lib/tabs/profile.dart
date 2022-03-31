import 'package:flutter/material.dart';

import 'package:iconsax/iconsax.dart';
import 'package:badges/badges.dart';

import '../widgets/custm_chip.dart';
import '../widgets/custom_button.dart';

const List<String> imgUrls = [
  'assets/Picture1.png',
  'assets/Picture2.png',
  'assets/Picture3.png',
  'assets/Picture4.png',
  'assets/Picture5.png',
  'assets/Picture6.png',
  'assets/Picture7.png',
  'assets/Picture8.png',
  'assets/Picture9.png',
];

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            _appBar(),
            Flexible(
              flex: 3,
              child: _infoCard(size),
            ),
            _categories(),
            Flexible(
              flex: 7,
              child: _customGrid(),
            ),
          ],
        ),
      ),
    );
  }

  _appBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Badge(
          padding: const EdgeInsets.all(10),
          elevation: 0,
          toAnimate: false,
          shape: BadgeShape.circle,
          badgeColor: const Color(0xFFEBEBEB),
          borderRadius: BorderRadius.circular(8),
          badgeContent: const Icon(Iconsax.user_cirlce_add),
        ),
        const CustomButton(title: 'Deann Garza'),
        Badge(
          padding: const EdgeInsets.all(10),
          elevation: 0,
          toAnimate: false,
          shape: BadgeShape.circle,
          badgeColor: const Color(0xFFEBEBEB),
          borderRadius: BorderRadius.circular(8),
          badgeContent: const Icon(Iconsax.element_45),
        ),
      ],
    );
  }

  Card _infoCard(Size size) {
    Column _customDetails(Size size, String num, String title) {
      return Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.white),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
            child: Text(
              num,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
          const SizedBox(height: 7),
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      );
    }

    return Card(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(
            colors: [
              Colors.black,
              Color.fromARGB(190, 0, 0, 5),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Badge(
              padding: const EdgeInsets.all(8),
              badgeColor: const Color(0xFF333333),
              badgeContent:
                  const Icon(Iconsax.edit5, color: Colors.white, size: 16),
              position: const BadgePosition(bottom: -8),
              child: CircleAvatar(
                child: Image.asset('assets/min_pic1.png'),
                radius: 40,
              ),
            ),
            const Text(
              '@Deann_Garza99',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _customDetails(size, '44', 'Following'),
                _customDetails(size, '22', 'Followers'),
                _customDetails(size, '1500', 'Likes'),
              ],
            )
          ],
        ), //declare your widget here
      ),
    );
  }

  Row _categories() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        CustomChip(Iconsax.video_square4, 'My Videos', isActive: true),
        CustomChip(Iconsax.heart_tick5, 'Liked Videos'),
        CustomChip(Iconsax.key_square5, 'Private Videos'),
      ],
    );
  }

  GridView _customGrid() {
    return GridView(
      padding: const EdgeInsets.all(10),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 5,
        mainAxisSpacing: 12,
        mainAxisExtent: 150,
      ),
      children: imgUrls.map((e) => Image.asset(e)).toList(),
    );
  }
}
