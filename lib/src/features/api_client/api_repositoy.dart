import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'api_client.dart';
import 'github_user_entity.dart';

final apiRepositoryProvider = Provider((ref) => ApiRepository(ref.read));

class ApiRepository {
  ApiRepository(this._read);

  final Reader _read;
  late final _api = _read(apiClientProvider);

  Future<GitHubUserEntity> fetchUser(String user) async {
    final response = await _api.get<Map<String, Object?>>('users/$user');
    return GitHubUserEntity.fromJson(response.data!);
  }
}
