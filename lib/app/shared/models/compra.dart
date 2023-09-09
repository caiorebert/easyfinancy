class Compra {
  late int id;
  late String tipoCompra;
  late String nomeCompra;

  Compra();

  Compra.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        tipoCompra = json['tipoCompra'],
        nomeCompra = json['nomeCompra'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'tipoCompra': tipoCompra,
    'nomeCompra': nomeCompra
  };
}