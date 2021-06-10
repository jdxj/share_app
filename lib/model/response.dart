class APIResponse {
  int code;
  String message;
  dynamic data;

  APIResponse(this.code, this.message, this.data);

  APIResponse.fromJson(Map<String, dynamic> data) {
    this.code = data['code'];
    this.message = data['message'];
    this.data = data['data'];
  }
}

class VideoInfo {
  int id;
  String title;
  String path;
  int userId;

  VideoInfo(this.id, this.title, this.path, this.userId);

  VideoInfo.fromJson(Map<String, dynamic> data) {
    this.id = data['id'];
    this.title = data['title'];
    this.path = data['path'];
    this.userId = data['user_id'];
  }
}

class APIPage {
  int num;
  bool hasNext;
  dynamic data;

  APIPage(this.num, this.hasNext, this.data);

  APIPage.fromJson(Map<String, dynamic> data) {
    this.num = data['num'];
    this.hasNext = data['hash_next'];
    this.data = data['data'];
  }

}