class ReservationItem {
  final String title;
  final String subtitle;
  final String date;
  final String day;
  final String fee;
  ReservationItem({
    required this.title,
    required this.subtitle,
    required this.date,
    required this.day,
    required this.fee,
  });
}

final List<ReservationItem> reserveList = [
  ReservationItem(
    title: "4",
    subtitle: "Eylül",
    date: "4 Eylül 2025",
    day: "Perşembe",
    fee: "0.00₺",
  ),
  ReservationItem(
    title: "5",
    subtitle: "Eylül",
    date: "5 Eylül 2025",
    day: "Cuma",
    fee: "0.00₺",
  ),
  ReservationItem(
    title: "6",
    subtitle: "Eylül",
    date: "6 Eylül 2025",
    day: "Cumartesi",
    fee: "0.00 ₺ - 50,00₺",
  ),
  ReservationItem(
    title: "7",
    subtitle: "Eylül",
    date: "7 Eylül 2025",
    day: "Pazar",
    fee: "0.00 ₺ - 50,00₺",
  ),
  ReservationItem(
    title: "8",
    subtitle: "Eylül",
    date: "8 Eylül 2025",
    day: "Pazartesi",
    fee: "10.00 ₺ - 30,00₺",
  ),
  ReservationItem(
    title: "9",
    subtitle: "Eylül",
    date: "9 Eylül 2025",
    day: "Salı",
    fee: "0.00 ₺",
  ),
  ReservationItem(
    title: "10",
    subtitle: "Eylül",
    date: "10 Eylül 2025",
    day: "Çarşamba",
    fee: "0.00 ₺ - 50,00₺",
  ),
  ReservationItem(
    title: "11",
    subtitle: "Eylül",
    date: "11 Eylül 2025",
    day: "Perşembe",
    fee: "0.00 ₺ - 50,00₺",
  ),
];
