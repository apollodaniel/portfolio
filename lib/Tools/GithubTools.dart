import 'package:github/github.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GithubTools {
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
