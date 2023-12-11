

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/data/network_result.dart';
import '../domain/search_use_case.dart';
import '../providers/search_provider.dart';



final searchProvider = StateNotifierProvider((ref) => SearchProvider(ref.watch(searchUseCaseProvider)));
final searchUseCaseProvider = Provider((ref) => SearchUseCase(ref));



