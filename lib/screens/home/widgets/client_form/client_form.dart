import 'package:flutter/material.dart';
import 'package:payup/core/shared/widgets/fields/fields.dart';
import 'package:payup/core/themes/app_colors.dart';

class ClientForm extends StatefulWidget {
  const ClientForm({super.key});

  @override
  State<ClientForm> createState() => _ClientFormState();
}

class _ClientFormState extends State<ClientForm> {
  @override
  Widget build(BuildContext context) {
    final texStyle = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.backgroundSecondary,
      body: Padding(
        padding: .all(8.0),
        child: Column(
          children: [
            Padding(
              padding: .symmetric(vertical: 20, horizontal: 10),
              child: Divider(
                color: AppColors.textPlaceholder,
                thickness: 4,
                indent: 150,
                endIndent: 150,
              ),
            ),
            Container(
              alignment: .topLeft,
              child: Padding(
                padding: .only(top: 14, right: 10, left: 10),
                child: Text('Adicionar cliente', style: texStyle.titleMedium),
              ),
            ),

            Padding(
              padding: .symmetric(horizontal: 10, vertical: 40),
              child: Row(
                children: [
                  Expanded(child: Fields(label: 'Valor')),
                  SizedBox(width: 16),
                  Expanded(child: Fields(label: 'Data de cobrança')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
