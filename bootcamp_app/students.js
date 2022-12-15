const { Pool } = require('pg');

const pool = new Pool({
  user: 'labber',
  password: '3313',
  host: 'localhost',
  database: 'bootcampx'
});

pool.connect();

const cohort = process.argv[2];
const limit = process.argv[3];
const values = [`%${cohort}%`, limit];

// query is a function that accepts a SQL query as a JavaScript string
// returns a promise that contains our result when successful
pool.query(`
SELECT students.id as student_id, students.name as name, cohorts.name as cohort_name
FROM students
JOIN cohorts ON cohorts.id = students.cohort_id
WHERE cohorts.name LIKE $1
LIMIT $2;
`, values)
  .then(res => {
    res.rows.forEach(users => {
      console.log(`${users.name} has an id of ${users.student_id} and was in the ${users.cohort_name} cohort`
      );
    }

    );
  })
  .catch(err => console.error('query error', err.stack));