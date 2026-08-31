enum AppRoute {
  /// ホーム画面。
  home('/'),

  /// グラフ画面。
  graph('/graph'),

  /// 習慣詳細画面。
  detail('/detail'),

  /// 習慣作成画面。
  create('/create'),

  /// 習慣編集画面。
  edit('/edit'),

  /// アーカイブ一覧画面。
  archive('/archive'),

  /// 設定画面。
  settings('/settings');

  const AppRoute(this.path);
  final String path;

  /// habitIdを含むパスを生成する。
  String withId(int id) => '$path/$id';
}
