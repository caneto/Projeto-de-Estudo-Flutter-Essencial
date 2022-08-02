class Home {
  int? id;
  String nome = "";
  String tipo = "";
  String descricao = "";
  String urlFoto = "";
  String? urlVideo;
  String? latitude;
  String? longitude;
  
  Home(
      {this.id,
        required this.nome,
        required this.tipo,
        required this.descricao,
        required this.urlFoto,
        this.urlVideo,
        this.latitude,
        this.longitude});

  Home.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    if(json['nome']!=null) {
      nome = json['nome'];
    } else nome = "";
    if(json['tipo']!=null) {
      tipo = json['tipo'];
    } else tipo = "";
    if(json['descricao']!=null) {
      descricao = json['descricao'];
    } else descricao = "";
    if(json['urlFotos']!=null) {
      urlFoto = json['urlFoto'].toString();
    } else urlFoto = "";
    urlVideo = json['urlVideo'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['tipo'] = this.tipo;
    data['descricao'] = this.descricao;
    data['urlFoto'] = this.urlFoto;
    data['urlVideo'] = this.urlVideo;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}