/// Converts a [DateTime] to a string representing how long ago the date in Korean.
String timeAgo(DateTime date) {
  final difference = DateTime.now().difference(date);

  if (difference.inDays > 7) {
    return '${date.year}년 ${date.month}월 ${date.day}일';
  } else if (difference.inDays >= 1) {
    return '${difference.inDays}일';
  } else if (difference.inHours >= 1) {
    return '${difference.inHours}시간';
  } else if (difference.inMinutes >= 1) {
    return '${difference.inMinutes}분';
  } else {
    return '${difference.inSeconds}초';
  }
}
