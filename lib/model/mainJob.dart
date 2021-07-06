class job {
  final int jobcount;
  final List<dynamic> jobs;

  job({
    required this.jobcount,
    required this.jobs,
  });

  factory job.fromJson(Map<String, dynamic> json) {
    return job(
      jobcount: json['job-count'],
      jobs: json['jobs'],
    );
  }
}
