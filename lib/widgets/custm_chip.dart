import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  const CustomChip(this.icon, this.label, {Key? key, this.isActive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.all(4),
      child: Chip(
        backgroundColor: isActive ? Colors.black : null,
        avatar: Icon(
          icon,
          color: isActive ? const Color(0xFFEBEBEB) : const Color(0xFF333333),
        ),
        label: Text(label),
        labelStyle: TextStyle(
            color:
                isActive ? const Color(0xFFEBEBEB) : const Color(0xFF333333)),
        labelPadding: const EdgeInsets.all(4),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }
}
