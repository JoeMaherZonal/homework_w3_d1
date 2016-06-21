--Section 1
  --Answer 1
  --SELECT name FROM users;
  /**
  name       
  ------------------
   Rick Henri
   Jay Chetty
   Keith Douglas
   Ashleigh Adams
   Euan Blackledge
   Chris Flint
   Nico di Lillo
   Joe Maher
   Marie Moyles
   Iain Stewart
   Megan Strachan
   Russell Williams
   Sam Werngren
   Natalie Simpson
   Davide de Lerma
   Josh Kearns
   Renwick Drysdale
   Brian Morrice
  (18 rows)
  **/

  --Answer 2
  --SELECT name FROM shows WHERE shows.price < 15;
  /**
               name             
  ------------------------------
   Le Haggis
   Paul Dabek Mischief 
   Best of Burlesque
   Two become One
   Urinetown
   Two girls, one cup of comedy
  (6 rows)
  **/

  --Answer 3
  --INSERT INTO "users" (name) VALUES ('Val Gibson');
  /**
  SELECT * FROM users WHERE name = 'Val Gibson'

   id |    name    
  ----+------------
   19 | Val Gibson
  (1 row)
  **/

  --Answer 4
  -- INSERT INTO shows_users (show_id, user_id) VALUES (
  --   (SELECT id FROM shows WHERE name = 'Two girls, one cup of comedy'),
  --   (SELECT id FROM users WHERE name = 'Val Gibson')
  --   );
  -- to prove it works
  -- SELECT * FROM shows_users WHERE user_id = (SELECT id FROM users WHERE name = 'Val Gibson');
  --  id | show_id | user_id 
  -- ----+---------+---------
  --  86 |      12 |      22
  -- (1 row)

  --Answer 5
  -- UPDATE users SET name = 'Valarie Gibson' WHERE name = 'Val Gibson';
  -- SELECT * FROM users WHERE name = 'Valarie Gibson';
  -- to prove it works

  --  id |      name      
  -- ----+----------------
  --  22 | Valarie Gibson
  -- (1 row)

  --Answer 6
  -- DELETE FROM shows_users WHERE user_id = (SELECT id FROM users WHERE name = 'Valarie Gibson');
  -- DELETE FROM users WHERE name = 'Valarie Gibson';
  -- SELECT * FROM users WHERE name = 'Valarie Gibson';
  -- SELECT * FROM shows_users WHERE user_id = (SELECT id FROM users WHERE name = 'Valarie Gibson');
  /**
  DELETE 1
  DELETE 1
   id | name 
  ----+------
  (0 rows)

   id | show_id | user_id 
  ----+---------+---------
  (0 rows)
  **/

--SECTION 2
  --Answer 8 missing from md

  --Answer 9
  -- SELECT shows.name, shows.price FROM shows ORDER BY shows.price ASC ;
  --                   name                   | price 
  -- -----------------------------------------+-------
  --  Two girls, one cup of comedy            |  6.00
  --  Best of Burlesque                       |  7.99
  --  Two become One                          |  8.50
  --  Urinetown                               |  8.50
  --  Paul Dabek Mischief                     | 12.99
  --  Le Haggis                               | 12.99
  --  Joe Stilgoe: Songs on Film – The Sequel | 16.50
  --  Game of Thrones - The Musical           | 16.50
  --  Shitfaced Shakespeare                   | 16.50
  --  Aaabeduation – A Magic Show             | 17.99
  --  Camille O'Sullivan                      | 17.99
  --  Balletronics                            | 32.00
  --  Edinburgh Royal Tattoo                  | 32.99
  -- (13 rows)

  --Answer 10
  -- SELECT ROUND(AVG(price),2) FROM shows;
  --  round 
  -- -------
  --  15.96
  -- (1 row)

  --Answer 11
  -- SELECT MIN(price) FROM shows;
  --  min  
  -- ------
  --  6.00
  -- (1 row)

  --Answer 12
  -- SELECT SUM(price) FROM shows;
  --   sum   
  -- --------
  --  207.44
  -- (1 row)

  --Answer 13
  -- SELECT SUM(price) FROM shows WHERE price < 20;
  --   sum   
  -- --------
  --  142.45
  -- (1 row)

  --Answer 14
  -- SELECT name, price FROM shows WHERE price = (SELECT MAX(price) FROM shows);
  --           name          | price 
  -- ------------------------+-------
  --  Edinburgh Royal Tattoo | 32.99
  -- (1 row)

  --Answer 15
  -- SELECT MIN(price) FROM shows WHERE price > (SELECT MIN(price) FROM shows);
  --  min  
  -- ------
  --  7.99
  -- (1 row)

  --Answer 16
 --  SELECT users.name FROM users WHERE users.name LIKE 'N%';
 --       name       
 -- -----------------
 --  Nico di Lillo
 --  Natalie Simpson
 -- (2 rows)

  --Answer 17
  -- SELECT name FROM users WHERE name LIKE '%' || 'er' || '%';
  --       name       
  -- -----------------
  --  Joe Maher
  --  Sam Werngren
  --  Davide de Lerma
  -- (3 rows)

  --Answer 18
  -- SELECT times.time, shows.name FROM shows
  -- INNER JOIN times ON shows.id = times.show_id WHERE shows.name = 'Edinburgh Royal Tattoo';
  --  time  |          name          
  -- -------+------------------------
  --  22:00 | Edinburgh Royal Tattoo
  -- (1 row)

  --Answer 19
  -- SELECT count(users.name) FROM users
  -- INNER JOIN shows_users ON shows_users.user_id = users.id
  -- INNER JOIN shows ON shows.id = shows_users.show_id WHERE shows_users.show_id = (SELECT shows.id FROM shows WHERE shows.name = 'Shitfaced Shakespeare');
  --  count 
  -- -------
  --      7
  -- (1 row)

  -- Answer 20
  -- SELECT COUNT(shows.name), users.name FROM users
  -- INNER JOIN shows_users ON users.id = shows_users.user_id
  -- INNER JOIN shows ON shows.id = shows_users.show_id
  -- GROUP BY users.name;

  --  count |       name       
  -- -------+------------------
  --      4 | Chris Flint
  --      4 | Euan Blackledge
  --      5 | Joe Maher
  --      4 | Ashleigh Adams
  --      6 | Russell Williams
  --      4 | Nico di Lillo
  --      5 | Megan Strachan
  --      6 | Keith Douglas
  --      5 | Sam Werngren
  --      7 | Marie Moyles
  --      6 | Iain Stewart
  --      8 | Natalie Simpson
  --      7 | Davide de Lerma
  --      5 | Jay Chetty
  --      5 | Rick Henri
  -- (15 rows)

  --Answer 21
  -- SELECT users.name AS User_name, shows.name AS Show_Name, times.time AS Show_time  FROM users
  -- INNER JOIN shows_users ON shows_users.user_id = users.id
  -- INNER JOIN shows ON shows.id = shows_users.show_id
  -- INNER JOIN times ON times.show_id = shows_users.show_id
  -- WHERE times.time = '17:15';

  --     user_name     |                show_name                | show_time 
  -- ------------------+-----------------------------------------+-----------
  --  Rick Henri       | Camille O'Sullivan                      | 17:15
  --  Keith Douglas    | Camille O'Sullivan                      | 17:15
  --  Euan Blackledge  | Camille O'Sullivan                      | 17:15
  --  Joe Maher        | Camille O'Sullivan                      | 17:15
  --  Marie Moyles     | Camille O'Sullivan                      | 17:15
  --  Sam Werngren     | Camille O'Sullivan                      | 17:15
  --  Davide de Lerma  | Camille O'Sullivan                      | 17:15
  --  Megan Strachan   | Joe Stilgoe: Songs on Film – The Sequel | 17:15
  --  Russell Williams | Joe Stilgoe: Songs on Film – The Sequel | 17:15
  --  Sam Werngren     | Joe Stilgoe: Songs on Film – The Sequel | 17:15
  --  Iain Stewart     | Joe Stilgoe: Songs on Film – The Sequel | 17:15
  --  Natalie Simpson  | Joe Stilgoe: Songs on Film – The Sequel | 17:15
  -- (12 rows)






