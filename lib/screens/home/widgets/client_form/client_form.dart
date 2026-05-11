import 'package:flutter/material.dart';
import 'package:payup/core/shared/widgets/buttons/button.dart';
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
      body: SingleChildScrollView(
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
              padding: .only(right: 10, left: 10, top: 40),
              child: Row(
                children: [
                  Expanded(
                    child: Fields(
                      label: 'Valor',
                      hintText: 'R\$ 0,00',
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Fields(label: 'Data de cobrança', hintText: '02/03/2025'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
              child: Row(
                children: [
                  Row(
                    children: [
                      Text('Cobrança recorrente?'),
                      Switch(value: true, onChanged: (value) {}),
                    ],
                  ),

                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.backgroundComponents,
                      borderRadius: BorderRadius.circular(28),
                    ),
                    padding: .symmetric(horizontal: 12, vertical: 8),
                    child: Row(
                      crossAxisAlignment: .center,
                      mainAxisAlignment: .center,
                      spacing: 4,
                      children: [
                        Text('Mensalmente', style: texStyle.labelMedium),
                        Icon(Icons.arrow_drop_down, size: 16, color: AppColors.textLabel),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Divider(),
            SizedBox(height: 16),

            Padding(
              padding: .only(right: 10, left: 10, top: 8),
              child: Column(
                children: [
                  Fields(label: 'Nome do cliente', hintText: 'Ex: João da Silva'),
                  SizedBox(height: 12),
                  Fields(label: 'Contato', hintText: 'Ex: joao@exemplo.com'),
                  SizedBox(height: 12),
                  Fields(label: 'Telefone', hintText: 'Ex: (11) 99999-9999'),
                  SizedBox(height: 12),
                  Fields(label: 'CNPJ', hintText: 'Ex: 12.345.678/0001-90'),
                  SizedBox(height: 12),
                  Fields(
                    label: 'Endereço',
                    hintText: 'Ex: Rua das Flores, 123 – Centro, São Paulo – SP',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            Row(
              mainAxisAlignment: .end,
              spacing: 12,
              children: [
                SizedBox(
                  height: 40,
                  child: Button(
                    label: 'Cancelar',
                    onPressed: Navigator.of(context).pop,
                    variant: ButtonVariant.secondary,
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: Button(label: 'Salvar alterações', onPressed: Navigator.of(context).pop),
                ),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
