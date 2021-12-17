import 'dart:convert' as convert;

class LocalizacaoDTO {
  late double latitude;
  late double longitude;

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['latitude'] = latitude;
    data['longitude'] = longitude;

    return data;
  }

  String toJson() {
    String json = convert.json.encode(toMap());
    return json;
  }
}
