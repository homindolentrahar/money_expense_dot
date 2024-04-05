import 'package:collection/collection.dart';

class CategoryModel {
  final String icon;
  final String outIcon;
  final String slug;
  final String name;

  CategoryModel({
    required this.icon,
    required this.outIcon,
    required this.slug,
    required this.name,
  });

  static CategoryModel? of(String slug) =>
      CategoryConstant.categories.firstWhereOrNull(
        (element) => element.slug == slug,
      );
}

abstract class CategoryConstant {
  static final categories = [
    CategoryModel(
      icon: "assets/icons/ic_makanan.svg",
      outIcon: "assets/icons/ic_makanan_out.svg",
      name: "Makanan",
      slug: "makanan",
    ),
    CategoryModel(
      icon: "assets/icons/ic_internet.svg",
      outIcon: "assets/icons/ic_internet_out.svg",
      name: "Internet",
      slug: "internet",
    ),
    CategoryModel(
      icon: "assets/icons/ic_edukasi.svg",
      outIcon: "assets/icons/ic_edukasi_out.svg",
      name: "Edukasi",
      slug: "edukasi",
    ),
    CategoryModel(
      icon: "assets/icons/ic_hadiah.svg",
      outIcon: "assets/icons/ic_hadiah_out.svg",
      name: "Hadiah",
      slug: "hadiah",
    ),
    CategoryModel(
      icon: "assets/icons/ic_transport.svg",
      outIcon: "assets/icons/ic_transport_out.svg",
      name: "Transport",
      slug: "transport",
    ),
    CategoryModel(
      icon: "assets/icons/ic_belanja.svg",
      outIcon: "assets/icons/ic_belanja_out.svg",
      name: "Belanja",
      slug: "belanja",
    ),
    CategoryModel(
      icon: "assets/icons/ic_alat_rumah.svg",
      outIcon: "assets/icons/ic_alat_rumah_out.svg",
      name: "Alat Rumah",
      slug: "alat_rumah",
    ),
    CategoryModel(
      icon: "assets/icons/ic_olahraga.svg",
      outIcon: "assets/icons/ic_olahraga_out.svg",
      name: "Olahraga",
      slug: "olahraga",
    ),
    CategoryModel(
      icon: "assets/icons/ic_hiburan.svg",
      outIcon: "assets/icons/ic_hiburan_out.svg",
      name: "Hiburan",
      slug: "hiburan",
    ),
  ];
}
