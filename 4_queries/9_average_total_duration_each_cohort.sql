SELECT AVG(average_assistance_time) AS average_total_duration
FROM (
  SELECT cohorts.name, SUM(completed_at - started_at) AS average_assistance_time
  FROM assistance_requests
  JOIN students ON students.id = assistance_requests.student_id
  JOIN cohorts ON cohorts.id = students.cohort_id
  GROUP BY cohorts.name
) AS avg_cohort_time;