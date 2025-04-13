import '../../domain/repositories/view_tasks_repository.dart';
import '../datasources/view_tasks_remote_datasource.dart';

class View_tasksRepositoryImpl implements View_tasksRepository {
  final View_tasksRemoteDataSource remoteDataSource;

  View_tasksRepositoryImpl(this.remoteDataSource);

  // TODO: Implement repository logic
}
