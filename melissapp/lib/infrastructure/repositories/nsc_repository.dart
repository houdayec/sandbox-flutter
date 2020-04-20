abstract class NscRepository {
  Future<String> computeYearsOfStudies(int numberOfYears);
}

class FakeNscRepository implements NscRepository {
  @override
  Future<String> computeYearsOfStudies(int numberOfYears) {
    
    return Future.delayed(Duration(milliseconds: 50), () {
      return "$numberOfYears années d'études";
    });
  }

}