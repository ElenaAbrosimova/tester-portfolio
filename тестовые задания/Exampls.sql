--1. Найдите id (поле user_id) пользователя с почтой houston42@gmail.com (таблица users). 
SELECT user_id FROM users where user_email = 'houston42@gmail.com';
--Ответ: 14924
 
--2. Найдите уровень (поле level) студента с user_id = 44133 (таблица student).
SELECT level from student where user_id = '44133';
--Ответ: Beginner
 
3. Найдите предмет (поле subject_title) с id = 8 (таблица subject).
Запрос: SELECT subject_title from subject where subject_id = '8';
 Ответ: History
 
4. Найдите email учителя группы с group_id = 80 (таблица teacher).
Запрос: SELECT email from teacher where group_id = '80';
Ответ: eldora.walsh@hotmail.com

5. Выведите уникальные форматы обучения (education_form) для студента с user_id = 12203 (таблица student).
Запрос: SELECT DISTINCT education_form from student where user_id = '12203';
Ответ: group, personal
 
6. Создание таблицы rooms
CREATE TABLE rooms (
	room_id INTEGER,
	teacher_id INTEGER,
	floor_num INTEGER
);

7. Заполнение таблицы rooms
INSERT INTO rooms (room_id, teacher_id, floor_num)
VALUES
(1, 965, 1),
(2, 29091, 1),
(3, 29410, 1),
(10, 33576, 2),
(11,33902, 2);

8. Выведите id учителей с кабинетами на втором этаже.
Запрос: SELECT teacher_id from rooms where floor_num = '2';
Ответ: 33576, 33902

9. Выведите id учителей, которые получают зарплату в евро.
Запрос: SELECT teacher_id from salary where salary_val = 'EUR';
Ответ: 29410, 33902
 
10. Выведите уровень студента с id = 9651. При этом задайте алиас (псевдоним) для колонки как stud_level, а для таблицы — s.
Запрос: SELECT level as stud_level from student AS s WHERE s.user_id = '9651';
Ответ: Beginner
 
11. Выведите email учителей с id 30019 и 31433 (в одном запросе).
Запрос: SELECT email from teacher WHERE teacher_id= '30019' OR  teacher_id= '31433';
Ответ: mturcotte@fadel.com  	jaleel52@kling.info

12. Выведите данные о пользователях с уровнем Advanced, занимающихся в группах (group), и о пользователях с уровнем Upper-Intermediate, занимающихся индивидуально (personal).
Запрос: SELECT * from STUDENT where (level='Advanced' AND education_form='group') OR (level='Upper-Intermediate' AND education_form='personal');
 
13. Выведите данные об учителях из групп от 180 до 190 (group_id).
Запрос: SELECT * from teacher where group_id BETWEEN 180 AND 190;
 
14. Выведите данные о пользователях, у которых email заканчивается на yahoo.com
Запрос: SELECT * from teacher where email LIKE '%yahoo.com';
 
15. Добавьте в таблицу subject новый предмет — Chinese (выберите id, равное 16 или следующее по порядку).
Запрос:INSERT INTO subject (subject_id, subject_title) VALUES (17, 'Chinese');
 
16. Обновите данные учителя с id 5562. У него изменилась почта с cold@gmail.com на cold5562@gmail.com.
Запрос: UPDATE teacher SET email= 'cold5562@gmail.com' where teacher_id ='5562';
 
17. Создание таблицы posts
CREATE TABLE posts (
	post_id INTEGER,
	text_len INTEGER,
	post_date DATE
);
 
18. Заполнение таблицы posts
INSERT INTO posts (post_id, text_len, post_date)
VALUES
(1,6799,'09.03.2023'),
(2,7800,'12.03.2023'),
(3,6907,'19.03.2023'),
(4,8890,'22.03.2023'),
(5,9802,'30.03.2023');
 
19. Создание таблицы tags
CREATE TABLE tags (
	post_id INTEGER,
	tag TEXT);
 
20. Заполнение таблицы tags
INSERT INTO tags (post_id, tag)
VALUES
(1,'nofilter'),
(2,'happy'),
(3,'joy'),
(4,'music'),
(5,'dark');
 
21. Выведите данные по постам, которые длиннее 8000 символов.
Запрос:
SELECT * from posts WHERE text_len > 8000;
 
22. Выведите id постов, которые отмечены тегами happy или joy.
SELECT tag from tags WHERE tag  LIKE 'happy' OR tag LIKE 'joy';
 
23. Выведите id постов, которые были размещены до 10 марта 2023.
SELECT post_id from posts WHERE post_date < '10.03.2023';
 
24. Добавьте пост с id 6, сделанный 31 марта 2023, содержащий 10782 символ и отмеченный тегом love (два INSERT в обе таблицы).
INSERT INTO posts (post_id, text_len, post_date)
VALUES (6, 10782, '31.03.2023');

INSERT INTO tags (post_id, tag)
VALUES (6,' love ');
 
25. Измените тег для поста с id =5 c dark на live.
UPDATE tags SET tag = 'live' WHERE post_id = 5;

26. Определите id предмета (subject_id), который изучает наименьшее количество пользователей. Таблица для запроса - users. Ответ введите в поле.
  select TOP 1 subject_id FROM users GROUP BY subject_id ORDER BY COUNT(user_id)
 Select subject_id, count (*) from users group by subject_id order by count (*);
  
27. Определите наиболее распространенный уровень владения английским языком (level) среди учеников, изучающих английский язык. Таблица для запроса - student. Ответ введите в поле.
select TOP 1 level FROM student GROUP BY level ORDER BY COUNT(user_id) DESC

28. Определите наиболее распространенный уровень владения английским языком (level) среди учеников, изучающих английский язык в группе (education_form = 'group') Таблица для запроса - student. Ответ введите в поле.
 select TOP 1 level FROM student where education_form= 'group' GROUP BY level ORDER BY COUNT(user_id) DESC
 
29. Какие запросы позволяют группировать данные по уровню владения английским языком?
SELECT level, COUNT(*)
FROM student
GROUP BY level;
 
SELECT level, COUNT(*)
FROM student
GROUP BY 1;
 
30. В таблице users для каждого предмета (subject_id) указать количество учеников, которые занимаются по этим предметам. Затем среди сгруппированных данных найти предмет, т.е. subject_id, для которого количество учеников равно 119
SELECT subject_id, COUNT(*)
FROM users
GROUP BY subject_id
HAVING COUNT(*) = 119;

31. Напишите id группы, в которой наибольшее количество учеников.
Таблица для запроса - group_student. Ответ введите в поле.
select TOP 1 group_id, COUNT (*) from group_student GROUP BY Group_id ORDER BY COUNT (*) DESC

32. Найдите общее количество индивидуально обучающихся студентов для каждого уровня.
Запрос:  SELECT COUNT (user_id), level from student where education_form= 'personal' GROUP BY  level;

33. Найдите общее количество учащихся школы с уровнем Advanced для каждой формы обучения.
Запрос:  SELECT COUNT (user_id), level, education_form from student where level = 'Advanced' GROUP BY  level, education_form;

34. Найдите общее количество учащихся школы в разрезе уровня и формы обучения, отсортированных по уровню в порядке возрастания и по форме обучения в порядке убывания.
Запрос: SELECT COUNT (user_id), level, education_form from student GROUP BY  level, education_form ORDER BY level, education_form DESC;

35. Найдите максимальное и минимальное id группы (одним запросом).
Запрос: SELECT MAX(group_id), MIN (group_id) from group_student;

36. Найдите количество учеников и id группы, в которой наибольшее количество учеников.
Запрос: SELECT TOP 1 COUNT (user_id), group_id from group_student GROUP BY group_id ORDER BY COUNT (user_id) DESC;
 
37. Создание таблицы sales
CREATE TABLE sales (
	sale_id INTEGER,
	store_id INTEGER,
	customer_id INTEGER,
	dt DATE,
	amt numeric (10,2)
 );

38. INSERT INTO sales (sale_id, store_id, customer_id, dt, amt)
VALUES
(99,5, 1, '2023-02-15', 3806.88),
(88,4, 2, '2023-03-07', 9723.02 ),
(77,3, 3, '2023-04-10' , 6825.84),
(66,2, 4, '2023-05-19', 7213.14 ),
(55,6, 2, '2023-06-01', 8689.66 ),
(44,1, 4, '2023-01-16', 4519.87 )
;
 
39. Создание таблицы customers
CREATE TABLE customers (
	customer_id INTEGER,
	customer_nm varchar (255)
 );
 
40. Заполнение таблицы
INSERT INTO customers ( customer_id, customer_nm)
 
VALUES
(1, 'Ivan'),
(2, 'Anna'),
(3, 'Maks'),
(4, 'Irina');
 
41. Выведите максимальную сумму покупки.
Запрос: SELECT MAX(amt) FROM sales;
 
42. Выведите минимальную дату покупки.
Запрос: SELECT MIN(dt) FROM sales;
 
43. Выведите среднюю сумму покупок для customer_id = 1.
Запрос: SELECT AVG(amt) FROM sales where customer_id = 1;
 
44. Выведите минимальную и максимальную сумму покупки, совершенную в магазине с store_id = 3 или покупателем с customer_id = 2.
SELECT MAX(amt) as max, MIN(amt) as min from sales where store_id = 3 OR customer_id = 2;
 
45. Выведите количество уникальных имен покупателей.
Запрос: SELECT DISTINCT COUNT (customer_nm)  FROM customers;
 
46. Определите id учеников, которые занимаются в группе у преподавателя с teacher_id = 30239. Таблицы для запроса: group_student и teacher.
Идентификационные номера учеников введите через запятую без пробелов в поле.
SELECT user_id from group_student inner join teacher
on group_student.group_id=teacher.group_id
where teacher_id = 30239;
 
47.Определите email преподавателя группы, в которой занимается ученик с user_id = 11527. Таблицы для запроса: group_student и teacher.
 
SELECT email from group_student inner join teacher
on group_student.group_id=teacher.group_id
where user_id = 11527;
 
48.Определите id преподавателя группы, в которой занимается наибольшее количество учеников. Таблицы для запроса: group_student и teacher.
SELECT TOP 1 count (user_id),teacher_id from group_student inner join teacher
on group_student.group_id=teacher.group_id GROUP BY teacher_id ORDER BY count (user_id) DESC;

49. Найдите учеников и все группы, в которых преподает учитель с почтой blanda.jamil@yahoo.com.
SELECT user_id, group_student.group_id from group_student inner join teacher
on group_student.group_id=teacher.group_id
where email = 'blanda.jamil@yahoo.com';
 
50. Выведите уровень ученика с почтой gpagac@jacobs.com.
SELECT level
FROM student INNER JOIN users
ON student.user_id=users.user_id
Where user_email='gpagac@jacobs.com';
 
51. Выведите уникальные названия предметов, которые изучает ученик c user_id=11300 (таблицы user и subject).
SELECT distinct subject_title
FROM users INNER JOIN subject
ON users.subject_id=subject.subject_id
WHERE user_id=11300;
 
52. Выведите уникальные уровни учеников, которые занимаются в группе с id = 10.
SELECT distinct level
FROM student INNER JOIN group_student
ON student.user_id=group_student.user_id
Where group_id=10;
 
53. Создание таблицы Positions:
CREATE TABLE positions
([номер чека] INTEGER,
[номер позиции чека] INTEGER,
[артикул] VARCHAR (3),
[кол-во штук] INTEGER);
 
54. Заполнение таблицы Positions
INSERT INTO positions ([номер чека], [номер позиции чека], [артикул], [кол-во штук])
VALUES
(1,1,'A1',1),
(1,2,'A4',3),
(1,3,'A2',2),
(1,4,'A10',1),
(1,5,'A8',4),
(2,1,'A5',1),
(2,2,'A7',1),
(2,3,'A3',2),
(3,1,'A2',1),
(3,2,'A9',1),
(3,3,'A5',2),
(3,4,'A6',1),
(3,5,'A3',3),
(4,1,'A1',3),
(4,2,'A2',1),
(5,1,'A2',1),
(5,2,'A8',5),
(5,3,'A3',1),
(5,4,'A4',1),
(5,5,'A5',1);
 
55. Создание таблицы Products:
CREATE TABLE products
([артикул] VARCHAR(3),
[продукт] NVARCHAR(20),
[категория] NVARCHAR(20));
 
56. Заполнение таблицы Products:
INSERT INTO products
VALUES
('art', 'product', 'category'),
('A1', '[кроссовки]', '[обувь]'),
('A2', '[кеды]', '[обувь]'),
('A3', '[сланцы]', '[обувь]'),
('A4', '[куртка]', '[одежда]'),
('A5', '[ветровка]', '[одежда]'),
('A6', '[шорты]', '[одежда]'),
('A7', '[палатка]', '[туризм]'),
('A8', '[коврик]', '[туризм]'),
('A9', '[спальник]', '[туризм]'),
('A10', '[рюкзак]', '[туризм]'),
('A11', '[туфли]', '[обувь]'),
('A12', '[солнечные очки]', '[аксессуары]');
 
 57. Выведите названия категорий, которые были куплены в чеке с id = 3.
SELECT distinct [категория] from products inner join positions
ON products.[артикул]=positions.[артикул]
 WHERE [номер чека]=3;
 
58. Выведите артикулы продуктов, которые не покупали (т. е. они не встречаются ни в одном чеке).
SELECT [артикул]  from products
 WHERE products.[артикул] NOT IN (select positions.[артикул] from positions);
 второй вариант (менее правильный)
 SELECT distinct products.[артикул]  from products LEFT join positions
ON positions.[артикул]=products.[артикул]
 WHERE positions.[артикул] is null;
 
59. Посчитайте количество чеков, в которых куплено больше двух пар одинаковой обуви.
select  count ([номер чека]) from positions inner join products
 ON positions.[артикул]=products.[артикул]
 where products.[категория]='[обувь]' AND [кол-во штук]>2;
 
60. Посчитайте количество чеков, в которых куплено больше двух позиций любой одежды.
select count ([номер чека]) from positions inner join products
 ON positions.[артикул]=products.[артикул]
 where products.[категория]='[одежда]' AND [кол-во штук]>2;
 второй вариант: 
select count ([номер чека]) from positions where [артикул] in (select [артикул] from products where [категория]='[одежда]') and [кол-во штук]>2

61.Составьте запрос, который выведет имя вида с наименьшим id. 
SELECT TOP 1 species_name from species ORDER BY species_id


62. Составьте запрос, который выведет имя вида с количеством представителей более 1800. 
SELECT species_name from species where species_amount>1800


63. Составьте запрос, который выведет имя вида, начинающегося на «п» и относящегося к типу с type_id = 5.
SELECT species_name from species where species_name LIKE 'п%' AND type_id = 5


64. Составьте запрос, который выведет имя вида, заканчивающегося на «са» или количество представителей которого равно 5. 
SELECT species_name from species where species_name LIKE '%са' AND species_amount = 5

65. Составьте запрос, который выведет имя вида, появившегося на учете в 2023 году. 
select DISTINCT species_name from species where year(date_start)=2023

66. Составьте запрос, который выведет названия отсутствующего (status = absent) вида, расположенного вместе с place_id = 3. 
SELECT species_name from species inner join species_in_places
ON species.species_id=species_in_places.species_id
where species_status = 'absent' AND place_id = 3

67. Составьте запрос, который выведет название вида, расположенного в доме и появившегося в мае, а также и количество представителей вида. 
SELECT species_name, species_amount
from species inner join species_in_places
ON species.species_id=species_in_places.species_id
inner join places
ON species_in_places.place_id=places.place_id
WHERE place_name='дом' AND MONTH(date_start)=05

68. Составьте запрос, который выведет название вида, состоящего из двух слов (содержит пробел).
SELECT species_name from species where species_name like '%[ ]%'

69.Составьте запрос, который выведет имя вида, появившегося с малышом в один день. 
Вариант 1
SELECT species_name from species where  date_start = (SELECT date_start from species where species_name='малыш') AND species_name != 'малыш'

Вариант 2
SELECT  s.species_name from species as s INNER JOIN (SELECT species_id, date_start from species where species_name='малыш') as m 
ON s.date_start = m.date_start AND s.species_id != m.species_id

70. Составьте запрос, который выведет название вида, расположенного в здании с наибольшей площадью. 
  SELECT TOP 1 species_name
  FROM species inner join species_in_places
  ON species.species_id=species_in_places.species_id 
  inner join places
  ON species_in_places.place_id=places.place_id
  WHERE places.place_name in ('сарай', 'дом') ORDER BY places.place_size  DESC

71. Составьте запрос/запросы, которые найдут название вида, относящегося к 5-й по численности группе проживающей дома. 

Вариант 1
select TOP 1 * from (select TOP 5 species.* from species inner join species_in_places
ON species_in_places.species_id=species.species_id
inner join places ON places.place_id=species_in_places.place_id
where places.place_name='дом' ORDER BY species.species_amount DESC) as t ORDER BY species_amount
(попугай)

Вариант 2 (два запроса)
 select TOP 1 *  from (SELECT TOP 5 type_id, SUM(species_amount) as S
 from species inner join species_in_places
 ON species.species_id=species_in_places.species_id
 inner join places
  ON places.place_id=species_in_places.place_id 
  GROUP BY  type_id ORDER BY SUM(species_amount) DESC) as t ORDER BY S

  SELECT * 
  from species inner join species_in_places
  ON species.species_id=species_in_places.species_id
  inner join places
  ON places.place_id=species_in_places.place_id
  where type_id=3  AND places.place_name='дом' ORDER BY species_amount DESC 

72. Составьте запрос, который выведет сказочный вид (статус fairy), не расположенный ни в одном месте. 
 
 Вариант 1
   SELECT * from species left join species_in_places
  ON species.species_id=species_in_places.species_id
    where species_status='fairy' AND species_in_places.species_id IS NULL

Вариант 2
  SELECT * from species 
    where species_status='fairy' AND species.species_id NOT IN  (select species_in_places.species_id from species_in_places)


 
 
