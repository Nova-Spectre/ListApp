class Clients {
  String? name;

  String? company;

  Clients({
    this.name,
    this.company,
  });

  Clients.fromJson(Map<String, dynamic> json) {
    name = json['name'];

    company = json['company'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['company'] = this.company;

    return data;
  }
}

class User {
  List<Clients>? clients;

  User({this.clients});

  User.fromJson(Map<String, dynamic> json) {
    if (json['clients'] != null) {
      clients = <Clients>[];
      json['clients'].forEach((v) {
        clients!.add(new Clients.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.clients != null) {
      data['clients'] = this.clients!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
