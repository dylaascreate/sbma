import 'package:flutter/material.dart';
import '../model/booking_model.dart';
import '../services/database_service.dart';

class BookingController extends ChangeNotifier {
  List<Booking> bookings = [];
  bool isLoading = false;
  bool hasError = false;

  Future<void> fetchBookings() async {
    isLoading = true;
    hasError = false;
    notifyListeners();

    try {
      bookings = await DatabaseService().getBookings();
    } catch (e) {
      hasError = true;
      print('BookingController error: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
