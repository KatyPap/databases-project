USE tvondemand;


-- New Inserts --
INSERT INTO series(series_id,title,description,language_id,original_language_id,release_year,seasons,rating,special_features)
VALUES (1,'La casa de papel','An unusual group of robbers attempt to carry out the most perfect robbery in Spanish history - stealing 2.4 billion euros from the Royal Mint of Spain.',1,2,2017,5,'PG-13','Trailers'),
(2,'The Sandman','Upon escaping after decades of imprisonment by a mortal wizard, Dream, the personification of dreams, sets about to reclaim his lost equipment.',1,1,2022,1,'PG','Commentaries'),
(3,'Stranger Things','When a young boy disappears, his mother, a police chief and his friends must confront terrifying supernatural forces in order to get him back.',1,1,2016,4,'R','Trailers'),
(4,'She Hulk','Jennifer Walters navigates the complicated life of a single, 30-something attorney who also happens to be a green 6-foot-7-inch superpowered Hulk.',1,1,2022,1,'NC-17','Behind the Scenes'),
(5,'Black Bird','Jimmy Keene is sentenced to 10 years in a minimum security prison but he cuts a deal with the FBI to befriend a suspected serial killer. Keene has to elicit a confession from Larry Hall to find the bodies of as many as eighteen women.',1,3,2022,1,'G','Commentaries'),
(6,'The resort','Exploring love and the weird things we do in the name of it, encased in an elaborate true-crime conspiracy.',1,1,2022,1,'G','Behind the Scenes'),
(7,'Lucifer','Lucifer Morningstar has decided hes had enough of being the dutiful servant in Hell and decides to spend some time on Earth to better understand humanity. He settles in Los Angeles - the City of Angels.',1,1,2016,6,'PG','Behind the Scenes'),
(8,'Sex Education', 'A teenage boy with a sex therapist mother teams up with a high school classmate to set up an underground sex therapy clinic at school.',1,1,2019,3,'NC-17','Commentaries'),
(9,'Attack on titan','After his hometown is destroyed and his mother is killed, young Eren Jaeger vows to cleanse the earth of the giant humanoid Titans that have brought humanity to the brink of extinction.',1,4,2013,4,'NC-17','Trailers'),
(10,'Daredevil','A blind lawyer by day, vigilante by night. Matt Murdock fights the crime of New York as Daredevil.',1,3,2015,3,'PG','Deleted Scenes'),
(11,'From','Unravel the mystery of a city in middle U.S.A. that imprisons everyone who enters. As the residents struggle to maintain a sense of normalcy and seek a way out, they must also survive the threats of the surrounding forest.',1,3,2022,2,'R','Deleted Scenes'),
(12,'The Punisher','After the murder of his family, Marine veteran Frank Castle becomes the vigilante known as "The Punisher," with only one goal in mind: to avenge them.',1,1,2017,2,'R','Commentaries'),
(13,'Sons of Anarch','A biker struggles to balance being a father and being involved in an outlaw motorcycle club.',1,4,2008,7,'PG','Deleted Scenes'),
(14,'Sherlock','A modern update finds the famous sleuth and his doctor partner solving crime in 21st-century London.',1,2,2010,4,'NC-17','Trailers'),
(15,'Narcos','A chronicled look at the criminal exploits of Colombian drug lord Pablo Escobar, as well as the many other drug kingpins who plagued the country through the years.',1,2,2015,3,'PG-13','Behind the Scenes'),
(16,'Chernobyl','In April 1986, an explosion at the Chernobyl nuclear power plant in the Union of Soviet Socialist Republics becomes one of the worlds worst man-made catastrophes.',1,4,2019,1,'G','Commentaries'),
(17,'Mr. Bean','Bumbling, childlike Mr. Bean has trouble completing the simplest of tasks in day-to-day life, but his perseverance and resourcefulness frequently allow him to find ingenious ways around problems.',1,1,1990,1,'R','Deleted Scenes'),
(18,'Mr. Robot','Elliot, a brilliant but highly unstable young cyber-security engineer and vigilante hacker, becomes a key figure in a complex game of global dominance when he and his shadowy allies try to take down the corrupt corporation he works for.',1,1,2015,4,'PG','Trailers'),
(19,'Cobra Kai','Decades after their 1984 All Valley Karate Tournament bout, a middle-aged Daniel LaRusso and Johnny Lawrence find themselves martial-arts rivals again.',1,4,2018,4,'G','Trailers'),
(20,'jujutsu kaisen','A boy swallows a cursed talisman - the finger of a demon - and becomes cursed himself. He enters a shamans school to be able to locate the demons other body parts and thus exorcise himself.',1,3,2020,2,'R','Commentaries'),
(21,'Formula 1:Drive to survive','Docuseries following the FIA Formula One World Championship across multiple seasons.',1,1,2019,5,'PG-13','Trailers'),
(22,'The Queens Gambit','Orphaned at the tender age of nine, prodigious introvert Beth Harmon discovers and masters the game of chess in 1960s USA. But child stardom comes at a price. ',1,1,2020,1,'R','Trailers'),
(23,'Rome','A down-to-earth account of the lives of both illustrious and ordinary Romans set in the last days of the Roman Republic.',1,2,2005,1,'NC-17','Deleted Scenes'),
(24,'Keep breathing','When a small plane crashes in the middle of the Canadian wilderness, a lone woman must battle the elements and odds to survive.',1,1,2022,1,'R','Deleted Scenes'),
(25,'Manifest','A commercial airliner suddenly reappears after being missing for five years. As those aboard reintegrate into society, they experience guiding voices and visions of events yet to occur, and soon a deeper mystery unfolds.',1,3,2018,4,'PG','Trailers'),
(26,'Locke & Key','After their father is murdered under mysterious circumstances, the three Locke siblings and their mother move into their ancestral home, Keyhouse, which they discover is full of magical keys that may be connected to their fathers death.',1,4,2020,3,'R','Deleted Scenes'),
(27,'Chilling Adventures of Sabrina','As her 16th birthday nears, Sabrina must choose between the witch world of her family and the human world of her friends. Based on the Archie comic.',1,2,2018,4,'G','Trailers'),
(28,'Riverdale','While navigating the troubled waters of romance, school and family, Archie and his gang become entangled in dark Riverdale mysteries.',1,1,2017,6,'G','Commentaries'),
(29,'13 reasons why','Follows teenager Clay Jensen, in his quest to uncover the story behind his classmate and crush, Hannah, and her decision to end her life.',1,1,2017,4,'NC-17','Deleted Scenes');

SELECT * FROM series;

INSERT INTO season(season_id,title,season_year,episodes_per_season,series_id)
VALUES (1,'Season 1',2017,4,1),
(2,'Season 2',2018,2,1),
(3,'Season 3',2019,2,1),
(4,'Season 1',2022,4,2),
(5,'Season 1',2016,3,3),
(6,'Season 2',2017,3,3),
(7,'Season 3',2018,2,3),
(8,'Season 1',2022,4,4),
(9,'Season 1',2022,3,5),
(10,'Season 1',2022,4,6),
(11,'Season 1',2016,3,7),
(12,'Season 2',2017,3,7),
(13,'Season 3',2018,3,7),
(14,'Season 1',2019,3,8),
(15,'Season 2',2020,3,8),
(16,'Season 3',2021,3,8),
(17,'Season 1',2013,4,9),
(18,'Season 2',2017,4,9),
(19,'Season 3',2018,4,9),
(20,'Season 4',2020,4,9),
(21,'Season 1',2015,3,10),
(22,'Season 2',2016,3,10),
(23,'Season 1',2022,3,11),
(24,'Season 1',2017,3,12),
(25,'Season 2',2018,3,12),
(26,'Season 1',2008,2,13),
(27,'Season 2',2009,3,13),
(28,'Season 3',2010,3,13),
(29,'Season 1',2010,2,14),
(30,'Season 2',2011,3,14),
(31,'Season 1',2015,3,15),
(32,'Season 2',2016,3,15),
(33,'Season 1',2019,5,16),
(34,'Season 1',1990,5,17),
(35,'Season 1',2015,2,18),
(36,'Season 2',2016,2,18),
(37,'Season 1',2018,2,19),
(38,'Season 2',2019,2,19),
(39,'Season 1',2020,3,20),
(40,'Season 2',2021,3,20),
(41,'Season 1',2019,3,21),
(42,'Season 2',2020,4,21),
(43,'Season 3',2021,4,21),
(44,'Season 1',2020,5,22),
(45,'Season 1',2005,5,23),
(46,'Season 1',2022,3,24),
(47,'Season 1',2022,3,25),
(48,'Season 1',2020,3,26),
(49,'Season 2',2021,3,26),
(50,'Season 3',2022,2,26),
(51,'Season 1',2018,3,27),
(52,'Season 2',2019,2,27),
(53,'Season 1',2017,3,28),
(54,'Season 2',2018,2,28),
(55,'Season 1',2017,3,29),
(56,'Season 2',2018,2,29),
(57,'Season 3',2019,2,29),
(58,'Season 4',2020,2,29),
(59,'Season 5',2021,2,29),
(60,'Season 6',2022,2,29);


INSERT INTO episode(episode_id,title,length,season_id)
VALUES (1,'episode 1: Efectuar lo acordado',45, 1),
(2,'episode 2:Imprudencias letales',45,1),
(3,'episode 3:Errar al disparar',45,1),
(4,'episode 4:Caballo de Troya',45,1),
(5,'episode 1:Se acabaron las máscaras',45,2),
(6,'episode 2:La cabeza del plan',45,2),
(7,'episode 1:Hemos vuelto',45,3),
(8,'episode 2:Aikido',45,3),
(9,'episode 1:Sleep of the Just',40,4),
(10,'episode 2:Imperfect Hosts',40,4),
(11,'episode 3:Dream a Little Dream of Me',40,4),
(12,'episode 4:A Hope in Hell',40,4),
(13,'episode 1',50,5),
(14,'episode 2',50,5),
(15,'episode 3',50,5),
(16,'episode 1',45,6),
(17,'episode 2',45,6),
(18,'episode 3',45,6),
(19,'episode 1',50,7),
(20,'episode 2',50,7),
(21,'episode 1',45,8),
(22,'episode 2',45,8),
(23,'episode 3',45,8),
(24,'episode 4',45,8),
(25,'episode 1',45,9),
(26,'episode 2',45,9),
(27,'episode 3',45,9),
(28,'episode 1',45,10),
(29,'episode 2',45,10),
(30,'episode 3',45,10),
(31,'episode 4',45,10),
(32,'episode 1',45,11),
(33,'episode 2',45,11),
(34,'episode 3',45,11),
(35,'episode 1',35,12),
(36,'episode 2',35,12),
(37,'episode 3',35,12),
(38,'episode 1',40,13),
(39,'episode 2',40,13),
(40,'episode 3',40,13),
(41,'episode 1',55,14),
(42,'episode 2',55,14),
(43,'episode 3',55,14),
(44,'episode 1',50,15),
(45,'episode 2',50,15),
(46,'episode 3',50,15),
(47,'episode 1',45,16),
(48,'episode 2',45,16),
(49,'episode 3',45,16),
(50,'episode 1:To You, in 2000 Years: The Fall of Shiganshina, Part 1',20,17),
(51,'episode 2:That Day: The Fall of Shiganshina, Part 2',20,17),
(52,'episode 3:A Dim Light Amid Despair: Humanitys Comeback, Part 1',20,17),
(53,'episode 4:The Night of the Closing Ceremony: Humanitys Comeback, Part 2',20,17),
(54,'episode 1:Beast Titan',20,18),
(55,'episode 2:Im Home',20,18),
(56,'episode 3:Southwestward',20,18),
(57,'episode 4:Soldier',20,18),
(58,'episode 1:Smoke Signal',20,19),
(59,'episode 2:Pain',20,19),
(60,'episode 3:Old Story',20,19),
(61,'episode 4:Trust',20,19),
(62,'episode 1:The Other Side of the Sea',20,20),
(63,'episode 2:Midnight Train',20,20),
(64,'episode 3:The Door of Hope',20,20),
(65,'episode 4:From One Hand to Another',20,20),
(66,'episode 1',45,21),
(67,'episode 2',45,21),
(68,'episode 3',45,21),
(69,'episode 1',50,22),
(70,'episode 2',50,22),
(71,'episode 3',50,22),
(72,'episode 1',45,23),
(73,'episode 2',45,23),
(74,'episode 3',45,23),
(75,'episode 1:Redemption',40,41),
(76,'episode 2:The Art of War',40,41),
(77,'episode 3:The Next Generation',40,41),
(78,'episode 1:Lights Out',45,42),
(79,'episode 2:Boiling Point',45,42),
(80,'episode 3:Dogfight',45,42),
(81,'episode 4:Dark Days',45,42),
(82,'episode 1:Cash Is King',40,43),
(83,'episode 2:Back on track',40,43),
(84,'episode 3:Nobodys Fool',40,43),
(85,'episode 4:We Need to Talk About Ferrari',40,43);