class BuildingInfoType {
  final String name;
  final double lat;
  final double lng;
  final bool inside;

  const BuildingInfoType({
    required this.name,
    required this.lat,
    required this.lng,
    required this.inside,
  });

  factory BuildingInfoType.fromJson(Map<String, dynamic> json) {
    return BuildingInfoType(
      name: json['name'],
      lat: double.tryParse(json['lat']) ?? 0.00,
      lng: double.tryParse(json['lng']) ?? 0.00,
      inside: json['inside'],
    );
  }

  @override
  String toString() {
    return "BuildingInfoType\n  name : $name\n  lat : $lat\n  lng : $lng\n  inside : $inside";
  }
}
