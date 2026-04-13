import 'package:flutter/material.dart';
import 'package:payup/core/extensions/media_query_extension.dart';
import 'package:payup/core/shared/widgets/card_client/card_client.dart';

class ClientList extends StatelessWidget {
  const ClientList({super.key});

  @override
  Widget build(BuildContext context) {
    final height = context.height;

    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(height: 20),
          TextButton(onPressed: () {}, child: Text('Ver todos')),
          SizedBox(
            height: height * .2,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: 5,
              scrollDirection: .horizontal,
              padding: EdgeInsets.only(top: 12, left: 10, right: 10),
              itemBuilder: (context, index) {
                return CardClient(text: 'teste');
              },
            ),
          ),
        ],
      ),
    );
  }
}
