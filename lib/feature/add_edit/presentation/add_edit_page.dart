import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:money_expense_dot/core/presentation/widget/buttons.dart';
import 'package:money_expense_dot/core/presentation/widget/form_fields.dart';

class AddEditPage extends StatelessWidget {
  const AddEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          iconSize: 32,
          onPressed: () {
            context.pop();
          },
        ),
        title: const Text("Tambah Pengeluaran Baru"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: FormBuilder(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FormFieldText(
                  name: "name",
                  hint: "Nama Pengeluaran",
                  action: TextInputAction.next,
                ),
                const SizedBox(height: 20),
                const FormFieldCategorySelector(
                  name: "category",
                ),
                const SizedBox(height: 20),
                const FormFieldDatePicker(
                  name: "date",
                  hint: "Tanggal Pengeluaran",
                ),
                const SizedBox(height: 20),
                const FormFieldText(
                  name: "amount",
                  hint: "Nominal",
                  keyboardType: TextInputType.number,
                  action: TextInputAction.done,
                ),
                const SizedBox(height: 32),
                AppPrimaryButton(
                  title: "Simpan",
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
