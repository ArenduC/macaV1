const basUrl = "http://192.168.2.6:3000/maca/";

class PostUrl {
  String borderList = "${basUrl}v1/borderlist";
  String userLogin = "${basUrl}v1/user_login";
}

class GetUrl {
  String bedList = "${basUrl}v1/bed_available";
}
