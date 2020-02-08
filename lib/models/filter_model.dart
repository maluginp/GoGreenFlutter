abstract class Filter {}

class LocationListFilter extends Filter {
  String name;

  LocationListFilter({
    this.name = "",
  });


}

class TransactionListFilter extends Filter {}
