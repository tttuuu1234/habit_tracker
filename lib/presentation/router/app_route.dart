enum AppRoute {
  /// ホーム画面。
  home('/'),

  /// 習慣詳細画面。
  detail('/detail'),

  /// 習慣作成画面。
  create('/create'),

  /// 習慣編集画面。
  edit('/edit');

  const AppRoute(this.path);
  final String path;

  /// habitIdを含むパスを生成する。
  String withId(int id) => '$path/$id';
}
