class ModelTransfer {
  final int? id;
  final String player;
  final String from;
  final String to;
  final String transfer_fee;

  ModelTransfer(
      { this.id,
        required this.player,
        required this.from,
        required this.to,
        required this.transfer_fee});

  ModelTransfer.fromMap(Map<String, dynamic> res)
      : id            = res["id"],
        player        = res["player"],
        from          = res["from"],
        to            = res["to"],
        transfer_fee  = res["transfer_fee"];

  Map<String, Object?> toMap() {
    return {
      'id':id,
      'player': player,
      'from': from,
      'to': to,
      'transfer_fee': transfer_fee
    };
  }
}