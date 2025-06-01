import 'package:postgres/postgres.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../model/booking_model.dart';

/// Singleton service to handle PostgreSQL connection and fetching bookings.
class DatabaseService {
  Connection? _connection;
  static final DatabaseService _instance = DatabaseService._internal();
  factory DatabaseService() => _instance;
  DatabaseService._internal();

  Future<Connection> getConnection() async {
    if (_connection == null || !_connection!.isOpen) {
      print('Opening new database connection...');
      try {
        _connection = await Connection.open(
          Endpoint(
            host: dotenv.env['DB_HOST']!,
            port: int.parse(dotenv.env['DB_PORT'] ?? '5432'),
            database: dotenv.env['DB_NAME']!,
            username: dotenv.env['DB_USER']!,
            password: dotenv.env['DB_PASSWORD']!,
          ),
          settings: ConnectionSettings(
            sslMode: SslMode.disable,
            connectTimeout: Duration(seconds: 30),
          ),
        );
        print('Database connected.');
      } catch (e) {
        print('Failed to connect: $e');
        throw Exception('Database connection failed: $e');
      }
    }
    return _connection!;
  }

  Future<void> closeConnection() async {
    if (_connection != null && _connection!.isOpen) {
      try {
        await _connection!.close();
        _connection = null;
        print('Connection closed.');
      } catch (e) {
        print('Error closing connection: $e');
      }
    }
  }

  Future<List<Booking>> getBookings() async {
    final List<Booking> bookings = [];
    try {
      final conn = await getConnection();
      final result = await conn.execute(
        'SELECT id, title, image_path, link, price FROM bookings ORDER BY id ASC',
      );

      for (final row in result) {
        bookings.add(Booking.fromMap({
          'id': row[0] as int,
          'title': row[1] as String,
          'image_path': row[2] as String,
          'link': row[3] as String,
          'price': row[4] as String?,
        }));
      }
      print('Fetched ${bookings.length} bookings.');
    } catch (e) {
      print('Error fetching bookings: $e');
      throw Exception('Could not load bookings: $e');
    }
    return bookings;
  }
}
