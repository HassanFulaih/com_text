import 'model/comment.dart';

List<Comment> _comments = [
  Comment(
    'Deann Garza',
    '@Deann_Garza99',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. \n Arcu et mollis etiam quis.',
    DateTime.now(),
    'assets/min_pic1.png',
  ),
  Comment(
    'Deann Garza',
    '@Deann_Garza99',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. \n Arcu et mollis etiam quis.',
    DateTime.now(),
    'assets/min_pic2.png',
  ),
  Comment(
    'Deann Garza',
    '@Deann_Garza99',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. \n Arcu et mollis etiam quis.',
    DateTime.now(),
    'assets/min_pic3.png',
  ),
  Comment(
    'Deann Garza',
    '@Deann_Garza99',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. \n Arcu et mollis etiam quis.',
    DateTime.parse('2022-01-01'),
    'assets/min_pic4.png',
  ),
  Comment(
    'Deann Garza',
    '@Deann_Garza99',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. \n Arcu et mollis etiam quis.',
    DateTime.parse('2022-01-01'),
    'assets/min_pic5.png',
  ),
];

final now = DateTime.now();
final today = DateTime(now.year, now.month, now.day);
List<Comment> todayComments =
    _comments.where((element) => element.date.difference(today).inDays==0).toList();
List<Comment> earlyComments =
    _comments.where((element) => element.date.isBefore(today)).toList();
