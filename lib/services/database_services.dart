import 'package:postgres/postgres.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DatabaseService {
  Connection? _connection;

  Future<Connection> _ensureInitializedConnection() async {
    if (_connection == null || !_connection!.isOpen) {
      await dotenv.load(fileName: ".env");
      _connection = await Connection.open(
        Endpoint(
          host: dotenv.env['DB_HOST']!,
          port: 5432,
          database: dotenv.env['DB_NAME']!,
          username: dotenv.env['DB_USER']!,
          password: dotenv.env['DB_PASSWORD']!,
        ),
        settings: ConnectionSettings(sslMode: SslMode.disable),
      );
    }
    return _connection!;
  }

  Future<Connection> getConnection() async {
    return _ensureInitializedConnection();
  }

  Future<void> closeConnection() async {
    if (_connection != null && _connection!.isOpen) {
      await _connection!.close();
      _connection = null;
    }
  }

  Future<void> killAllConnectionsExceptCurrent() async {
    final conn = await getConnection();

    try {
      await conn.execute(
        Sql('''
          WITH connections_to_terminate AS (
              SELECT pid
              FROM pg_stat_activity
              WHERE pg_stat_activity.datname = current_database()
              AND pid <> pg_backend_pid()
              ORDER BY backend_start DESC
              OFFSET 5
          )
          SELECT pg_terminate_backend(pid)
          FROM connections_to_terminate;
        '''),
      );
      print('All other connections have been terminated except for the last 5');
    } catch (e) {
      print('Error terminating connections: $e');
      throw Exception('Failed to terminate connections.');
    }
  }
}
