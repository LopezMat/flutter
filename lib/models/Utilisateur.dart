
class Utilisateur {
  int? id;
  String nom;
  String prenom;
  String login;
  String pass;

  Utilisateur({ this.id, required this.nom, required this.prenom, required this.login, required this.pass});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nom': nom,
      'prenom': prenom,
      'login': login,
      'pass': pass
    };
  }

  factory Utilisateur.fromMap(Map<String, dynamic> map) {
    return Utilisateur(
      id: map['id'],
      nom: map['nom'],
      prenom: map['prenom'],
      login: map['login'],
      pass: map['pass']
    );
  }
}