class ModelKlasemen {
  final int? id;
  final String tim;
  final String P;
  final String W;
  final String D;
  final String L;
  final String pts;

  ModelKlasemen({
    this.id,
    required this.tim,
    required this.P,
    required this.W,
    required this.D,
    required this.L,
    required this.pts,
  });

  ModelKlasemen.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        tim = res["tim"],
        P = res["P"],
        W = res["W"],
        D = res["D"],
        L = res["L"],
        pts = res["pts"];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'tim': tim,
      'P': P,
      'W': W,
      'D': D,
      'L': L,
      'pts': pts,
    };
  }
}