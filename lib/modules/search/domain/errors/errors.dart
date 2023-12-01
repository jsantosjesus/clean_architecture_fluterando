// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class FailureSearch implements Exception {}

class InvalidTextError implements FailureSearch {}

class DatasourceError implements FailureSearch {
  final String? message;
  DatasourceError({
    this.message,
  });
}
