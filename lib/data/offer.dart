class Offer {
  final String name;
  final String interestRate;
  final String annualFee;
  final String image;
  final String description;
  final String signupUrl;

  Offer(this.name, this.interestRate, this.annualFee, this.image,
      this.description, this.signupUrl);

  factory Offer.fromJson(Map<String, dynamic> json) {
    return Offer(
      json['name'],
      json['interest_rate'],
      json['annual_fee'],
      json['image'],
      json['description'],
      json['signup_url'],
    );
  }
}
