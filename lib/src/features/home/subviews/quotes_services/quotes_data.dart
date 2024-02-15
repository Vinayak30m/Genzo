class QuoteService {
  static final List<String> quotes = [
    'Quote 1',
    'Quote 2',
    'Quote 3',
    'Quote 4',
    'Quote 5',
  ];

  static Stream<String> getQuoteStream() {
    // ignore: prefer_const_constructors
    return Stream.periodic(Duration(seconds: 10), (index) {
      return quotes[index % quotes.length];
    });
  }
}
