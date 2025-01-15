int? calculateResult(
    int countOfQuestion, int counteOfRighAnswer, int time, int point, int age) {
  if (time > 0 && time < 30) {
    if (countOfQuestion >= counteOfRighAnswer) {
      if (age > 10) {
        return (point * counteOfRighAnswer -
                point * (countOfQuestion - counteOfRighAnswer)) *
            time;
      } else {
        return 120;
      }
    } else {
      return null;
    }
  } else {
    return null;
  }
}
