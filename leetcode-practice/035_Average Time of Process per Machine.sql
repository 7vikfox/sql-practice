Average Time of Process per Machine

Problem

Given a table Activity that logs when a machine starts and ends a process, compute the average time each machine takes to complete a process.

Each (machine_id, process_id) has exactly one 'start' and one 'end'.
Processing time = end - start
Return the average processing time per machine, rounded to 3 decimal places.

Approach
Pair each start and end record using machine_id and process_id.
Compute the duration for each process.
Take the average duration per machine_id.
Round the result to 3 decimal places.

SQL Solution (Using Aggregation)

SELECT 
    machine_id,
    ROUND(AVG(end_time - start_time), 3) AS processing_time
FROM (
    SELECT 
        machine_id,
        process_id,
        MAX(CASE WHEN activity_type = 'start' THEN timestamp END) AS start_time,
        MAX(CASE WHEN activity_type = 'end' THEN timestamp END) AS end_time
    FROM Activity
    GROUP BY machine_id, process_id
) t
GROUP BY machine_id;


Alternative Solution (Self Join)

SELECT 
    a.machine_id,
    ROUND(AVG(b.timestamp - a.timestamp), 3) AS processing_time
FROM Activity a
JOIN Activity b
    ON a.machine_id = b.machine_id
    AND a.process_id = b.process_id
    AND a.activity_type = 'start'
    AND b.activity_type = 'end'
GROUP BY a.machine_id;


Complexity
Time: O(n)
Space: O(n) for intermediate grouping

Notes

CASE WHEN helps pivot start and end timestamps into columns.
Guaranteed constraints simplify logic (no missing pairs).
Works efficiently even for large datasets.
