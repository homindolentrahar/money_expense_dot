// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, CategoryEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedColumn<String> icon = GeneratedColumn<String>(
      'icon', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _outIconMeta =
      const VerificationMeta('outIcon');
  @override
  late final GeneratedColumn<String> outIcon = GeneratedColumn<String>(
      'out_icon', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _slugMeta = const VerificationMeta('slug');
  @override
  late final GeneratedColumn<String> slug = GeneratedColumn<String>(
      'slug', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [icon, outIcon, slug, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories';
  @override
  VerificationContext validateIntegrity(Insertable<CategoryEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('icon')) {
      context.handle(
          _iconMeta, icon.isAcceptableOrUnknown(data['icon']!, _iconMeta));
    } else if (isInserting) {
      context.missing(_iconMeta);
    }
    if (data.containsKey('out_icon')) {
      context.handle(_outIconMeta,
          outIcon.isAcceptableOrUnknown(data['out_icon']!, _outIconMeta));
    } else if (isInserting) {
      context.missing(_outIconMeta);
    }
    if (data.containsKey('slug')) {
      context.handle(
          _slugMeta, slug.isAcceptableOrUnknown(data['slug']!, _slugMeta));
    } else if (isInserting) {
      context.missing(_slugMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {slug};
  @override
  CategoryEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoryEntity(
      icon: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}icon'])!,
      outIcon: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}out_icon'])!,
      slug: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}slug'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(attachedDatabase, alias);
  }
}

class CategoryEntity extends DataClass implements Insertable<CategoryEntity> {
  final String icon;
  final String outIcon;
  final String slug;
  final String name;
  const CategoryEntity(
      {required this.icon,
      required this.outIcon,
      required this.slug,
      required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['icon'] = Variable<String>(icon);
    map['out_icon'] = Variable<String>(outIcon);
    map['slug'] = Variable<String>(slug);
    map['name'] = Variable<String>(name);
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      icon: Value(icon),
      outIcon: Value(outIcon),
      slug: Value(slug),
      name: Value(name),
    );
  }

  factory CategoryEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryEntity(
      icon: serializer.fromJson<String>(json['icon']),
      outIcon: serializer.fromJson<String>(json['outIcon']),
      slug: serializer.fromJson<String>(json['slug']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'icon': serializer.toJson<String>(icon),
      'outIcon': serializer.toJson<String>(outIcon),
      'slug': serializer.toJson<String>(slug),
      'name': serializer.toJson<String>(name),
    };
  }

  CategoryEntity copyWith(
          {String? icon, String? outIcon, String? slug, String? name}) =>
      CategoryEntity(
        icon: icon ?? this.icon,
        outIcon: outIcon ?? this.outIcon,
        slug: slug ?? this.slug,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('CategoryEntity(')
          ..write('icon: $icon, ')
          ..write('outIcon: $outIcon, ')
          ..write('slug: $slug, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(icon, outIcon, slug, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryEntity &&
          other.icon == this.icon &&
          other.outIcon == this.outIcon &&
          other.slug == this.slug &&
          other.name == this.name);
}

class CategoriesCompanion extends UpdateCompanion<CategoryEntity> {
  final Value<String> icon;
  final Value<String> outIcon;
  final Value<String> slug;
  final Value<String> name;
  final Value<int> rowid;
  const CategoriesCompanion({
    this.icon = const Value.absent(),
    this.outIcon = const Value.absent(),
    this.slug = const Value.absent(),
    this.name = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CategoriesCompanion.insert({
    required String icon,
    required String outIcon,
    required String slug,
    required String name,
    this.rowid = const Value.absent(),
  })  : icon = Value(icon),
        outIcon = Value(outIcon),
        slug = Value(slug),
        name = Value(name);
  static Insertable<CategoryEntity> custom({
    Expression<String>? icon,
    Expression<String>? outIcon,
    Expression<String>? slug,
    Expression<String>? name,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (icon != null) 'icon': icon,
      if (outIcon != null) 'out_icon': outIcon,
      if (slug != null) 'slug': slug,
      if (name != null) 'name': name,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CategoriesCompanion copyWith(
      {Value<String>? icon,
      Value<String>? outIcon,
      Value<String>? slug,
      Value<String>? name,
      Value<int>? rowid}) {
    return CategoriesCompanion(
      icon: icon ?? this.icon,
      outIcon: outIcon ?? this.outIcon,
      slug: slug ?? this.slug,
      name: name ?? this.name,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (icon.present) {
      map['icon'] = Variable<String>(icon.value);
    }
    if (outIcon.present) {
      map['out_icon'] = Variable<String>(outIcon.value);
    }
    if (slug.present) {
      map['slug'] = Variable<String>(slug.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('icon: $icon, ')
          ..write('outIcon: $outIcon, ')
          ..write('slug: $slug, ')
          ..write('name: $name, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ExpensesTable extends Expenses
    with TableInfo<$ExpensesTable, ExpenseEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExpensesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES categories (slug)'));
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _expensedAtMeta =
      const VerificationMeta('expensedAt');
  @override
  late final GeneratedColumn<DateTime> expensedAt = GeneratedColumn<DateTime>(
      'expensed_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, category, amount, expensedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'expenses';
  @override
  VerificationContext validateIntegrity(Insertable<ExpenseEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('expensed_at')) {
      context.handle(
          _expensedAtMeta,
          expensedAt.isAcceptableOrUnknown(
              data['expensed_at']!, _expensedAtMeta));
    } else if (isInserting) {
      context.missing(_expensedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ExpenseEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExpenseEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      expensedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}expensed_at'])!,
    );
  }

  @override
  $ExpensesTable createAlias(String alias) {
    return $ExpensesTable(attachedDatabase, alias);
  }
}

class ExpenseEntity extends DataClass implements Insertable<ExpenseEntity> {
  final int id;
  final String name;
  final String category;
  final double amount;
  final DateTime expensedAt;
  const ExpenseEntity(
      {required this.id,
      required this.name,
      required this.category,
      required this.amount,
      required this.expensedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['category'] = Variable<String>(category);
    map['amount'] = Variable<double>(amount);
    map['expensed_at'] = Variable<DateTime>(expensedAt);
    return map;
  }

  ExpensesCompanion toCompanion(bool nullToAbsent) {
    return ExpensesCompanion(
      id: Value(id),
      name: Value(name),
      category: Value(category),
      amount: Value(amount),
      expensedAt: Value(expensedAt),
    );
  }

  factory ExpenseEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExpenseEntity(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      category: serializer.fromJson<String>(json['category']),
      amount: serializer.fromJson<double>(json['amount']),
      expensedAt: serializer.fromJson<DateTime>(json['expensedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'category': serializer.toJson<String>(category),
      'amount': serializer.toJson<double>(amount),
      'expensedAt': serializer.toJson<DateTime>(expensedAt),
    };
  }

  ExpenseEntity copyWith(
          {int? id,
          String? name,
          String? category,
          double? amount,
          DateTime? expensedAt}) =>
      ExpenseEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        category: category ?? this.category,
        amount: amount ?? this.amount,
        expensedAt: expensedAt ?? this.expensedAt,
      );
  @override
  String toString() {
    return (StringBuffer('ExpenseEntity(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('amount: $amount, ')
          ..write('expensedAt: $expensedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, category, amount, expensedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExpenseEntity &&
          other.id == this.id &&
          other.name == this.name &&
          other.category == this.category &&
          other.amount == this.amount &&
          other.expensedAt == this.expensedAt);
}

class ExpensesCompanion extends UpdateCompanion<ExpenseEntity> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> category;
  final Value<double> amount;
  final Value<DateTime> expensedAt;
  const ExpensesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.category = const Value.absent(),
    this.amount = const Value.absent(),
    this.expensedAt = const Value.absent(),
  });
  ExpensesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String category,
    required double amount,
    required DateTime expensedAt,
  })  : name = Value(name),
        category = Value(category),
        amount = Value(amount),
        expensedAt = Value(expensedAt);
  static Insertable<ExpenseEntity> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? category,
    Expression<double>? amount,
    Expression<DateTime>? expensedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (category != null) 'category': category,
      if (amount != null) 'amount': amount,
      if (expensedAt != null) 'expensed_at': expensedAt,
    });
  }

  ExpensesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? category,
      Value<double>? amount,
      Value<DateTime>? expensedAt}) {
    return ExpensesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      amount: amount ?? this.amount,
      expensedAt: expensedAt ?? this.expensedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (expensedAt.present) {
      map['expensed_at'] = Variable<DateTime>(expensedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExpensesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('amount: $amount, ')
          ..write('expensedAt: $expensedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $ExpensesTable expenses = $ExpensesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [categories, expenses];
}
