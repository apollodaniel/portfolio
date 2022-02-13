import 'package:github/github.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GithubTools {
  static Map<String, String> headers = {
    "Authorization": "token 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"
  };

  static var github = GitHub(
    auth: Authentication.withToken("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"),
  );

  static Stream<Repository> getRepositories(String user) {
    Stream<Repository> repo = github.repositories.listUserRepositories(user);
    return repo;
  }

  static Future<User> getGithubUser() async {
    User _user = await github.users.getUser("apollodaniel");

    return _user;
  }
}
