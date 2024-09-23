enum MySeriesStatus {
  currentlyReading,
  completed,
  onHold,
  planToRead,
  dropped,
  notInterested,
}

extension MySeriesStatusExtension on MySeriesStatus {
  String get label {
    switch (this) {
      case MySeriesStatus.currentlyReading:
        return 'Currently Reading';
      case MySeriesStatus.completed:
        return 'Completed';
      case MySeriesStatus.onHold:
        return 'On Hold';
      case MySeriesStatus.planToRead:
        return 'Plan to Read';
      case MySeriesStatus.dropped:
        return 'Dropped';
      case MySeriesStatus.notInterested:
        return 'Not Interested';
      default:
        return 'Unknown';
    }
  }
}
