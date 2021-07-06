class Jobs {
  final int id;
  final String url;
  final String title;
  final String companyname;
  final String category;
  final String jobtype;
  final String date;
  final String candidatelocation;
  final String salary;
  final String description;

  const Jobs(
      {required this.id,
      required this.url,
      required this.title,
      required this.companyname,
      required this.category,
      required this.jobtype,
      required this.date,
      required this.candidatelocation,
      required this.salary,
      required this.description});

  factory Jobs.fromJson(Map<String, dynamic> json) => Jobs(
      id: json['id'],
      url: json['url'],
      title: json['title'],
      companyname: json['company_name'],
      category: json['category'],
      jobtype: json['job_type'],
      date: json['publication_date'].toString(),
      candidatelocation: json['candidate_required_location'],
      salary: json['salary'],
      description: json['description']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'url': url,
        'company_name': companyname,
        'category': category,
        'job_type': jobtype,
        'publication_date': date,
        'candidate_required_location': candidatelocation,
        'salary': salary,
        'description': description
      };
}
