class RefreshTokenModel {
    final String? access;
    final String? refresh;

    RefreshTokenModel({
        this.access,
        this.refresh,
    });

    factory RefreshTokenModel.fromJson(Map<String, dynamic> json) => RefreshTokenModel(
        access: json["access"],
        refresh: json["refresh"],
    );

    Map<String, dynamic> toJson() => {
        "access": access,
        "refresh": refresh,
    };
}
