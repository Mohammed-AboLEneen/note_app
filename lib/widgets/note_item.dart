import 'package:flutter/material.dart';

class ItemNote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        color: const Color(0xffFFCA78),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 25,
            right: 15,
            bottom: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: const Padding(
                  padding: EdgeInsets.only(bottom: 20.0, top: 25),
                  child: Text(
                    'Flutter Tips',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                subtitle: Text(
                  'Learn More And More Until Become Better From Them',
                  style: TextStyle(
                      fontSize: 17, color: Colors.black.withOpacity(.5)),
                ),
                trailing: Padding(
                  padding: const EdgeInsets.only(left: 3.0, bottom: 20),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.delete,
                      size: 30,
                    ),
                  ),
                ),
                contentPadding: EdgeInsets.zero,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 7.0, top: 15, bottom: 5),
                child: Text('May 29,2023',
                    style: TextStyle(
                        fontSize: 15, color: Colors.black.withOpacity(.5))),
              )
            ],
          ),
        ));
  }
}
