class ReservationItem {
  final String title;
  final String subtitle;
  final String date;

  ReservationItem({
    required this.title,
    required this.subtitle,
    required this.date,
  });
}

final List<ReservationItem> reserveList = [
  ReservationItem(title: "Ağu", subtitle: "31", date: "Paz"),
  ReservationItem(title: "Eyl", subtitle: "1", date: "Pzt"),
  ReservationItem(title: "Eyl", subtitle: "2", date: "Salı"),
  ReservationItem(title: "Eyl", subtitle: "3", date: "Çar"),
  ReservationItem(title: "Eyl", subtitle: "4", date: "Per"),
  ReservationItem(title: "Eyl", subtitle: "4", date: "Per"),
  ReservationItem(title: "Eyl", subtitle: "4", date: "Per"),
  ReservationItem(title: "Eyl", subtitle: "4", date: "Per"),
];
