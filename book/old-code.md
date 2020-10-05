# Code that might be needed

## PSQL staored proc

```javascript
'use strict'
const pool = require('./pool')
const { sql } = require('slonik')
const moment = require('moment')

const createStoredProc = async () => {
    return pool.query(sql`
        CREATE OR REPLACE PROCEDURE update_time_per_issue_size()
        LANGUAGE plpgsql
        AS $$
        /*
        Update the time_per_issue_size table, which holds the average amount of time
        taken per issue point size.
         */
        BEGIN
            TRUNCATE TABLE point_duration;
        
            WITH snapshots_with_next AS (
                SELECT *,
                       COALESCE(LEAD(snapshot_date) OVER (PARTITION BY issue_jid ORDER BY snapshot_date),
                                date_trunc('hour', now())) AS next_hour
                FROM issue_snapshots -- TODO EdS: Change to hourly
                WHERE issue_jid IN (SELECT DISTINCT issue_jid FROM issue_snapshots)
                  AND board_id = 3 -- TODO EdS:
                ORDER BY snapshot_date
            ),
            duration_per_status AS (
                SELECT points,
                       status,
                       SUM(next_hour - snapshot_date) AS duration,
                       COUNT(*) AS count
                FROM snapshots_with_next
                GROUP BY points, status
            ),
            total_duration_with_count AS (
                SELECT points,
                        SUM(duration) AS total_duration,
                        SUM(count) AS count
                FROM duration_per_status
                WHERE status <> 'done' AND status <> 'to_do'
                GROUP BY points
            ),
            duration_per_issue_point_size AS (
                SELECT points,
                   total_duration / count AS duration
                FROM total_duration_with_count
            )
            INSERT INTO point_duration
            SELECT *
            FROM duration_per_issue_point_size;
        
            COMMIT;
        END;
        $$;
    `)
}

const updatePointDuration = async () => {
    return pool.query(sql`
        CALL update_time_per_issue_size();
    `)
}

module.exports = {
    createStoredProc,
    updatePointDuration
}
```