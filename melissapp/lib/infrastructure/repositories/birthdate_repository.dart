abstract class BirthdateRepository {
  Future<String> computeAge(DateTime birthdate);
}

class FakeBirthdateRepository implements BirthdateRepository {

  @override
  Future<String> computeAge(DateTime birthdate) {
    return Future.delayed(Duration(seconds: 1), () {
      final currentTime = DateTime.now();
      var difference = currentTime.difference(birthdate).inDays;
      int numberOfYears = (difference / 365).floor();
      var numberOfDaysLeft = difference - (numberOfYears*365);
      int numberOfMonths = (numberOfDaysLeft / 30.4).floor();
      if(numberOfMonths >= 12){
        int numberOfYearsTemp = (numberOfMonths / 12).floor();
        numberOfMonths = numberOfMonths - (numberOfYearsTemp * 12);
        numberOfYears += numberOfYearsTemp;
      }
      numberOfDaysLeft = (numberOfDaysLeft - (numberOfMonths*30.4)).round();
      int numberOfDays = numberOfDaysLeft;
      if(numberOfDays >= 30.4){
        int numberOfMonthsTemps = (numberOfDays / 30.4).floor();
        numberOfDays = numberOfDays - (numberOfMonthsTemps * 12);
        numberOfMonths += numberOfMonthsTemps;
      }
      return "$numberOfYears ans $numberOfMonths mois $numberOfDays jours";
    });
  }

}