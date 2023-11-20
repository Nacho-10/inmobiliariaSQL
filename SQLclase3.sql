SELECT * FROM game;
SELECT * FROM system_user;

/*usuarios cuyo nombre que comiencen con la letra J*/
SELECT * 
FROM system_user
WHERE first_name LIKE 'j%';

/*usuarios cuyo apellido que contenga la letra W*/
SELECT * 
FROM system_user
WHERE last_name LIKE '%w%';

/*usuarios cuyo nombre que su segunda letra sea la I*/
SELECT * 
FROM system_user
WHERE first_name LIKE '_i%';

/*usuarios cuyo nombre termine con la letra K*/
SELECT * 
FROM system_user
WHERE first_name LIKE '%k';

/*usuarios cuyo nombre no contienen la letra CH*/
SELECT * 
FROM system_user
WHERE first_name NOT LIKE '%ch%';







