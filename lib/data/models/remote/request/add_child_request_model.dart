class AddChildRequestModel {
  final String? name;
  final String? weight;
  final String? height;
  final String? gender;
  final String? birthDate;
  final bool? haveBorn;
  final bool? isFirst;
  final bool? haveMiscarriage;

  AddChildRequestModel({
    this.name,
    this.weight,
    this.height,
    this.gender,
    this.birthDate,
    this.haveBorn,
    this.isFirst,
    this.haveMiscarriage,
  });

  AddChildRequestModel copyWith({
    String? name,
    String? weight,
    String? height,
    String? gender,
    String? birthDate,
    bool? haveBorn,
    bool? isFirst,
    bool? haveMiscarriage,
  }) =>
      AddChildRequestModel(
        name: name ?? this.name,
        weight: weight ?? this.weight,
        height: height ?? this.height,
        gender: gender ?? this.gender,
        birthDate: birthDate ?? this.birthDate,
        haveBorn: haveBorn ?? this.haveBorn,
        isFirst: isFirst ?? this.isFirst,
        haveMiscarriage: haveMiscarriage ?? this.haveMiscarriage,
      );

  // factory AddChildRequestModel.fromJson(Map<String, dynamic> json) =>
  //     AddChildRequestModel(
  //       name: json["name"],
  //       weight: json["weight"],
  //       height: json["height"],
  //       gender: json["gender"],
  //       birthDate: json["birth_date"] == null
  //           ? null
  //           : DateTime.parse(json["birth_date"]),
  //       haveBorn: json["have_born"],
  //       isFirst: json["is_first"],
  //       haveMiscarriage: json["have_miscarriage"],
  //     );

  Map<String, dynamic> toJson() => {
        "name": name,
        if (weight != null) "weight": weight,
        if (height != null) "height": height,
        if (gender != null) "gender": gender,
        if (birthDate != null) "birth_date": birthDate,
        if (haveBorn != null) "have_born": haveBorn,
        if (isFirst != null) "is_first": isFirst,
        if (haveMiscarriage != null) "have_miscarriage": haveMiscarriage,
      };
}
