class Post {
  int _userId;
  int get userId => _userId;

  int _id;
  int get id => _id;

  String _title;
  String get title => _title;

  String _body;
  String get body => _body;

  Post({
    required int userId,
    required int id,
    required String title,
    required String body,
  })  : this._userId = userId,
        this._id = id,
        this._title = title,
        this._body = body;

  @override
  String toString() {
    return 'Post{_userId: $_userId, _id: $_id, _title: $_title, _body: $_body}';
  }
}
