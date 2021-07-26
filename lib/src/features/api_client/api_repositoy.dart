import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'api_client.dart';
import 'github_user_entity.dart';

final apiRepositoryProvider = Provider((ref) => ApiRepository(ref.read));

class ApiRepository {
  const ApiRepository(this._read);

  final Reader _read;
  ApiClient get _api => _read(apiClientProvider);

  Future<GitHubUserEntity> fetchUser(String username) async {
    final response = await _api.get<Map<String, Object?>>('users/$username');
    return GitHubUserEntity.fromJson(response.data!);
  }
}
