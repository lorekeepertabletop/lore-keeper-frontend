enum Role {

  USER;

  static Role valueOf(String role) {

    return Role.values.firstWhere((value) => value.name == role);

  }

}
