enum Operator {
  add,
  subtract,
  multiply,
  divide,
}

class EquationEvaluator {
  static bool evaluate(
    int left,
    Operator operator,
    int right,
    int result,
  ) {
    switch (operator) {
      case Operator.add:
        return left + right == result;

      case Operator.subtract:
        return left - right == result;

      case Operator.multiply:
        return left * right == result;

      case Operator.divide:
        if (right == 0) {
          return false;
        }
        return left / right == result;
    }
  }
}