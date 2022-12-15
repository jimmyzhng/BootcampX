const { Pool } = require('pg');

const pool = new Pool({
  user: 'labber',
  password: '3313',
  host: 'localhost',
  database: 'bootcampx'
});

pool.connect();

// Cohort name as input
const cohort = process.argv[2];
const values = [`${cohort}`];

// query is a function that accepts a SQL query as a JavaScript string
// returns a promise that contains our result when successful
pool.query(`
SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort
FROM teachers
JOIN assistance_requests ON teacher_id = teachers.id
JOIN students ON student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name = $1
ORDER BY teacher;
`, values)
  .then(res => {
    res.rows.forEach(teachers => {
      console.log(`${cohort}: ${teachers.teacher}`
      );
    }

    );
  })
  .catch(err => console.error('query error', err.stack));