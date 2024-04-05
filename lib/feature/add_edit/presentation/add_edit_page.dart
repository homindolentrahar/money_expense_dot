import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:go_router/go_router.dart';
import 'package:money_expense_dot/core/base_status.dart';
import 'package:money_expense_dot/core/presentation/widget/buttons.dart';
import 'package:money_expense_dot/core/presentation/widget/form_fields.dart';
import 'package:money_expense_dot/feature/add_edit/presentation/bloc/add_edit_cubit.dart';
import 'package:money_expense_dot/feature/add_edit/presentation/bloc/add_edit_state.dart';
import 'package:money_expense_dot/util/extension/string_ext.dart';

class AddEditPage extends StatelessWidget {
  const AddEditPage._();

  static Widget getPage() {
    return BlocProvider(
      create: (_) => AddEditCubit(),
      child: const AddEditPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddEditCubit, AddEditState>(
      bloc: context.read<AddEditCubit>(),
      listener: (_, state) {
        if (state.status == BaseStatus.loading) {
          EasyLoading.show(status: "Creating expense...");
          context.pop();
        } else if (state.status == BaseStatus.success) {
          EasyLoading.showSuccess("Success creating expense");
        } else if (state.status == BaseStatus.error) {
          EasyLoading.showError("Error creating expense");
        }
      },
      child: Scaffold(
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
              key: context.read<AddEditCubit>().formKey,
              onChanged: () {
                context.read<AddEditCubit>().onFormChanged();
              },
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
                    name: "expensed_at",
                    hint: "Tanggal Pengeluaran",
                  ),
                  const SizedBox(height: 20),
                  FormFieldText(
                    name: "amount",
                    hint: "Nominal",
                    keyboardType: TextInputType.number,
                    action: TextInputAction.done,
                    valueTransformer: (value) => value?.currencyInput,
                    inputFormatters: [
                      CurrencyInputFormatter(
                        leadingSymbol: "Rp ",
                        thousandSeparator: ThousandSeparator.Period,
                        mantissaLength: 0,
                      )
                    ],
                  ),
                  const SizedBox(height: 32),
                  BlocBuilder<AddEditCubit, AddEditState>(
                    builder: (ctx, state) {
                      return AppPrimaryButton(
                        isEnabled: state.isFormValid,
                        title: "Simpan",
                        onPressed: () {
                          context.read<AddEditCubit>().submit();
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
