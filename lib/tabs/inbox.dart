import 'package:flutter/material.dart';

import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import '../data.dart';
import '../model/comment.dart';
import '../widgets/custom_button.dart';

class Inbox extends StatefulWidget {
  const Inbox({Key? key}) : super(key: key);

  @override
  State<Inbox> createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: const Color(0xFFF4F4F4),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(child: CustomButton(title: 'Comments')),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Text('Today'),
              ),
              _customCommentCard(todayComments),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Text('Previously'),
              ),
              _customCommentCard(earlyComments),
            ],
          ),
        ),
      ),
    );
  }

  _customCommentCard(List<Comment> data) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 25),
      child: Wrap(
        spacing: 25,
        children: data
            .map(
              (e) => Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: const Color(0xFFEBEBEB),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Image.asset(e.imageUrl),
                        radius: 25,
                      ),
                      title: Text(e.name, style: const TextStyle(fontSize: 12)),
                      subtitle:
                          Text(e.tag, style: const TextStyle(fontSize: 10)),
                      trailing: Text(DateFormat.yMd().format(e.date),
                          style: const TextStyle(fontSize: 10)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        e.comment,
                        style: const TextStyle(fontSize: 10),
                      ),
                    ),
                    Row(
                      children: [
                        FloatingActionButton.small(
                          heroTag: 'heart',
                          backgroundColor: const Color(0xFF333333),
                          child: const Icon(Iconsax.heart5),
                          onPressed: () {},
                        ),
                        TextButton(
                          style: ButtonStyle(
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            backgroundColor: MaterialStateProperty.all(
                              const Color(0xFF333333),
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                          child: const Text(
                            'Replay',
                            style: TextStyle(
                              color: Color(0xFFEBEBEB),
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Container customChip(IconData icon, String title, {bool isActive = false}) {
    return Container(
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.all(4),
      child: Chip(
        backgroundColor: isActive ? Colors.black : null,
        avatar: Icon(icon,
            color:
                isActive ? const Color(0xFFEBEBEB) : const Color(0xFF333333)),
        label: Text(title),
        labelStyle: TextStyle(
            color:
                isActive ? const Color(0xFFEBEBEB) : const Color(0xFF333333)),
        labelPadding: const EdgeInsets.all(4),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }

  Column customDetails(Size size, String num, String title) {
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
            style: TextStyle(
              fontSize: size.height * (7 / 500),
              color: Colors.white,
            ),
          ),
        ),
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: size.height * (9 / 500),
          ),
        ),
      ],
    );
  }
}
