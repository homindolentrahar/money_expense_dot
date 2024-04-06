import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:money_expense_dot/core/domain/model/category_model.dart';
import 'package:money_expense_dot/feature/add_edit/presentation/bloc/categories_cubit.dart';

InputBorder _getBorder(BuildContext context) => OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: BorderSide(
        width: 1,
        color: Theme.of(context).colorScheme.outline,
      ),
    );

InputBorder _getErrorBorder(BuildContext context) => OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: BorderSide(
        width: 1,
        color: Theme.of(context).colorScheme.error,
      ),
    );

InputBorder _getFocusedBorder(BuildContext context) => OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: BorderSide(
        width: 1,
        color: Theme.of(context).colorScheme.primary,
      ),
    );

class FormFieldText extends StatelessWidget {
  final String? initialValue;
  final String name;
  final String hint;
  final Widget? suffixIcon;
  final bool isRequired;
  final dynamic Function(String?)? valueTransformer;
  final List<TextInputFormatter>? inputFormatters;
  final List<FormFieldValidator?>? validators;
  final TextInputAction action;
  final TextInputType keyboardType;

  const FormFieldText({
    super.key,
    this.initialValue,
    required this.name,
    required this.hint,
    this.suffixIcon,
    this.isRequired = true,
    this.valueTransformer,
    this.inputFormatters,
    this.validators,
    this.action = TextInputAction.done,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      initialValue: initialValue,
      name: name,
      textInputAction: action,
      keyboardType: keyboardType,
      valueTransformer: valueTransformer,
      validator: FormBuilderValidators.compose([
        if (isRequired) ...[
          FormBuilderValidators.required(),
        ],
      ]),
      style: Theme.of(context)
          .textTheme
          .bodyMedium
          ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: Theme.of(context).textTheme.bodyMedium,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 16,
        ),
        suffix: suffixIcon,
        enabledBorder: _getBorder(context),
        focusedBorder: _getFocusedBorder(context),
        errorBorder: _getErrorBorder(context),
        focusedErrorBorder: _getErrorBorder(context),
      ),
    );
  }
}

class FormFieldDatePicker extends StatelessWidget {
  final DateTime? initialValue;
  final String name;
  final String hint;
  final bool isRequired;
  final bool isReadOnly;
  final List<FormFieldValidator?>? validators;

  const FormFieldDatePicker({
    super.key,
    this.initialValue,
    required this.name,
    required this.hint,
    this.isRequired = true,
    this.isReadOnly = false,
    this.validators,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderDateTimePicker(
      initialValue: initialValue,
      name: name,
      inputType: InputType.date,
      format: DateFormat("EEEE, dd MMMM yyyy"),
      lastDate: DateTime.now(),
      validator: FormBuilderValidators.compose([
        if (isRequired) ...[
          FormBuilderValidators.required(),
        ],
      ]),
      style: Theme.of(context)
          .textTheme
          .bodyMedium
          ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: Theme.of(context).textTheme.bodyMedium,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 16,
        ),
        suffixIcon: Icon(
          Icons.calendar_month_outlined,
          color: Theme.of(context).colorScheme.outlineVariant,
        ),
        enabledBorder: _getBorder(context),
        focusedBorder: _getFocusedBorder(context),
        errorBorder: _getErrorBorder(context),
        focusedErrorBorder: _getErrorBorder(context),
      ),
    );
  }
}

class FormFieldCategorySelector extends StatelessWidget {
  final CategoryModel? initialValue;
  final String name;
  final bool isRequired;

  const FormFieldCategorySelector({
    super.key,
    this.initialValue,
    required this.name,
    this.isRequired = true,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, List<CategoryModel>>(
      builder: (_, state) {
        return FormBuilderField<CategoryModel>(
          initialValue: initialValue ?? CategoryConstant.categories.first,
          name: name,
          validator: FormBuilderValidators.compose([
            if (isRequired) ...[
              FormBuilderValidators.required(),
            ],
          ]),
          valueTransformer: (value) => value?.slug,
          onChanged: (value) {
            if (value != null) {
              context.pop();
            }
          },
          builder: (field) {
            final controller = TextEditingController(text: field.value?.name);

            return FormBuilderTextField(
              controller: controller,
              name: "${name}_field",
              readOnly: true,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 16,
                ),
                suffixIcon: SvgPicture.asset("assets/icons/ic_select.svg"),
                suffixIconConstraints: const BoxConstraints(
                  minWidth: 48,
                ),
                prefixIcon: field.value?.icon != null
                    ? SvgPicture.asset(field.value!.outIcon)
                    : null,
                prefixIconConstraints: const BoxConstraints(
                  minWidth: 48,
                ),
                enabledBorder: _getBorder(context),
                focusedBorder: _getBorder(context),
                errorBorder: _getErrorBorder(context),
                focusedErrorBorder: _getErrorBorder(context),
              ),
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  constraints: BoxConstraints(
                    minWidth: MediaQuery.of(context).size.width,
                    minHeight: 0,
                  ),
                  builder: (_) => BottomSheet(
                    onClosing: () {},
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                    builder: (ctx) => Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 28,
                        vertical: 24,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Pilih Kategori",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface),
                              ),
                              IconButton(
                                icon: const Icon(Icons.close),
                                onPressed: () {
                                  context.pop();
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                            ),
                            itemCount: state.length,
                            itemBuilder: (ctx, index) {
                              final item = state[index];

                              return GestureDetector(
                                onTap: () {
                                  field.didChange(item);
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      item.icon,
                                      width: 36,
                                      height: 36,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(item.name),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
