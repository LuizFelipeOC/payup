import 'package:flutter/material.dart';
import 'package:payup/core/extensions/media_query_extension.dart';
import 'package:payup/core/models/client_model.dart';
import 'package:payup/core/shared/widgets/card_client/card_client.dart';
import 'package:payup/core/shared/widgets/card_payments/card_payments.dart';

class ClientList extends StatelessWidget {
  final List<ClientModel> clients;

  const ClientList({super.key, this.clients = const []});

  @override
  Widget build(BuildContext context) {
    final height = context.height;

    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(height: 20),
          TextButton(onPressed: () {}, child: Text('Ver todos')),

          SizedBox(height: 10),
          SizedBox(
            height: height * .2,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: clients.length,
              scrollDirection: .horizontal,
              padding: EdgeInsets.only(top: 12, left: 10, right: 10),
              itemBuilder: (context, index) {
                return CardClient(text: clients[index].name);
              },
            ),
          ),
        ],
      ),
    );
  }
}
