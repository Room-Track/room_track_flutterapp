class BuildingInfoType {
  final String name;
  final double lat;
  final double lng;
  final bool inside;
  final int botFloor;
  final int topFloor;

  const BuildingInfoType({
    required this.name,
    required this.lat,
    required this.lng,
    required this.inside,
    required this.botFloor,
    required this.topFloor,
  });

  factory BuildingInfoType.fromJson(Map<String, dynamic> json) {
    return BuildingInfoType(
      name: json['name'],
      lat: double.tryParse(json['lat']) ?? 0.00,
      lng: double.tryParse(json['lng']) ?? 0.00,
      inside: json['inside'],
      botFloor: json['bot_floor'],
      topFloor: json['top_floor'],
    );
  }

  @override
  String toString() {
    return "BuildingInfoType\n  name : $name\n  lat : $lat\n  lng : $lng\n  inside : $inside\n  botFloor : $botFloor\n  topFloor : $topFloor\n";
  }
}
