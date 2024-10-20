class FavoriteCardType {
  final String name;
  final String icon;
  final String type;
  final String building;
  final int floor;
  final bool isFavorite;

  FavoriteCardType({
    required this.name,
    required this.icon,
    required this.type,
    required this.building,
    required this.floor,
    required this.isFavorite,
  });

  factory FavoriteCardType.fromJson(Map<String, dynamic> json) {
    return FavoriteCardType(
      name: json['name'],
      icon: "assets/card/${json['type'].toString().toLowerCase()}.svg",
      type: json['type'],
      building: json['building'],
      floor: json['floor'],
      isFavorite: json['isFavorite'],
    );
  }

  @override
  String toString() {
    return "FavoriteCardType\n  name : $name\n  type : $type\n  icon : $icon\n  isFavorite : $isFavorite";
  }
}
