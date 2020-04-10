import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Insult> fetchData() async {
  final response =
      await http.get('https://evilinsult.com/generate_insult.php?lang=en&type=json');
  if (response.statusCode == 200) {
    return Insult.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load');
  }
}


class Insult {
  String number;
  String language;
  String insult;
  String created;
  String shown;
  String createdby;
  String active;
  String comment;

  Insult(
      {this.number,
      this.language,
      this.insult,
      this.created,
      this.shown,
      this.createdby,
      this.active,
      this.comment});

  Insult.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    language = json['language'];
    insult = json['insult'];
    created = json['created'];
    shown = json['shown'];
    createdby = json['createdby'];
    active = json['active'];
    comment = json['comment'];
  }
}
