import 'package:collection/collection.dart';

class ExpenseCategoryModel {
  final String icon;
  final String outIcon;
  final String slug;
  final String name;

  ExpenseCategoryModel({
    required this.icon,
    required this.outIcon,
    required this.slug,
    required this.name,
  });

  static ExpenseCategoryModel? of(String slug) =>
      ExpenseCategoryConstant.categories.firstWhereOrNull(
        (element) => element.slug == slug,
      );
}

abstract class ExpenseCategoryConstant {
  static final categories = [
    ExpenseCategoryModel(
      icon: "assets/icons/ic_makanan.svg",
      outIcon: "assets/icons/ic_makanan_out.svg",
      name: "Makanan",
      slug: "makanan",
    ),
    ExpenseCategoryModel(
      icon: "assets/icons/ic_internet.svg",
      outIcon: "assets/icons/ic_internet_out.svg",
      name: "Internet",
      slug: "internet",
    ),
    ExpenseCategoryModel(
      icon: "assets/icons/ic_edukasi.svg",
      outIcon: "assets/icons/ic_edukasi_out.svg",
      name: "Edukasi",
      slug: "edukasi",
    ),
    ExpenseCategoryModel(
      icon: "assets/icons/ic_hadiah.svg",
      outIcon: "assets/icons/ic_hadiah_out.svg",
      name: "Hadiah",
      slug: "hadiah",
    ),
    ExpenseCategoryModel(
      icon: "assets/icons/ic_transport.svg",
      outIcon: "assets/icons/ic_transport_out.svg",
      name: "Transport",
      slug: "transport",
    ),
    ExpenseCategoryModel(
      icon: "assets/icons/ic_belanja.svg",
      outIcon: "assets/icons/ic_belanja_out.svg",
      name: "Belanja",
      slug: "belanja",
    ),
    ExpenseCategoryModel(
      icon: "assets/icons/ic_alat_rumah.svg",
      outIcon: "assets/icons/ic_alat_rumah_out.svg",
      name: "Alat Rumah",
      slug: "alat_rumah",
    ),
    ExpenseCategoryModel(
      icon: "assets/icons/ic_olahraga.svg",
      outIcon: "assets/icons/ic_olahraga_out.svg",
      name: "Olahraga",
      slug: "olahraga",
    ),
    ExpenseCategoryModel(
      icon: "assets/icons/ic_hiburan.svg",
      outIcon: "assets/icons/ic_hiburan_out.svg",
      name: "Hiburan",
      slug: "hiburan",
    ),
  ];
}
